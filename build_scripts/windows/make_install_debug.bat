@echo off
set osname=windows

set filepath=%~dp0
set CMAKE_BUILD_TYPE=Debug
set CMAKE_SOURCE_DIR=%filepath%..\..
set CMAKE_BINARY_DIR=%filepath%..\..\out\%osname%\%CMAKE_BUILD_TYPE%

cmake --install %CMAKE_BINARY_DIR%