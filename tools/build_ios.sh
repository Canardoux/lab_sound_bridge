#!/bin/bash

echo ''
echo '-------------'
echo '--- build ---'
echo '-------------'
rm -rf build-ios/build
mkdir build-ios/build
cmake -B ./build-ios/build -G "Xcode" -DPLATFORM=OS64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-ios/build --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-ios/build --config Release"
    exit -1
fi

echo ''
echo '-----------------------'
echo '--- build-simulator ---'
echo '-----------------------'
rm -rf build-ios/build-simulator
mkdir build-ios/build-simulator
cmake -B ./build-ios/build-simulator -G "Xcode" -DPLATFORM=SIMULATOR64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-ios/build-simulator --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-ios/build-simulator --config Release"
    exit -1
fi


echo ''
echo '-----------------------------'
echo '--- build-simulator-arm64 ---'
echo '-----------------------------'
rm -rf  build-ios/build-simulator-arm64
mkdir build-ios/build-simulator-arm64
cmake -B ./build-ios/build-simulator-arm64 -G "Xcode" -DPLATFORM=SIMULATORARM64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-ios/build-simulator-arm64 --config Release
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-ios/build-simulator-arm64 --config Release"
    exit -1
fi

echo ''
echo '-----------------------------'
echo '--- build-simulator-combo ---'
echo '-----------------------------'
rm -rf  build-ios/build-combo64
mkdir build-ios/build-combo64
cmake -B ./build-ios/build-combo64 -G "Xcode" --install-prefix ./build-ios/destination -DPLATFORM=OS64COMBINED -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-ios/build-combo64 --config Release --install-prefix ./build-ios/destination
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-ios/build-combo64 --config Release"
    exit -1
fi


echo ''
echo '-------------------------' 
echo '--- build-xcframework ---'
echo '-------------------------' 
rm -rf build-ios/LabSoundBridge.xcframework
xcodebuild -create-xcframework \
    -framework ./build-ios/build-simulator/Release-iphonesimulator/LabSoundBridge.framework\
    -framework ./build-ios/build/Release-iphoneos/LabSoundBridge.framework \
    -output "build-ios/LabSoundBridge.xcframework"
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
rm -rf ./build-ios/lipo
mkdir -p ./build-ios/lipo/LabSoundBridge.framework
cp ./build-ios/build/Release-iphoneos/LabSoundBridge.framework/* ./build-ios/lipo/LabSoundBridge.framework
lipo -create -output ./build-ios/lipo/LabSoundBridge.framework/LabSoundBridge ./build-ios/build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge build-ios/build-simulator/Release-iphonesimulator/LabSoundBridge.framework/LabSoundBridge 
if [ $? -ne 0 ]; then
    echo "Error: lipo -create -output ./build-ios/products/LabSoundBridge.framework/LabSoundBridge ./build-ios/build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge ./build-ios/build-simulator-arm64/LabSoundBridge.framework/LabSoundBridge"
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
###/usr/bin/codesign --force -s $codesignIdentity ./build-ios/build-xcframework/LabSoundBridge.xcframework/ios-arm64/LabSoundBridge.framework -v
###/usr/bin/codesign --force -s $codesignIdentity ./build-ios/build-xcframework/LabSoundBridge.xcframework -v
if [ $? -ne 0 ]; then
    echo "Error: /usr/bin/codesign --force -s $codesignIdentity ./build-ios/build-xcframework/LabSoundBridge.xcframework/ios-arm64/LabSoundBridge.framework -v"
###    exit -1
fi
# rm -rf LabSoundBridge.xcframework/ios-arm64-simulator
# cp -a products/LabSoundBridge.framework build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator


echo $MACOS_CERTIFICATE | base64 --decode > build-ios/certificate.p12


tar -zcvf build-ios/LabSoundBridge_ios.tar.gz -C ./build-ios/build-xcframework LabSoundBridge.xcframework
echo "*** lab_sound_bridge for iOS built"