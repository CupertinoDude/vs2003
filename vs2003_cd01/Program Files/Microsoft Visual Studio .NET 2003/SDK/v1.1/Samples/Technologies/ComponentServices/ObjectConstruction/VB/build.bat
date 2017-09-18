@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-u" goto clean
@ IF "%1"=="-U" goto clean

@ REM Compile the sample .NET COM+ server object code.
@ REM This build step generates a .dll
vbc /target:library %DEBUGSAMPLE%  /out:OCDemoSvr.dll /r:System.EnterpriseServices.dll /r:System.Windows.forms.dll  /r:system.dll /r:System.Drawing.dll OCObj.vb

@ REM compile the sample .NET client application
@ REM this build step generates a windows .exe
vbc /target:winexe %DEBUGSAMPLE% /out:OCDemo.exe /r:OCDemoSvr.dll /r:System.EnterpriseServices.dll /r:System.Windows.Forms.dll  /r:System.dll /r:System.Drawing.dll OCForm.vb

@ REM Register, install, and configure the sample COM+ application.
@ REM This build step registers the assembly, creates and registers
@ REM a typelib, and creates and configures a COM+ application 
@ REM according to metadata specified via source code attributes.
@ REM See source code comments and the .NET docs for more info
regsvcs OCDemoSvr.dll
gacutil -i OCDemoSvr.dll
@echo.
@echo To uninstall the ObjectConstruction Sample, run "build -u"
@echo.

@goto exit

:clean
gacutil /u OCDemoSvr,PublicKeyToken=7d46df771ff0e0c6
regsvcs /u OCDemoSvr.dll

:exit