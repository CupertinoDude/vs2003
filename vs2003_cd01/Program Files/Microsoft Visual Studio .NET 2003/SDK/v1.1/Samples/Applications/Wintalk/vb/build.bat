@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-


vbc.exe /t:winexe %DEBUGSAMPLE% /optionstrict+ /out:.\wintalk.exe /r:System.dll /r:System.Drawing.dll /r:System.Windows.Forms.dll WinTalk.vb
