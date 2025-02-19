cmake_minimum_required(VERSION 3.30 FATAL_ERROR)

project(Motor VERSION 0.1.0 DESCRIPTION "Motor - is a modern game engine for multiplayer games"
    HOMEPAGE_URL "https://github.com/dv-derkach/Motor" LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/Tools/CMake)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Configuration types:
#   Debug:          This configuration builds both engine and game code in debug configuration
#                   without optimizations. This makes things slower, but is easier to debug.
#
#   Development:    This configuration enables all but the most time-consuming engine and game code
#                   optimizations, which makes it ideal for development and performance reasons.
#
#   Test:           This configuration is the Release configuration, but with some console commands
#                   stats, and profiling tools enabled.
#
#   Release:        This is the configuration for optimal performance and shipping your game. This
#                   configuration strips out console commands, stats, and profiling tools.
set(CMAKE_CONFIGURATION_TYPES Debug Development Test Release)

# For single configuration generators, we need to ensure that the build configuration is supported.
get_property(generator_is_multi_config GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT generator_is_multi_config)
    if(NOT CMAKE_BUILD_TYPE IN_LIST CMAKE_CONFIGURATION_TYPES)
        message(FATAL_ERROR "Invalid build type: ${CMAKE_BUILD_TYPE}. Please use one of the "
            "following: ${CMAKE_CONFIGURATION_TYPES}"
        )
    endif()
endif()

message(${CMAKE_CXX_FLAGS_DEBUG})

add_subdirectory(code)
