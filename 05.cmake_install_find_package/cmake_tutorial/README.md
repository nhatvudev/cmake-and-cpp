# CMAKE TUTORIAL

## 1. file/folder tree
<pre>
cmake_tutorial
|__ app                 # MyApplication package 
|   |__ CMakeLists.txt
|   |__ src
|       |__ main.cpp
|    
|
|__ my_libraries       # MyLibraries package
|   |__ CMakeLists.txt
|   |__ cmake
|   |   |__ MyLibrariesConfig.cmake
|   |
|   |__ include
|   |   |__ my_libraries
|   |      |__ my_library_a.hpp
|   |
|   |__ src
|       |__ my_library_a.cpp
|   
| 
|__ some_libraries     # SomeLibraries package
   |__ CMakeLists.txt
   |__ cmake
   |   |__ SomeLibrariesConfig.cmake
   |
   |__ include
   |   |__ some_libraries
   |     |__ some_library_a.hpp
   |     |__ some_library_b.hpp
   |__ src
       |__ some_library_a.cpp
       |__ some_library_b.cpp

</pre>

## 2. Pay attention
- When run every "make install", you should copy location where your files are copied into so that you can remove them after practising.
- To me, paths of installed files are:

> nhatvtm@nhatvtm-Vostro-3670:~/Desktop/nhap/cmake_tutorial/some_libraries/build$ sudo make install \
[ 50%] Built target SomeLibraryB \
[100%] Built target SomeLibraryA \
Install the project... \
-- Install configuration: "" \
-- Installing: /usr/local/lib/libSomeLibraryA.a \
-- Installing: /usr/local/lib/libSomeLibraryB.a \
-- Installing: /usr/local/lib/cmake/SomeLibraries/SomeLibrariesTargets.cmake \
-- Installing: /usr/local/lib/cmake/SomeLibraries/SomeLibrariesTargets-noconfig.cmake \
-- Installing: /usr/local/include/SomeLibraries/some_library_a.hpp \
-- Installing: /usr/local/include/SomeLibraries/some_library_b.hpp \
-- Installing: /usr/local/lib/cmake/SomeLibraries/SomeLibrariesConfig.cmake

and

> nhatvtm@nhatvtm-Vostro-3670:~/Desktop/nhap/cmake_tutorial/my_libraries/build$ sudo make install
Scanning dependencies of target MyLibraryA \
[ 50%] Building CXX object CMakeFiles/MyLibraryA.dir/src/my_library_a.cpp.o \
[100%] Linking CXX static library libMyLibraryA.a \
[100%] Built target MyLibraryA \
Install the project... \
-- Install configuration: "" \
-- Installing: /usr/local/lib/libMyLibraryA.a \
-- Installing: /usr/local/lib/cmake/MyLibraries/MyLibrariesTargets.cmake \
-- Installing: /usr/local/lib/cmake/MyLibraries/MyLibrariesTargets-noconfig.cmake \
-- Installing: /usr/local/include/MyLibraries/my_library_a.hpp \
-- Installing: /usr/local/lib/cmake/MyLibraries/MyLibrariesConfig.cmake

## 3. Step by step
- Build and install some_libraries:
>   cd some_libraries \
    mkdir build \
    cd build \
    cmake .. \
    sudo make install
    
- Build and install my_libraries:
>   cd my_libraries \
    mkdir build \
    cd build \
    cmake .. \
    sudo make install

- Build app
>   cd app \
    mkdir build \
    cd build \
    cmake .. \
    make

- Run app
>   ./MyApplication

## 4. References
- Websites:
https://levelup.gitconnected.com/simple-modern-cmake-tutorial-b0c1c362cd2c
https://levelup.gitconnected.com/simple-modern-cmake-tutorial-part-2-285614d6a0ce

- I printed them to 2 pdf files: \
cmake - example of install and find_package_01.pdf \
cmake - example of install and find_package_02.pdf

- 1st file is as the tutorial in this README.md. 2nd file adds version of libraries.
