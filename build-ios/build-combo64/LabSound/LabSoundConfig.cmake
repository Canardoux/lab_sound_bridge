
add_library(Lab::Sound STATIC IMPORTED)
set_property(TARGET Lab::Sound APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_property(TARGET Lab::Sound APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Lab::Sound PROPERTIES
  MAP_IMPORTED_CONFIG_MINSIZEREL Release
  MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
)
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LOCATION_RELEASE /usr/local/lib/LabSound.lib)
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LOCATION_DEBUG   /usr/local/lib/LabSound_d.lib)
set_property(TARGET Lab::Sound APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES /usr/local/include)

# libnyquist additional:
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE 
    "/usr/local/lib/samplerate.lib;/usr/local/lib/libnyquist.lib;/usr/local/lib/libwavpack.lib")
set_target_properties(Lab::Sound PROPERTIES IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG 
    "/usr/local/lib/samplerate.lib;/usr/local/lib/libnyquist_d.lib;/usr/local/lib/libwavpack_d.lib")
