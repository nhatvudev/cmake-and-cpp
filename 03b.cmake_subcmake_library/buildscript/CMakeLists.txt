# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

project(subprojects)

# Add sub directories
set(INTERMEDIATES ${BUILD_DIR}/.intermediates)
file(MAKE_DIRECTORY ${INTERMEDIATES})

if (${TARGET} STREQUAL "main")
    add_subdirectory(../modules/main/buildscript ${INTERMEDIATES}/main)
endif()

if ((${TARGET} STREQUAL "base64") OR (${TARGET} STREQUAL "main"))
    add_subdirectory(../modules/base64/buildscript ${INTERMEDIATES}/base64)
endif()

#add_subdirectory(source_directory directory_for_outputs)