@echo off

set go_up=..\..

set path2file=%~dp0
set BUILD_TYPE=Release
set SOURCE_DIR=%path2file%\%go_up%
set BINARY_DIR=%path2file%\%go_up%\out\%OSNAME%\%OSVER_MAJOR%_%OSVER_MINOR%\%BOARDNAME%\%BUILD_TYPE%

set "WIND_HOME=%WIND_HOME:\=/%"
set "VSB_DIR=%VSB_DIR:\=/%"
set "BSP_DIR=%BSP_DIR:\=/%"
set "TOOLCHAIN_DIR=%TOOLCHAIN_DIR:\=/%"
set "TOOLCHAIN_FILE=%TOOLCHAIN_FILE:\=/%"

REM  If you want to define a path for the installation root other than the below one, you must set it before calling this script file.
if defined INSTALL_ROOT_DIR (
    set "INSTALL_ROOT_DIR=%INSTALL_ROOT_DIR:\=/%"
) else (
    set "INSTALL_ROOT_DIR=D:/in_house_software"    
)

rmdir /s /q %BINARY_DIR% 
mkdir %BINARY_DIR%

cmake -G "Unix Makefiles" -S%SOURCE_DIR% ^ -B%BINARY_DIR% ^
-DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
-DCMAKE_TOOLCHAIN_FILE=%TOOLCHAIN_DIR%/%TOOLCHAIN_FILE% ^
-DBOARD=%BOARDNAME%