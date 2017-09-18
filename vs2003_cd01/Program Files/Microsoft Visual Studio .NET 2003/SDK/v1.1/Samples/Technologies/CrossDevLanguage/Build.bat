@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-
@ SET DEBUGSAMPLEVC=/Zi
@ IF "%1"=="-r" SET DEBUGSAMPLEVC=
@ IF "%1"=="-R" SET DEBUGSAMPLEVC=

cl.exe /CLR %DEBUGSAMPLEVC% /LD VCBase.cpp
vbc %DEBUGSAMPLE% /t:module /r:VCBase.dll /OptionStrict+ VBDerived.vb
ilasm /DLL /out=ILDerived.netmodule ILDerived.il
csc %DEBUGSAMPLE% /t:library /out:CSDerived.dll /r:vcbase.dll /addmodule:ilderived.netmodule /addmodule:VBDerived.netmodule csderived.cs
csc %DEBUGSAMPLE% /r:VCBase.dll,CSDerived.dll CrossLang.cs