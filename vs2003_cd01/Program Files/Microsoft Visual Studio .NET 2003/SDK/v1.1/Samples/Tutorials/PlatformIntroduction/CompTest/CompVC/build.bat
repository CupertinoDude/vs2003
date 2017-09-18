@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug
@ IF "%1"=="-r" SET DEBUGSAMPLE=
@ IF "%1"=="-R" SET DEBUGSAMPLE=
@ SET DEBUGCLSAMPLE=/Zi
@ IF "%1"=="-r" SET DEBUGCLSAMPLE=
@ IF "%1"=="-R" SET DEBUGCLSAMPLE=


cl.exe /clr %DEBUGCLSAMPLE% /c CompVC.cpp
if not exist ..\bin md ..\bin
link.exe -dll %DEBUGSAMPLE% /nod:libcpmt.lib kernel32.lib mscoree.lib /out:..\bin\CompVC.dll CompVC.obj
IF NOT EXIST ..\ClientASP\Bin MKDIR ..\ClientASP\Bin
ECHO Y| COPY ..\Bin\CompVC.dll ..\ClientASP\Bin\CompVC.dll
