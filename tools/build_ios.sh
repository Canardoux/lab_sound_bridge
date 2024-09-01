#!/bin/bash

echo '--- build'
echo '---------'
rm -rf build
mkdir build
cmake -B ./build -G "Xcode" -DPLATFORM=OS64 -DCMAKE_TOOLCHAIN_FILE=../cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build --config Release"
    exit -1
fi

echo '--- build-simulator'
echo '-------------------'
rm -rf build-simulator
mkdir build-simulator
cmake -B ./build-simulator -G "Xcode" -DPLATFORM=SIMULATOR64 -DCMAKE_TOOLCHAIN_FILE=../cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-simulator --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-simulator --config Release"
    exit -1
fi


echo '--- build-simulator-arm64'
echo '-------------------------'
rm -rf  build-simulator-arm64
mkdir build-simulator-arm64
cmake -B ./build-simulator-arm64 -G "Xcode" -DPLATFORM=SIMULATORARM64 -DCMAKE_TOOLCHAIN_FILE=../cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-simulator-arm64 --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-simulator --config Release"
    exit -1
fi



echo '--- build-xcframework'
echo '---------------------' 
rm -rf build-xcframework
mkdir -p build-xcframework
xcodebuild -create-xcframework \
    -framework ./build-simulator-arm64/Release-iphonesimulator/LabSoundBridge.framework\
    -framework ./build/Release-iphoneos/LabSoundBridge.framework \
    -output "build-xcframework/LabSoundBridge.xcframework"
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-simulator --config Release"
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

echo '--- lipo'
echo '--------'
rm -rf ./products
mkdir -p ./products/LabSoundBridge.framework
lipo -create -output ./products/LabSoundBridge.framework/LabSoundBridge ./build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator/LabSoundBridge.framework/LabSoundBridge ./build-simulator/Release-iphonesimulator/LabSoundBridge.framework/LabSoundBridge 
if [ $? -ne 0 ]; then
    echo "Error: lipo -create -output ./products/LabSoundBridge.framework/LabSoundBridge ./build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge ./build-simulator-arm64/LabSoundBridge.framework/LabSoundBridge"
    #exit -1
fi
#cp ./products/LabSoundBridge.framework/LabSoundBridge ./build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator/LabSoundBridge.framework/

echo '--- codesign'
echo '------------'
security create-keychain -p abc123 build.keychain
security default-keychain -s build.keychain
security unlock-keychain -p abc123 build.keychain
security import certificate.p12 -k build.keychain -P $MACOS_CERTIFICATE_PWD -T /usr/bin/codesign
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k abc123 build.keychain
codesignIdentity=`security find-identity -p codesigning -v | grep -Eo "[0-9A-F]{40}" | head -n 1`
/usr/bin/codesign --force -s $codesignIdentity ./build-xcframework/LabSoundBridge.xcframework/ios-arm64/LabSoundBridge.framework -v
if [ $? -ne 0 ]; then
    echo "Error: /usr/bin/codesign --force -s $codesignIdentity ./products/LabSoundBridge.framework -v"
    exit -1
fi
rm -rf LabSoundBridge.xcframework/ios-arm64-simulator
cp -a products/LabSoundBridge.framework build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator


echo $MACOS_CERTIFICATE | base64 --decode > certificate.p12


tar -zcvf LabSoundBridge_ios.tar.gz -C ./build-xcframework LabSoundBridge.xcframework
echo "E.O.J"