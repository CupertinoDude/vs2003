@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
  
IF NOT EXIST ..\EventFire\BUILD.BAT GOTO EVENTFIREEND
  CD ..\EVENTFIRE
  CALL BUILD.BAT %1
  CD ..\EVENTSINK
:EVENTFIREEND

ECHO y | copy ..\bin\Zap.dll

vbc %DEBUGSAMLE% /t:library /r:Zap.dll -out:Wak.dll Wak.vb
ECHO y | copy Wak.dll ..\bin\Wak.dll

vbc %DEBUGSAMLE% /r:System.Runtime.Remoting.dll /r:Zap.dll  /r:Wak.dll EventSinkHost.vb