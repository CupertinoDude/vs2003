@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-

resgen MainForm.resx MainForm.resources
resgen strings.resx StringWalker.strings.resources

vbc %DEBUGSAMPLE% /out:StringWalker.exe /target:winexe /main:MainForm /r:system.dll /r:system.drawing.dll /r:system.windows.forms.dll /res:MainForm.resources /res:StringWalker.strings.resources MainForm.vb StringWalker.vb 

