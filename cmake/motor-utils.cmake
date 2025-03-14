function(motor_detect_sources result_var patterns)
    file(GLOB_RECURSE ${result_var} CONFIGURE_DEPENDS ${patterns})

    return(PROPAGATE ${result_var})
endfunction()

function(motor_add_subdirectories)
    file(GLOB subdirectories LIST_DIRECTORIES true "${CMAKE_CURRENT_SOURCE_DIR}/*")

    foreach(subdirectory IN LISTS subdirectories)
        if(EXISTS "${subdirectory}/CMakeLists.txt")
            add_subdirectory(${subdirectory})
        endif()
    endforeach()
endfunction()
