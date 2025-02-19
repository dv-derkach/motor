file(GLOB_RECURSE sources CONFIGURE_DEPENDS "src/*.cpp" "src/*.hpp" "include/*.hpp")

add_library(motor-core ${sources})

target_include_directories(motor-core PRIVATE src PUBLIC include)
