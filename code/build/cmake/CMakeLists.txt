file(GLOB_RECURSE cmake_files CONFIGURE_DEPENDS "*.cmake")

add_custom_target(SOURCES ${cmake_files})