@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-


csc.exe %DEBUGSAMPLE% /out:.\Invoke.exe Invoke.cs  
csc.exe /t:library %DEBUGSAMPLE% /out:.\Tester.dll Tester.cs