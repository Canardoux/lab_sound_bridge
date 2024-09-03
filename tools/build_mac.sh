#!/bin/bash

#mkdir build
#cmake -B ./build -DCMAKE_BUILD_TYPE=Release
#cmake --build ./build --config Release

echo ''
echo '---------------------------'
echo '--- build-mac-universal ---'
echo '---------------------------'
rm -rf  build-mac/build-universal
mkdir -p build-mac/build-universal
cmake -B ./build-mac/build-universal -G "Xcode" -DPLATFORM=MAC_UNIVERSAL -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-mac/build-universal --config Release 
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-mac/build-universal --config Release"
    exit -1
fi


cd build-mac/build-universal
rm -rf ./LabSoundBridge-iphoneos.xcarchive ./LabSoundBridge-iphonesimulator.xcarchive LabSoundBridge.xcframework

xcodebuild archive -scheme LabSoundBridge \
    -archivePath ./LabSoundBridge-macos.xcarchive \
    -sdk macosx \
    SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
if [ $? -ne 0 ]; then
    echo "Error: xcodebuild archive -scheme LabSoundBridge"
    exit -1
fi

exit 0

echo $MACOS_CERTIFICATE | base64 --decode > certificate.p12
security create-keychain -p abc123 build.keychain
security default-keychain -s build.keychain
security unlock-keychain -p abc123 build.keychain
security import certificate.p12 -k build.keychain -P $MACOS_CERTIFICATE_PWD -T /usr/bin/codesign
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k abc123 build.keychain
codesignIdentity=`security find-identity -p codesigning -v | grep -Eo "[0-9A-F]{40}" | head -n 1`
/usr/bin/codesign --force -s $codesignIdentity ./build/LabSoundBridge.framework -v

tar -zcvf LabSoundBridge_macos_x64.tar.gz -C ./build LabSoundBridge.framework
