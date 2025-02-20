motor_glob_files(sources "src" "*.cpp" "*.hpp")

add_executable(server_main ${sources})

target_include_directories(editor_main PRIVATE "src")
