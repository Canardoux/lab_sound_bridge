#!/bin/bash

echo ''
echo '-------------'
echo '--- build ---'
echo '-------------'
rm -rf ios/build
mkdir ios/build
cmake -B ./ios/build -G "Xcode" -DPLATFORM=OS64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./ios/build --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./ios/build --config Release"
    exit -1
fi

echo ''
echo '-----------------------'
echo '--- build-simulator ---'
echo '-----------------------'
rm -rf ios/build-simulator
mkdir ios/build-simulator
cmake -B ./ios/build-simulator -G "Xcode" -DPLATFORM=SIMULATOR64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./ios/build-simulator --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./ios/build-simulator --config Release"
    exit -1
fi


echo ''
echo '-----------------------------'
echo '--- build-simulator-arm64 ---'
echo '-----------------------------'
rm -rf  ios/build-simulator-arm64
mkdir ios/build-simulator-arm64
cmake -B ./ios/build-simulator-arm64 -G "Xcode" -DPLATFORM=SIMULATORARM64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./ios/build-simulator-arm64 --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./ios/build-simulator-arm64 --config Release"
    exit -1
fi


echo ''
echo '-------------------------' 
echo '--- build-xcframework ---'
echo '-------------------------' 
rm -rf ios/build-xcframework
mkdir -p ios/build-xcframework
xcodebuild -create-xcframework \
    -framework ./ios/build-simulator-arm64/Release-iphonesimulator/LabSoundBridge.framework\
    -framework ./ios/build/Release-iphoneos/LabSoundBridge.framework \
    -output "ios/build-xcframework/LabSoundBridge.xcframework"
if [ $? -ne 0 ]; then
    echo "Error: cmake --build xcodebuild -create-xcframework  --config Release"
    exit -1
fi





#echo '--- lipo'
#echo '--------'
#rm -rf ./products
#mkdir -p ./products
#cp -r ./build/Release-iphoneos/LabSoundBridge.framework ./products
#lipo -create -output ./products/LabSoundBridge.framework/LabSoundBridge ./build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge ./build-simulator/Release-iphonesimulator/LabSoundBridge.framework/LabSoundBridge
#if [ $? -ne 0 ]; then
#    echo "Error: lipo -create -output ./products/LabSoundBridge.framework/LabSoundBridge ./build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge ./build-simulator/Release-iphonesimulator/LabSoundBridge.framework/LabSoundBridge"
#    exit -1
#fi

echo ''
echo '------------'
echo '--- lipo ---'
echo '------------'
rm -rf ./ios/products
mkdir -p ./ios/products/LabSoundBridge.framework
lipo -create -output ./ios/products/LabSoundBridge.framework/LabSoundBridge ./ios/build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator/LabSoundBridge.framework/LabSoundBridge ./ios/build-simulator/Release-iphonesimulator/LabSoundBridge.framework/LabSoundBridge 
if [ $? -ne 0 ]; then
    echo "Error: lipo -create -output ./ios/products/LabSoundBridge.framework/LabSoundBridge ./ios/build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge ./ios/build-simulator-arm64/LabSoundBridge.framework/LabSoundBridge"
    #exit -1
fi
####cp ./products/LabSoundBridge.framework/LabSoundBridge ./build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator/LabSoundBridge.framework/

echo ''
echo '----------------'
echo '--- codesign ---'
echo '----------------'
security create-keychain -p abc123 build.keychain
security default-keychain -s build.keychain
security unlock-keychain -p abc123 build.keychain
security import certificate.p12 -k build.keychain -P $MACOS_CERTIFICATE_PWD -T /usr/bin/codesign
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k abc123 build.keychain
codesignIdentity=`security find-identity -p codesigning -v | grep -Eo "[0-9A-F]{40}" | head -n 1`
/usr/bin/codesign --force -s $codesignIdentity ./ios/build-xcframework/LabSoundBridge.xcframework/ios-arm64/LabSoundBridge.framework -v
/usr/bin/codesign --force -s $codesignIdentity ./ios/build-xcframework/LabSoundBridge.xcframework -v
if [ $? -ne 0 ]; then
    echo "Error: /usr/bin/codesign --force -s $codesignIdentity ./ios/build-xcframework/LabSoundBridge.xcframework/ios-arm64/LabSoundBridge.framework -v"
    exit -1
fi
# rm -rf LabSoundBridge.xcframework/ios-arm64-simulator
# cp -a products/LabSoundBridge.framework build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator


echo $MACOS_CERTIFICATE | base64 --decode > ios/certificate.p12


tar -zcvf ios/LabSoundBridge_ios.tar.gz -C ./ios/build-xcframework LabSoundBridge.xcframework
echo "*** lab_sound_bridge for iOS built"