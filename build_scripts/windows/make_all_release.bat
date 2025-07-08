@echo off
set osname=windows

set path2file=%~dp0
set CMAKE_BUILD_TYPE=Release
set CMAKE_SOURCE_DIR=%path2file%..\..
set CMAKE_BINARY_DIR=%path2file%..\..\out\%osname%\%CMAKE_BUILD_TYPE%

set target=all

cmake --build %CMAKE_BINARY_DIR% --target %target% -j %NUMBER_OF_PROCESSORS%