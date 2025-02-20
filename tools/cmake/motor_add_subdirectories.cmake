include(motor_add_directories)

# Adds all subdirectories in specific directory.
#
# Params:
#   parent_directory - Parent directory
#
# Example usage:
#   motor_add_subdirectories("${CMAKE_CURRENT_SOURCE_DIR}") - adds all subdirectories in current source directory
function(motor_add_subdirectories directories)
    list(APPEND directories ${ARGN})

    foreach(directory IN LISTS directories)
        file(GLOB subdirectories CONFIGURE_DEPENDS LIST_DIRECTORIES true "${directory}/*")

        foreach(subdirectory IN LISTS subdirectories)
            if(IS_DIRECTORY ${subdirectory} AND EXISTS ${subdirectory}/CMakeLists.txt)
                list(APPEND directories_to_add ${subdirectory})
            endif()
        endforeach()
    endforeach()

    motor_add_directories(${directories_to_add})
endfunction()
