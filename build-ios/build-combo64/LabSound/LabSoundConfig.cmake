
add_library(Lab::Sound STATIC IMPORTED)
set_property(TARGET Lab::Sound APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_property(TARGET Lab::Sound APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Lab::Sound PROPERTIES
  MAP_IMPORTED_CONFIG_MINSIZEREL Release
  MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
)
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LOCATION_RELEASE /Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/LabSound.lib)
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LOCATION_DEBUG   /Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/LabSound_d.lib)
set_property(TARGET Lab::Sound APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES /Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/include)

# libnyquist additional:
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE 
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/samplerate.lib;/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/libnyquist.lib;/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/libwavpack.lib")
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG 
    "/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/samplerate.lib;/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/libnyquist_d.lib;/Volumes/mac-H/larpoux/proj/tau/lab_sound_bridge/build-ios/destination/lib/libwavpack_d.lib")
