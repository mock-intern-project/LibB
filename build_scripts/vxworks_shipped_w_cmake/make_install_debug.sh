#!/usr/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

levels=2
go_up=""

for ((i=0; i<levels; i++)); do
    go_up="../$go_up"
done

go_up=${go_up%/}

BUILD_TYPE=Debug
BINARY_DIR=$SCRIPT_DIR/$go_up/out/$OSNAME/${OSVER_MAJOR}_${OSVER_MINOR}/$BUILD_TYPE
TARGET=install

cmake --build $BINARY_DIR --target $TARGET