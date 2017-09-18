@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-


if not exist ..\bin md ..\bin
vbc.exe /t:library %DEBUGSAMPLE% /optionstrict+  /out:..\bin\CompVB.dll CompVB.vb
IF NOT EXIST ..\ClientASP\Bin MKDIR ..\ClientASP\Bin
ECHO Y| COPY ..\Bin\CompVB.dll ..\ClientASP\Bin\CompVB.dll
