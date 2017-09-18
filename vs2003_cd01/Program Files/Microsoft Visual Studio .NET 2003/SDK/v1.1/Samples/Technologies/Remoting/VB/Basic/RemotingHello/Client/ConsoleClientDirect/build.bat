@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
  

ECHO Y | copy ..\..\bin\Hello.dll 

vbc %DEBUGSAMPLE% /r:Hello.dll /out:HelloNew.exe HelloNew.vb
vbc %DEBUGSAMPLE% /r:Hello.dll /out:HelloNew2.exe HelloNew2.vb
vbc %DEBUGSAMPLE% /r:System.Runtime.Remoting.dll /r:Hello.dll /out:HelloNew3.exe HelloNew3.vb
vbc %DEBUGSAMPLE% /r:System.Runtime.Remoting.dll /r:Hello.dll /out:HelloGetObj.exe HelloGetObj.vb
vbc %DEBUGSAMPLE% /r:System.Runtime.Remoting.dll /r:Hello.dll /out:HelloGetObj2.exe HelloGetObj2.vb
vbc %DEBUGSAMPLE% /r:Hello.dll /out:HelloAsync.exe HelloAsync.vb
vbc %DEBUGSAMPLE% /r:Hello.dll /out:HelloAsync2.exe HelloAsync2.vb