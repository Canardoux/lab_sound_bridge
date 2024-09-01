#!/bin/bash
mkdir build
cmake -B ./build -DCMAKE_BUILD_TYPE=Release
cmake --build ./build --config Release
mv ./build/Release/LabSoundBridge.dll LabSoundBridge_windows_x64.dll 