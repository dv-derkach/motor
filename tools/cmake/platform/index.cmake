block()
    message(NOTICE "[platform] CMAKE_SYSTEM_NAME = " ${CMAKE_SYSTEM_NAME})

    # Automatically include detect_*.cmake files
    message(NOTICE "[platform] Searching platform detect files in " ${CMAKE_CURRENT_LIST_DIR})
    file(GLOB detect_files CONFIGURE_DEPENDS "${CMAKE_CURRENT_LIST_DIR}/detect_*.cmake")
    foreach(detect_file IN LISTS detect_files)
        message(NOTICE "[platform] Including platform detect file " ${detect_file})
        include(${detect_file})
    endforeach()

    if(NOT motor_platform_name)
        message(FATAL_ERROR "Failed to detect platform, this means that you are trying to build project for unsupported platform")
    endif()

    message(NOTICE "[platform] Detected platform is ${motor_platform_name}")

    set(platform_config_file ${CMAKE_CURRENT_LIST_DIR}/config_${motor_platform_postfix}.cmake)
    include(${platform_config_file})
    message(NOTICE "[platform] Included platform config file ${platform_config_file}")
endblock()
