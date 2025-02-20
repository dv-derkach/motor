cmake_minimum_required(VERSION 3.30 FATAL_ERROR)

project(
    Motor
    VERSION 0.1.0
    DESCRIPTION "Motor - is a modern game engine for multiplayer games"
    HOMEPAGE_URL "https://github.com/dv-derkach/Motor"
    LANGUAGES CXX
)

list(APPEND
    CMAKE_MODULE_PATH
    ${PROJECT_SOURCE_DIR}/code/build/cmake
)

include(utils/motor_add_directories)
include(utils/motor_add_subdirectories)
include(utils/motor_glob_files)

# Set C++20 standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Configuration types:
#   Debug:          This configuration builds both engine and game code in debug configuration
#                   without optimizations. This makes things slower, but is easier to debug. Also
#                   this configuration includes all console commands, stats and profilling tools.
#
#   Development:    This configuration builds both engine and game code with optimisations and
#                   excludes debug symbols. Also this configuration includes all console commands,
#                   stats and profilling tools.
#
#   Release:        This is the configuration for optimal performance and shipping your game. This
#                   configuration strips out console commands, stats, and profiling tools.
set(CMAKE_CONFIGURATION_TYPES Debug Development Release)

# For single configuration generators, we need to ensure that the build configuration is supported.
get_property(generator_is_multi_config GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT generator_is_multi_config)
    if(NOT CMAKE_BUILD_TYPE IN_LIST CMAKE_CONFIGURATION_TYPES)
        message(FATAL_ERROR "Invalid build type: ${CMAKE_BUILD_TYPE}. Please use one of the "
            "following: ${CMAKE_CONFIGURATION_TYPES}"
        )
    endif()
endif()

# Set compiler and linker flags for MSVC C++ compiler
if(MSVC)
    set(CMAKE_CXX_FLAGS_DEBUG "/Ob0 /Od /RTC1")
    set(CMAKE_CXX_FLAGS_DEVELOPMENT "/O2 /Ob2 /DNDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE "/O2 /Ob2 /DNDEBUG")

    set(CMAKE_EXE_LINKER_FLAGS_DEBUG "/debug /INCREMENTAL")
    set(CMAKE_EXE_LINKER_FLAGS_DEVELOPMENT "/INCREMENTAL:NO")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "/INCREMENTAL:NO")
endif()

# Set compiler and linker flags for Clang and GNU C++ compilers
if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(CMAKE_CXX_FLAGS_DEBUG "-g")
    set(CMAKE_CXX_FLAGS_DEVELOPMENT "-O3 -DNDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")
endif()

motor_add_directories(code)
