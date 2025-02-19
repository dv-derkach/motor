file(GLOB_RECURSE source_files CONFIGURE_DEPENDS "src/*.cpp" "src/*.hpp" "include/*.hpp")

add_executable(renderer ${source_files})

target_include_directories(renderer PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)


