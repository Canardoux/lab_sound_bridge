# Install script for directory: /Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

set(CMAKE_BINARY_DIR "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal")

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/bin/Debug/LabSound_d.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound_d.framework/Versions/A/LabSound_d" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound_d.framework/Versions/A/LabSound_d")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound_d.framework/Versions/A/LabSound_d")
    endif()
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/bin/Release/LabSound.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound")
    endif()
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/bin/MinSizeRel/LabSound.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound")
    endif()
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/bin/RelWithDebInfo/LabSound.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/LabSound.framework/Versions/A/LabSound")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/LabSound" TYPE FILE FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/LabSound.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/LabSound/core" TYPE FILE FILES
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AnalyserNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioArray.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioBasicInspectorNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioBasicProcessorNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioBus.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioChannel.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioContext.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioDevice.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioHardwareDeviceNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioHardwareInputNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioListener.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioNodeInput.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioNodeOutput.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioParam.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioParamTimeline.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioProcessor.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioScheduledSourceNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioSetting.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioSourceProvider.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/AudioSummingJunction.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/BiquadFilterNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/ChannelMergerNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/ChannelSplitterNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/ConcurrentQueue.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/ConvolverNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/DelayNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/DynamicsCompressorNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/FloatPoint3D.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/GainNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/Macros.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/Mixing.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/NullDeviceNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/OscillatorNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/PannerNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/Profiler.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/SampledAudioNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/StereoPannerNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/WaveShaperNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/WaveTable.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/core/WindowFunctions.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/LabSound/extended" TYPE FILE FILES
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/ADSRNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/AudioContextLock.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/AudioFileReader.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/BPMDelayNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/ClipNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/DiodeNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/FunctionNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/GranulationNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/Logging.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/NoiseNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/PWMNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/PdNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/PeakCompNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/PingPongDelayNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/PolyBLEPNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/PowerMonitorNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/RealtimeAnalyser.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/RecorderNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/Registry.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/SfxrNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/SpatializationNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/SpectralMonitorNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/SupersawNode.h"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/include/LabSound/extended/Util.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/LabSound" TYPE DIRECTORY FILES
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/assets/hrtf"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/assets/images"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/assets/impulse"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/assets/json"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/assets/pd"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/assets/samples"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/LabSoundConfig.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/LabSound/LabSoundConfig.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/LabSound/bin/Debug/LabSoundExample.app" USE_SOURCE_PERMISSIONS)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/LabSound/bin/Release/LabSoundExample.app" USE_SOURCE_PERMISSIONS)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/LabSound/bin/MinSizeRel/LabSoundExample.app" USE_SOURCE_PERMISSIONS)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE DIRECTORY FILES "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/LabSound/bin/RelWithDebInfo/LabSoundExample.app" USE_SOURCE_PERMISSIONS)
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/LabSound/third_party/libnyquist/cmake_install.cmake")
  include("/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-mac/build-universal/LabSound/third_party/libsamplerate/cmake_install.cmake")

endif()

