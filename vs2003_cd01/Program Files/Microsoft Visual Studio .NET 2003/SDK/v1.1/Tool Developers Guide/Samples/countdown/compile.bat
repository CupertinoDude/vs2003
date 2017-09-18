@echo off
csc /t:module CountDownSecondsLabel.cs /r:System.dll /r:System.Windows.Forms.dll /r:System.Drawing.dll
rem if C++ is specified, create C++ DLL, otherwise create C# DLL
if "C++"=="%1" goto CPP
if "c++"=="%1" goto CPP
if "%1"=="" goto CS
goto ERROR

:CS
csc /t:module CountDownErrorLabel.cs /r:System.dll /r:System.Windows.Forms.dll /r:System.Drawing.dll
goto Continue

:CPP
cl /clr /LD CountDownErrorLabel.cpp /link /OUT:CountDownErrorLabel.netmodule

:Continue
ilasm Counter.il /dll
ilasm CountDownComponents.il /dll
ilasm CountDown.il
goto END

:ERROR
echo Invalid command line argument '%1'
echo.

:END