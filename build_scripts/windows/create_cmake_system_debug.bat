@echo off
set osname=windows

set path2file=%~dp0
set CMAKE_BUILD_TYPE=Debug
set CMAKE_SOURCE_DIR=%path2file%..\..
set CMAKE_BINARY_DIR=%path2file%..\..\out\%osname%\%CMAKE_BUILD_TYPE%

rmdir /s /q %CMAKE_BINARY_DIR% 
mkdir %CMAKE_BINARY_DIR%

cmake -G "MinGW Makefiles" -S%CMAKE_SOURCE_DIR% -B%CMAKE_BINARY_DIR% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE%