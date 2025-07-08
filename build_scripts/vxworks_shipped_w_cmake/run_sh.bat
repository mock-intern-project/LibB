@echo off

REM "run_wrenv.bat" has to be called before this one, hence WIND_HOME will have already been defined before calling this batch file.

set "PATH=%WIND_HOME%\vxworks-7\host\msys2-x86-win64\usr\bin;%PATH%"

sh.exe