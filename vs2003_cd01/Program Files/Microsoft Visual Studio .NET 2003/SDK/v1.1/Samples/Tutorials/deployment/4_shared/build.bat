@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-


cd Stringer
csc.exe /target:library %DEBUGSAMPLE% Stringer.cs  
cd ..
cd Reverser

csc.exe /define:STRONG /target:library %DEBUGSAMPLE% Reverser.cs
gacutil.exe /i Reverser.dll
cd ..

csc.exe %DEBUGSAMPLE% /reference:Stringer\Stringer.dll;Reverser\Reverser.dll Client.cs  
