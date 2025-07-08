 @echo off

set go_up=..\..

set path2file=%~dp0
set BUILD_TYPE=Release
set BINARY_DIR=%path2file%\%go_up%\out\%OSNAME%\%OSVER_MAJOR%_%OSVER_MINOR%\%BOARDNAME%\%BUILD_TYPE%
set target=all

cmake --build %BINARY_DIR% --target %target% -j %NUMBER_OF_PROCESSORS%