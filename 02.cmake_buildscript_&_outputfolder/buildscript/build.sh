#!/bin/bash

BUILD_DIRECTORY="../build"

CLEAN_TARGET="clean"

if [ -e "$BUILD_DIRECTORY" -a ! -d "$BUILD_DIRECTORY" ]; then
    rm -r $BUILD_DIRECTORY
fi


if [ ! -e "$BUILD_DIRECTORY" ]; then
    mkdir $BUILD_DIRECTORY
fi

if [ -e "$BUILD_DIRECTORY" -a -d "$BUILD_DIRECTORY" ]; then
    cp CMakeLists.txt $BUILD_DIRECTORY
    cd $BUILD_DIRECTORY
    cmake .
    make $1
fi


if [ "$1" = "$CLEAN_TARGET" -a -e "$BUILD_DIRECTORY" ]; then
    rm -r $BUILD_DIRECTORY
fi