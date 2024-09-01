#!/bin/bash

sudo apt-get install libasound2-dev -y
mkdir build
cmake -B ./build -DCMAKE_BUILD_TYPE=Release -DLABSOUND_ASOUND=1 -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=./lib/
cmake --build ./build --config Release
mv ./build/lib/libLabSoundBridge.so libLabSoundBridge_linux_x64.so