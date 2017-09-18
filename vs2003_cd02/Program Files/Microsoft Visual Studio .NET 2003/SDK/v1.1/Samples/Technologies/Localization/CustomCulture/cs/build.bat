@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-

md en-us
md en-us-xyz

resgen MainForm.resx CustomCulture.MainForm.resources
resgen logo.resx logo.resources
resgen logo.en-US.resx en-US\logo.en-US.resources
resgen logo.en-US-xyz.resx en-US-xyz\logo.en-US-xyz.resources

al /out:logo.dll /v:1.0.0.0 /embed:logo.resources
al /out:en-US\logo.resources.dll /v:1.0.0.0 /c:en-US /embed:en-US\logo.en-US.resources
al /out:en-US-xyz\logo.resources.dll /v:1.0.0.0 /c:en-US-xyz /embed:en-US-xyz\logo.en-US-xyz.resources

csc %DEBUGSAMPLE% /out:CustomCulture.exe /target:winexe /r:system.dll /r:system.drawing.dll /r:system.windows.forms.dll /r:system.data.dll /r:system.XML.dll /res:CustomCulture.MainForm.resources MainForm.cs customCulture.cs