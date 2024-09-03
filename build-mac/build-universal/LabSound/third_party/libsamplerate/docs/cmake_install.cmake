# Install script for directory: /Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/libsamplerate" TYPE FILE FILES
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/api.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/api_callback.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/api_full.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/api_misc.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/api_simple.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/bugs.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/download.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/faq.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/history.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/index.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/license.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/lists.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/quality.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/win32.md"
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/LabSound/third_party/libsamplerate/docs/SRC.png"
    )
endif()

