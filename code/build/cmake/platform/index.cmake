if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    include(platform/linux)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    include(platform/windows)
endif()
