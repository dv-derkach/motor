# Recursive globs files in specific directory.
#
# Params:
#   result_var - Variable to store the result.
#   directory - Directory where the files are located
#   patterns - Patterns for globbing files.
#
# Example usage:
#   rover_glob_files(my_result_var "${CMAKE_CURRENT_SOURCE_DIR}" "*.cpp" "*.h") - returns any .cpp or .h files in current source directory
function(motor_glob_files result_var directory patterns)
    list(APPEND patterns ${ARGN})

    foreach(pattern IN LISTS patterns)
        list(APPEND _patterns "${directory}/${pattern}")
    endforeach()

    file(GLOB_RECURSE ${result_var} CONFIGURE_DEPENDS ${_patterns})

    return(PROPAGATE ${result_var})
endfunction()
