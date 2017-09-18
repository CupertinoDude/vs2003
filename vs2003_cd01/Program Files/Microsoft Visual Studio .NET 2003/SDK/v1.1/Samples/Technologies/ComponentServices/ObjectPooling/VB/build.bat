@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-u" goto clean
@ IF "%1"=="-U" goto clean

@ REM Compile the sample .NET COM+ server object code.
@ REM This build step generates a .dll
vbc %DEBUGSAMPLE% /target:library /out:OPDemoSvr.dll /r:System.EnterpriseServices.dll /r:System.Windows.forms.dll  /r:system.dll /r:System.Drawing.dll OPObj.vb

@ REM compile the sample .NET client application
@ REM this build step generates a windows .exe
vbc %DEBUGSAMPLE% /target:winexe /out:OPDemo.exe /r:OPDemoSvr.dll /r:System.EnterpriseServices.dll /r:System.Windows.forms.dll  /r:System.dll /r:System.Drawing.dll OPForm.vb

@ REM Register, install, and configure the sample COM+ application.
@ REM This build step registers the assembly, creates and registers
@ REM a typelib, and creates and configures a COM+ application 
@ REM according to metadata specified via source code attributes.
@ REM See source code comments and the .NET docs for more info
regsvcs OPDemoSvr.dll
gacutil -i OPDemoSvr.dll
@echo.
@echo To uninstall the ObjectPooling Sample, run "build -u"
@echo.

@goto exit

:clean
gacutil /u OPDemoSvr,PublicKeyToken=1644d5fa9a514d1c
regsvcs /u OPDemoSvr.dll

:exit