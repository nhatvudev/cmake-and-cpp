# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(base64)

# Create a sources variable with a link to all cpp files to compile

set(SRC_PATH ../src)
set(OUT_PATH ./output)

FILE(GLOB SOURCES
    ${SRC_PATH}/cpp/*.c
    ${SRC_PATH}/cpp/*.cpp)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUT_PATH})
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUT_PATH})
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUT_PATH})


#set_target_properties( targets...
#    PROPERTIES
#    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
#    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
#    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
#)


# Add a library with the above sources
add_library(${PROJECT_NAME} ${SOURCES})
add_library(sub::mylibbase64 ALIAS ${PROJECT_NAME})


# Set the directories that should be included in the build command for this target
# when running g++ these will be included as -I/directory/path/
target_include_directories(${PROJECT_NAME} 
    PUBLIC 
        ${SRC_PATH}/headers
)


