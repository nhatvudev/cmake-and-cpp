# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

project(subprojects)

# Add sub directories
#add_subdirectory(../modules/base64/build)
#add_subdirectory(../modules/main/build)


# set(BUILD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../build)
set(INTERMEDIATES ${BUILD_DIR}/.intermediates)
file(MAKE_DIRECTORY ${INTERMEDIATES})

add_subdirectory(../modules/main/buildscript ${INTERMEDIATES}/main)
add_subdirectory(../modules/base64/buildscript ${INTERMEDIATES}/base64)
#add_subdirectory(source_directory directory_for_outputs)