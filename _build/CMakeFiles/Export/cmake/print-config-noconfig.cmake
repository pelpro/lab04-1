#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "print" for configuration ""
set_property(TARGET print APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(print PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libprint.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS print )
list(APPEND _IMPORT_CHECK_FILES_FOR_print "${_IMPORT_PREFIX}/lib/libprint.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
