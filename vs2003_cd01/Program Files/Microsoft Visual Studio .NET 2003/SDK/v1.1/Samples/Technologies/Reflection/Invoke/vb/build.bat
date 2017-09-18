@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-


vbc.exe /optionstrict+ %DEBUGSAMPLE% /out:.\Invoke.exe Invoke.vb  
vbc.exe /optionstrict+ /t:library %DEBUGSAMPLE% /r:System.Windows.Forms.dll /out:.\Tester.dll Tester.vb  