@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-u" goto clean
@ IF "%1"=="-U" goto clean

@ REM Compile the sample .NET COM+ server object code.
@ REM This build step generates a .dll
csc /target:library %DEBUGSAMPLE% /d:BuildBat /out:RBSecDemoSvr.dll /r:System.EnterpriseServices.dll /r:System.Windows.forms.dll  /r:System.dll /r:System.Drawing.dll RBSecObj.cs

@ REM compile the sample .NET client application
@ REM this build step generates a windows .exe
csc /target:winexe %DEBUGSAMPLE%  /out:RBSecDemo.exe /r:RBSecDemoSvr.dll /r:System.Windows.forms.dll  /r:System.dll /r:System.Drawing.dll RBSecForm.cs

@ REM Register, install, and configure the sample COM+ application.
@ REM This build step registers the assembly, creates and registers
@ REM a typelib, and creates and configures a COM+ application 
@ REM according to metadata specified via source code attributes.
@ REM See source code comments and the .NET docs for more info
regsvcs RBSecDemoSvr.dll
gacutil /i RBSecDemoSvr.dll
@echo.
@echo To uninstall the RoleBaseSecurity Sample, run "build -u"
@echo.

@goto exit

:clean
gacutil /u RBSecDemoSvr,PublicKeyToken=a653dc1bf6570fc2
regsvcs /u RBSecDemoSvr.dll

:exit