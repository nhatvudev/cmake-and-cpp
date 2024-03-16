
#!/bin/bash

CURR_DIR=$(dirname "$(readlink -e $0)")
export BUILD_DIR="$CURR_DIR"/../build
UTEST_DIR=$CURR_DIR/tests/ut_test

function show_help() {
    echo "Usage: $0 <option> <mode> <module>"
    echo "Options: build, clean, utest"
    echo "Modes: debug, release"
    echo "Modules: base64, main,..."
}

function do_build() {
    if [ ! -d "$BUILD_DIR" ]; then
        echo "mkdir -p $BUILD_DIR"
        mkdir -p "$BUILD_DIR"
    else
        echo "There is build directory"
    fi

    cd "$BUILD_DIR"
    rm -rf *
    # source "$CURR_DIR"/env.sh
    echo "debug=$1"
    if [ "$1" == "debug" ] ||  [ "$1" == "DEBUG" ]; then
        echo "build for DEBUG"
        cmake -DTARGET="$2" -DBUILD_DIR="$BUILD_DIR" -DCMAKE_BUILD_TYPE=DEBUG -DBUILD_SHARED_LIBS=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON "$CURR_DIR"
    else
        echo "build for RELEASE"
        cmake -DTARGET="$2" -DBUILD_DIR="$BUILD_DIR" -DBUILD_SHARED_LIBS=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON "$CURR_DIR"
    fi
    # make $2
    cd "$BUILD_DIR"/.intermediates/"$2" && make $2
    cd "$CURR_DIR"
}

function do_clean() {
    rm -rf "$CURR_DIR"/../build
}

function do_unit_test() {
    chmod +x "$UTEST_DIR"/unittest.sh
    "$UTEST_DIR"/unittest.sh
}


if [ "$#" -ge 1 ]; then 
    if [ "$1" == "build" ]; then
        do_build $2 $3
    exit 0
    elif [ "$1" == "clean" ]; then
        do_clean
        exit 0
    elif [ "$1" == "utest" ]; then
        do_unit_test
        exit 0
    fi
fi

show_help

