@echo off

REM WIND_HOME, OSNAME and OSVER_MAJOR have to be defined before calling this batch file. 
REM Other than the parameters mentioned above line, OSVER_MINOR, TOOLCHAIN_DIR, TOOLCHAIN_FILE, VSB_DIR and BSP_DIR have to be defined. 

%WIND_HOME%\wrenv.exe -p %OSNAME%-%OSVER_MAJOR%