motor_glob_files(sources "src" "*.cpp" "*.hpp")

add_executable(client_main ${sources})

target_include_directories(client_main PRIVATE "src")
