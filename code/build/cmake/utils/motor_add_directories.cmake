# Adds multiple directories at one call
#
# Params:
#   directories - a list of directories
#
# Examples:
#   motor_add_directories(Foo Bar) - adds directories Foo and Bar
function(motor_add_directories directories)
    list(APPEND directories ${ARGN})

    foreach(directory IN LISTS directories)
        add_subdirectory(${directory})
    endforeach()
endfunction()
