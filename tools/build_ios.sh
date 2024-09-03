#!/bin/bash

#echo ''
#echo '-------------'
#echo '--- build ---'
#echo '-------------'
#rm -rf build-ios/build
#mkdir build-ios/build
#cmake -B ./build-ios/build -G "Xcode" -DPLATFORM=OS64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
#cmake --build ./build-ios/build --config Release
#if [ $? -ne 0 ]; then
#    echo "Error: cmake --build ./build-ios/build --config Release"
#    exit -1
#fi

#echo ''
#echo '-----------------------'
#echo '--- build-simulator ---'
#echo '-----------------------'
#rm -rf build-ios/build-simulator
#mkdir build-ios/build-simulator
#cmake -B ./build-ios/build-simulator -G "Xcode" -DPLATFORM=SIMULATOR64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
#cmake --build ./build-ios/build-simulator --config Release
#if [ $? -ne 0 ]; then
#    echo "Error: cmake --build ./build-ios/build-simulator --config Release"
#    exit -1
#fi


#echo ''
#echo '-----------------------------'
#echo '--- build-simulator-arm64 ---'
#echo '-----------------------------'
#rm -rf  build-ios/build-simulator-arm64
#mkdir build-ios/build-simulator-arm64
#cmake -B ./build-ios/build-simulator-arm64 -G "Xcode" -DPLATFORM=SIMULATORARM64 -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
#cmake --build ./build-ios/build-simulator-arm64 --config Release
#if [ $? -ne 0 ]; then
#    echo "Error: cmake --build ./build-ios/build-simulator-arm64 --config Release"
#    exit -1
#fi

echo ''
echo '-----------------------------'
echo '--- build-simulator-combo ---'
echo '-----------------------------'
rm -rf  build-ios/build-combo64
mkdir -p build-ios/build-combo64
cmake -B ./build-ios/build-combo64 -G "Xcode" -DPLATFORM=OS64COMBINED -DCMAKE_TOOLCHAIN_FILE=cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-ios/build-combo64 --config Release 
if [ $? -ne 0 ]; then
    echo "Error: cmake --build ./build-ios/build-combo64 --config Release"
    exit -1
fi


cd build-ios/build-combo64
rm -rf ./LabSoundBridge-iphoneos.xcarchive ./LabSoundBridge-iphonesimulator.xcarchive LabSoundBridge.xcframework

xcodebuild archive -scheme LabSoundBridge \
    -archivePath ./LabSoundBridge-iphoneos.xcarchive \
    -sdk iphoneos \
    SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
if [ $? -ne 0 ]; then
    echo "Error: xcodebuild archive -scheme LabSoundBridge"
    exit -1
fi

xcodebuild archive -scheme LabSoundBridge \
    -archivePath ./LabSoundBridge-iphonesimulator.xcarchive \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
if [ $? -ne 0 ]; then
    echo "Error: xcodebuild archive -scheme LabSoundBridge"
    exit -1
fi

cd ../..


#echo ''
#echo '-------------------------' 
#echo '--- build-xcframework ---'
#echo '-------------------------' 
#rm -rf build-ios/LabSoundBridge.xcframework
#xcodebuild -create-xcframework \
#    -framework ./build-ios/build-simulator-arm64/Release-iphonesimulator/LabSoundBridge.framework\
#    -framework ./build-ios/build/Release-iphoneos/LabSoundBridge.framework \
#    -output "build-ios/LabSoundBridge.xcframework"
#if [ $? -ne 0 ]; then
#    echo "Error: cmake --build xcodebuild -create-xcframework  --config Release"
#    exit -1
#fi





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

#echo ''
#echo '------------'
#echo '--- lipo ---'
#echo '------------'
#rm -rf ./build-ios/lipo
#mkdir -p ./build-ios/lipo/LabSoundBridge.framework
#cp ./build-ios/build/Release-iphoneos/LabSoundBridge.framework/* ./build-ios/lipo/LabSoundBridge.framework
#lipo -create -output ./build-ios/lipo/LabSoundBridge.framework/LabSoundBridge ./build-ios/build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge build-ios/build-simulator/Release-iphonesimulator/LabSoundBridge.framework/LabSoundBridge 
#if [ $? -ne 0 ]; then
#    echo "Error: lipo -create -output ./build-ios/products/LabSoundBridge.framework/LabSoundBridge ./build-ios/build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge ./build-ios/build-simulator-arm64/LabSoundBridge.framework/LabSoundBridge"
#    #exit -1
#fi
####cp ./products/LabSoundBridge.framework/LabSoundBridge ./build-xcframework/LabSoundBridge.xcframework/ios-arm64-simulator/LabSoundBridge.framework/




#tar -zcvf build-ios/LabSoundBridge_ios.tar.gz -C ./build-ios/build-xcframework LabSoundBridge.xcframework
echo "*** lab_sound_bridge for iOS built"