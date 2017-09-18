@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
  
vbc %DEBUGSAMPLE% /t:library /out:Hello.dll HelloService.vb
ECHO Y | copy Hello.dll ..\bin

IF NOT EXIST DIRECTHOSTSERVICE/BUILD.BAT GOTO DIRECTHOSTSERVICEEND
  cd DirectHostService
  CALL BUILD.BAT %1
  cd ..
:DIRECTHOSTSERVICEEND
