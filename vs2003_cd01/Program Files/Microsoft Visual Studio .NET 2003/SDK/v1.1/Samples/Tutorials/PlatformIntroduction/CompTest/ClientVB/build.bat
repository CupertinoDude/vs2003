@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-


IF NOT EXIST ..\BIN MKDIR ..\BIN
if exist ..\bin\CompCS.dll goto CompCSEnd
  pushd ..\CompCS
  call Build.bat %1
  popd
:CompCSEnd
if exist ..\bin\CompVB.dll goto CompVBEnd
  pushd ..\CompVB
  call Build.bat %1
  popd
:CompVBEnd
if exist ..\bin\CompVC.dll goto CompVCEnd
  pushd ..\CompVC
  call Build.bat %1
  popd
:CompVCEnd
vbc.exe /t:exe %DEBUGSAMPLE% /optionstrict+ /reference:..\Bin\CompCS.dll /reference:..\Bin\CompVB.dll /reference:..\Bin\CompVC.dll  /out:..\bin\ClientVB.exe ClientVB.vb
