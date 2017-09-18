@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
  
IF EXIST ..\..\BIN\HELLO.DLL ECHO Y | copy ..\..\bin\Hello.dll

vbc %DEBUGSAMPLE% /r:System.Runtime.Remoting.dll DirectHost.vb