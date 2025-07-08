#!/usr/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

levels=2
go_up=""

for ((i=0; i<levels; i++)); do
    go_up="../$go_up"
done

go_up=${go_up%/}

BUILD_TYPE=Debug
SOURCE_DIR=$SCRIPT_DIR/$go_up
BINARY_DIR=$SCRIPT_DIR/$go_up/out/$OSNAME/${OSVER_MAJOR}_${OSVER_MINOR}/$BUILD_TYPE

#export GTEST_INSTALLATION_CMAKE_DIR="$(cygpath -u "$GTEST_INSTALLATION_CMAKE_DIR")";
export TOOLCHAIN_DIR="$(cygpath -u "$TOOLCHAIN_DIR")";
export TOOLCHAIN_FILE="$(cygpath -u "$TOOLCHAIN_FILE")";
export WIND_HOME="$(cygpath -u "$WIND_HOME")";
export VSB_DIR="$(cygpath -m "$VSB_DIR")";
export BSP_DIR="$(cygpath -u "$BSP_DIR")";

# If you want to define a path for the installation root other than the below one, you must set it before calling this script file.
if [ -v INSTALL_ROOT_DIR ]; then
    export INSTALL_ROOT_DIR="$(cygpath -u "$INSTALL_ROOT_DIR")";
else
    export INSTALL_ROOT_DIR="/d/in_house_software"   
fi

rm -rf $BINARY_DIR
mkdir -p $BINARY_DIR

cmake -G "Unix Makefiles" -S$SOURCE_DIR -B$BINARY_DIR -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_DIR/$TOOLCHAIN_FILE -DBOARD=$BOARDNAME