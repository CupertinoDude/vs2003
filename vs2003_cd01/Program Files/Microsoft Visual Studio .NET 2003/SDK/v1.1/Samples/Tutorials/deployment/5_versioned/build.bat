@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-


cd Stringer
csc.exe /target:library %DEBUGSAMPLE% Stringer.cs  
cd ..
cd Reverser_v2.0.0.0
IF NOT EXIST orgVerKey.snk COPY ..\orgVerKey.snk
csc.exe /target:library %DEBUGSAMPLE% Reverser.cs  
gacutil.exe /i Reverser.dll
cd ..
cd Reverser_v2.0.1.0
IF NOT EXIST orgVerKey.snk COPY ..\orgVerKey.snk
csc.exe /target:library %DEBUGSAMPLE% Reverser.cs  
gacutil.exe /i Reverser.dll
cd ..
csc.exe %DEBUGSAMPLE% /reference:Stringer\Stringer.dll;Reverser_v2.0.0.0\Reverser.dll VerClient.cs  
