block()
    file(GLOB subdirs LIST_DIRECTORIES true "*")

    foreach(subdir IN LISTS subdirs)
        if(IS_DIRECTORY ${subdir} AND EXISTS ${subdir}/CMakeLists.txt)
            add_subdirectory(${subdir})
        endif()
    endforeach()
endblock()
