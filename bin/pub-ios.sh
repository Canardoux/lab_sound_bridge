#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi


VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}


rm -r ./products/ios/*
mkdir -p ./products/ios
xcodebuild -create-xcframework \
    -framework ./build-ios/build-combo64/LabSoundBridge-iphoneos.xcarchive/Products/\@rpath/LabSoundBridge.framework \
    -framework ./build-ios/build-combo64/LabSoundBridge-iphonesimulator.xcarchive/Products/\@rpath/LabSoundBridge.framework \
    -output "./products/ios/LabSoundBridge.xcframework"
if [ $? -ne 0 ]; then
    echo "Error: cmake --build xcodebuild -create-xcframework  --config Release"
    exit -1
fi
#    -framework ./build-mac/build-universal/LabSoundBridge-macos.xcarchive/Products/\@rpath/LabSoundBridge.framework \


echo ''
echo '----------------'
echo '--- codesign ---'
echo '----------------'
echo $MACOS_CERTIFICATE | base64 --decode > build-ios/certificate.p12
security create-keychain -p abc123 build.keychain
security default-keychain -s build.keychain
security unlock-keychain -p abc123 build.keychain
security import ./build-ios/certificate.p12 -k build.keychain -P $MACOS_CERTIFICATE_PWD -T /usr/bin/codesign
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k abc123 build.keychain
codesignIdentity=`security find-identity -p codesigning -v | grep -Eo "[0-9A-F]{40}" | head -n 1`
/usr/bin/codesign --force -s $codesignIdentity ./products/ios/LabSoundBridge.xcframework/ios-arm64/LabSoundBridge.framework -v
/usr/bin/codesign --force -s $codesignIdentity ./products/ios/LabSoundBridge.xcframework -v
if [ $? -ne 0 ]; then
    echo "Error: /usr/bin/codesign --force -s $codesignIdentity ./build-ios/build-xcframework/LabSoundBridge.xcframework/ios-arm64/LabSoundBridge.framework -v"
    exit -1
fi
# rm -rf LabSoundBridge.xcframework/ios-arm64-simulator
# cp -a products/LabSoundBridge.framework build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator



git add .
git commit -m "lab_sound-bridge : Version $VERSION"
git pull origin
git push origin
if [ ! -z "$VERSION" ]; then
    git tag -f $VERSION
    git push  -f origin $VERSION
fi

pod trunk push lab_sound_bridge.podspec 
if [ $? -ne 0 ]; then
    echo "Error: trunk push lab_sound_bridge.podspec"
    exit -1
fi
