@echo off
REM /*=====================================================================
REM   File:      RoundTrip.bat
REM 
REM   Summary:   Demonstrates the use of IlDasm.exe and IlAsm.exe to 
REM              generate compileable IL module from a compiled module,  
REM              followed by the recompilation of the the module to 
REM              produce a new executable.
REM 
REM ---------------------------------------------------------------------
REM   This file is part of the Microsoft .NET SDK Code Samples.
REM 
REM   Copyright (C) Microsoft Corporation.  All rights reserved.
REM 
REM This source code is intended only as a supplement to Microsoft
REM Development Tools and/or on-line documentation.  See these other
REM materials for detailed information regarding Microsoft code samples.
REM 
REM THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
REM KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
REM IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
REM PARTICULAR PURPOSE.
REM =====================================================================*/


if exist %1 goto RoundTrip
if exist %1.exe goto RoundTripExe

:Usage
if not exist .\%1 echo File Not Found: %1
echo USAGE: RoundTrip.bat [Filename]
echo    [Filename] = A managed executable file
goto End

:RoundTrip
ildasm /out=RTAsm.il %1
ilasm RTAsm.il /OUT=RTExe.exe
goto End

:RoundTripExe
ildasm /out=RTAsm.il %1.exe
ilasm RTAsm.il /OUT=RTExe.exe
goto End

:End