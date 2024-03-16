# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

project(subprojects)

# Add sub directories
#add_subdirectory(../modules/base64/build)
#add_subdirectory(../modules/main/build)


add_subdirectory(../modules/main/build ../modules/main/build)
add_subdirectory(../modules/base64/build ../modules/base64/build)
#add_subdirectory(source_directory directory_for_outputs)