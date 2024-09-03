#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi


VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}


mkdir -p ./products/ios
xcodebuild -create-xcframework \
    -framework ./build-ios/build-combo/LabSoundBridge-iphoneos.xcarchive/Products/\@rpath/LabSoundBridge.framework \
    -framework ./build-ios/build-combo/LabSoundBridge-iphonesimulator.xcarchive/Products/\@rpath/LabSoundBridge.framework \
    -output "./products/ios/LabSoundBridge.xcframework"
if [ $? -ne 0 ]; then
    echo "Error: cmake --build xcodebuild -create-xcframework  --config Release"
    exit -1
fi

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
