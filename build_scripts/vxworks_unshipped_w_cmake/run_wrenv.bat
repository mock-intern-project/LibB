@echo off

set "WIND_HOME_4_PATH=%WIND_HOME:/=\%"
set "PATH=%WIND_HOME_4_PATH%;%PATH%"

wrenv.exe -p %OSNAME%-%OSVER_MAJOR%