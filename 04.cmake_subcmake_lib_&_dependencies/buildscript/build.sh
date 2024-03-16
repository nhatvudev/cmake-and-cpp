#!/bin/bash

ARGUMENTS="$(printf "${1+ %q}" "$@")"
ROOT_PATH=$PWD
BUILD_DIRECTORY="../build"
CLEAN_TARGET="clean"

SUB_BUILD_SCRIPTS="../modules/base64/buildscript \
    ../modules/main/buildscript"

clean()
{
    echo 'clean()'
    if [ -e "$BUILD_DIRECTORY" ]; then
        rm -r $BUILD_DIRECTORY
    fi
}

run_sub_scripts()
{
    for sub_build_script in $SUB_BUILD_SCRIPTS; do
        cd "$sub_build_script/"
        ./build.sh $ARGUMENTS
        cd "$ROOT_PATH"
    done
}

run_make()
{
    if [ "$1" != "$CLEAN_TARGET" -a -e "$BUILD_DIRECTORY" ]; then
        if [ -e "$BUILD_DIRECTORY" -a -d "$BUILD_DIRECTORY" ]; then
            cp CMakeLists.txt $BUILD_DIRECTORY
            cd $BUILD_DIRECTORY
            cmake .
            make $1
        fi
    fi
}

run_sub_scripts
if [ "$1" != "$CLEAN_TARGET" ]; then
    
    if [ -e "$BUILD_DIRECTORY" -a ! -d "$BUILD_DIRECTORY" ]; then
        rm -r $BUILD_DIRECTORY
    fi

    if [ ! -e "$BUILD_DIRECTORY" ]; then
        mkdir $BUILD_DIRECTORY
    fi

    run_make

else
    clean
fi
