@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
  
ECHO Y | copy ..\bin\Wak.dll
vbc %DEBUGSAMPLE% /r:System.Runtime.Remoting.dll EventFireHost.vb
vbc %DEBUGSAMPLE% /t:library -out:Zap.dll Zap.vb
ECHO Y | copy Zap.dll ..\bin