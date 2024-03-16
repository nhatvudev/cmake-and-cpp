# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(main)

# Create a sources variable with a link to all cpp files to compile

set(SRC_PATH ../src)
set(OUT_PATH ./output)

FILE(GLOB SOURCES
    ${SRC_PATH}/cpp/*.c
    ${SRC_PATH}/cpp/*.cpp)

#set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUT_PATH})


#set_target_properties( targets...
#    PROPERTIES
#    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
#    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
#    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
#)


# Add an executable with the above sources
add_executable(${PROJECT_NAME} ${SOURCES})

# Set the directories that should be included in the build command for this target
# when running g++ these will be included as -I/directory/path/
#target_include_directories(${PROJECT_NAME}
#    PRIVATE 
#        ${SRC_PATH}/headers
#)


target_link_libraries(${PROJECT_NAME}
    sub::mylibbase64
)

# the use of add_dependencies with arguments which are libraries 
# already added with target_link_libraries is redundant.
add_dependencies(${PROJECT_NAME}
                   sub::mylibbase64)