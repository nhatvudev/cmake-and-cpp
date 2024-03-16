#!/bin/bash
if [ -e build ]; then
    echo -d build
else
    mkdir build
fi

if [ -d build ]; then
    cd build
    cmake ..
else
    echo "please delete the file names 'build'"
fi

