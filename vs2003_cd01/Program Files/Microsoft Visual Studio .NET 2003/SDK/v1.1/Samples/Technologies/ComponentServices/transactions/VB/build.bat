@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-u" goto clean
@ IF "%1"=="-U" goto clean

@ REM Configure the MSDE Database
osql -E -S (local)\NetSDK -i TxDB.sql

@ REM Compile the sample .NET COM+ server object code.
@ REM This build step generates a .dll
vbc /target:library %DEBUGSAMPLE%  /out:TxDemoSvr.dll /r:System.EnterpriseServices.dll /r:System.Windows.forms.dll  /r:System.dll /r:System.Data.dll TxObj.vb

@ REM compile the sample .NET client application
@ REM this build step generates a windows .exe
vbc /target:winexe %DEBUGSAMPLE%  /out:TxDemo.exe /r:TxDemoSvr.dll /r:System.EnterpriseServices.dll /r:System.Windows.forms.dll  /r:System.dll /r:System.Drawing.dll TxForm.vb

@ REM Register, install, and configure the sample COM+ application.
@ REM This build step registers the assembly, creates and registers
@ REM a typelib, and creates and configures a COM+ application 
@ REM according to metadata specified via source code attributes.
@ REM See source code comments and the .NET docs for more info
regsvcs TxDemoSvr.dll
gacutil -i TxDemoSvr.dll


@echo.
@echo To uninstall the Transactions Sample, run "build -u"
@echo.

@goto exit

:clean
gacutil /u TxDemoSvr,PublicKeyToken=c6c15ca83a884320
regsvcs /u TxDemoSvr.dll
osql -E -S (local)\NetSDK -Q "IF EXISTS (SELECT * FROM sysdatabases WHERE name='TXDemoDB') DROP database TXDemoDB"

:exit