@echo off

if "%2" == "" echo.
if "%2" == "" echo USAGE: MakInDir [Directory] [Target]
if "%2" == "" echo ------ Directory: directory to run NMAKE within
if "%2" == "" echo ------ Target: the target of the NMAKE session
if "%2" == "" goto done

cd %1
echo on
nmake /nologo %2
@echo off
if errorlevel 0 goto finish else goto bomb

:bomb
if "%OS%" == "" goto Win9xbomb else goto NTbomb

:Win9xbomb
exit

:NTbomb
exit 1

:finish
cd ..

:done
