#!/bin/bash

mkdir build

cmake -B ./build \
-DANDROID_ABI=$1 \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_PLATFORM=android-16 \
-DANDROID_NDK=$ANDROID_NDK_HOME \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake \
-DANDROID_TOOLCHAIN=clang \
-DCMAKE_SYSTEM_NAME=Android \
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=./lib/

cmake --build ./build --config Release

mv ./build/lib/libLabSoundBridge.so libLabSoundBridge_android_${1}.so