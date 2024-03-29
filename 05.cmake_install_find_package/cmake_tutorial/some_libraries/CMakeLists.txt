## CMakeLists.txt for SomeLibraries 

cmake_minimum_required(VERSION 3.5)

project(SomeLibraries VERSION 1.0 LANGUAGES CXX)

add_library(SomeLibraryA src/some_library_a.cpp)

target_include_directories(SomeLibraryA 
    PUBLIC 
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

add_library(SomeLibraryB src/some_library_b.cpp)

target_include_directories(SomeLibraryB 
    PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

install(TARGETS SomeLibraryA SomeLibraryB
    EXPORT SomeLibraries-export
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install(EXPORT SomeLibraries-export
    FILE SomeLibrariesTargets.cmake
    NAMESPACE SomeLibraries::
    DESTINATION lib/cmake/SomeLibraries
)

install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/include/some_libraries/some_library_a.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/include/some_libraries/some_library_b.hpp
    DESTINATION "include/SomeLibraries"
)

install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/SomeLibrariesConfig.cmake
    DESTINATION "lib/cmake/SomeLibraries" 
)