@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug
@ IF "%1"=="-r" SET DEBUGSAMPLE=
@ IF "%1"=="-R" SET DEBUGSAMPLE=

cl.exe /CLR /Zi /c Except.cpp
link.exe %DEBUGSAMPLE% /nod:libcpmt.lib kernel32.lib mscoree.lib /out:.\Except.exe Except.obj