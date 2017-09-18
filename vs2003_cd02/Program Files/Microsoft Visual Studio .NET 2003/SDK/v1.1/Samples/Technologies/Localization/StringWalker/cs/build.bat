@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-

resgen MainForm.resx StringWalker.MainForm.resources
resgen strings.resx StringWalker.strings.resources
csc %DEBUGSAMPLE% /out:StringWalker.exe /target:winexe /r:system.dll /r:system.drawing.dll /r:system.windows.forms.dll /res:StringWalker.MainForm.resources /res:StringWalker.strings.resources MainForm.cs StringWalker.cs