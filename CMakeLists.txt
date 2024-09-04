cmake_minimum_required(VERSION 3.13)
project(LabSoundBridge)
add_definitions(-DMA_NO_AAUDIO)
if (WIN32)
    # target_compile_options(${proj} PRIVATE /Zi)
    # target_compile_definitions(${proj} PRIVATE __WINDOWS_WASAPI__=1)
    # # TODO: These vars are for libniquist and should be set in the find libynquist script.
    # target_compile_definitions(${proj} PRIVATE HAVE_STDINT_H=1 HAVE_SINF=1)
elseif (APPLE)
    # add_compile_options(-std=c++0x)
    set (CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -std=c++0x -stdlib=libc++ -g3 -Wall -O0")
elseif (ANDROID)
    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s -fPIC")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s -fPIC")
    # target_compile_options(${proj} PRIVATE -fPIC)
    # target_compile_definitions(${proj} PRIVATE USE_KISS_FFT=1)
    # target_link_libraries(${proj} OpenSLES)
    # if(LABSOUND_JACK)
    #     target_link_libraries(${proj} jack)
    #     target_compile_definitions(${proj} PRIVATE __UNIX_JACK__=1)
    # endif()
    # if(LABSOUND_PULSE)
    #     target_link_libraries(${proj} pulse pulse-simple)
    #     target_compile_definitions(${proj} PRIVATE __LINUX_PULSE__=1)
    # endif()
    # if(LABSOUND_ASOUND)
    #     target_link_libraries(${proj} asound)
    #     target_compile_definitions(${proj} PRIVATE __LINUX_ASOUND__=1)
    # endif()
    # # TODO: These vars are for libnyquist and should be set in the find libynquist script.
    # # TODO: libnyquist's loadabc calls getenv and setenv. That's undesirable.
    # target_compile_definitions(${proj} PRIVATE HAVE_STDINT_H=1 HAVE_SETENV=1 HAVE_SINF=1)
elseif(UNIX)
    # add_compile_options(-std=c++0x)
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -std=c++0x -stdlib=libc++ -g3 -Wall -O0")
    set( CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -fPIC" )
    # target_link_libraries(${proj} pthread)
    # target_compile_options(${proj} PRIVATE -fPIC)
    # target_compile_definitions(${proj} PRIVATE USE_KISS_FFT=1)
    # if(LABSOUND_JACK)
    #     target_link_libraries(${proj} jack)
    #     target_compile_definitions(${proj} PRIVATE __UNIX_JACK__=1)
    # endif()
    # if(LABSOUND_PULSE)
    #     target_link_libraries(${proj} pulse pulse-simple)
    #     target_compile_definitions(${proj} PRIVATE __LINUX_PULSE__=1)
    # endif()
    # if(LABSOUND_ASOUND)
    #     target_link_libraries(${proj} asound)
    #     target_compile_definitions(${proj} PRIVATE __LINUX_ASOUND__=1)
    # endif()
    # # TODO: These vars are for libnyquist and should be set in the find libynquist script.
    # # TODO: libnyquist's loadabc calls getenv and setenv. That's undesirable.
    # target_compile_definitions(${proj} PRIVATE HAVE_STDINT_H=1 HAVE_SETENV=1 HAVE_SINF=1)
endif()

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release")
endif()

if (APPLE)
    if(CMAKE_OSX_SYSROOT MATCHES ".*iphoneos.*" OR CMAKE_OSX_SYSROOT MATCHES ".*iphonesimulator.*" OR CMAKE_OSX_SYSROOT MATCHES ".*iPhoneOS.*" OR CMAKE_OSX_SYSROOT MATCHES ".*iPhoneSimulator.*")
       set(DARWIN_LIBS
           "-framework Foundation"
           "-framework AVFoundation"
           "-framework AudioToolbox"
           "-framework Accelerate"
           )
    else()
        set(DARWIN_LIBS
            "-framework AudioToolbox"
            "-framework AudioUnit"
            "-framework Accelerate"
            "-framework CoreAudio"
            "-framework Cocoa")
    endif()
endif()

SET(BUILD_EXAMPLE OFF CACHE BOOL "Build example application")

set(LABSOUND_BRIDGE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(LabSound EXCLUDE_FROM_ALL)

file(GLOB dart_api_h      "${LABSOUND_BRIDGE_ROOT}/bridge/dart_api/*")

add_library(LabSoundBridge SHARED
    ./bridge/LabSoundBridge.cpp
    ${dart_api_h}
)

target_link_libraries(LabSoundBridge LabSound ${DARWIN_LIBS})

if (APPLE)
    set_target_properties(LabSoundBridge PROPERTIES
        FRAMEWORK TRUE
        FRAMEWORK_VERSION A
        MACOSX_FRAMEWORK_IDENTIFIER com.Lab.LabSound.bridge
        MACOSX_DEPLOYMENT_TARGET 10.11
        VERSION 0.13.0
        SOVERSION 1.0.0
        # PUBLIC_HEADER "${labsnd_core_h} ${labsnd_extended_h}"
    )
    # set_property(SOURCE ${labsnd_core_h}
    #     PROPERTY MACOSX_PACKAGE_LOCATION Headers/LabSound/core)
    # set_property(SOURCE ${labsnd_extended_h}
    #     PROPERTY MACOSX_PACKAGE_LOCATION Headers/LabSound/extended)
else()
    # set_target_properties(LabSoundBridge
    #     PROPERTIES
    #     OUTPUT_NAME_DEBUG LabSoundBridge_d
    # )
endif()

install(TARGETS LabSoundBridge
    LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}
    FRAMEWORK DESTINATION ${CMAKE_INSTALL_PREFIX}
)
