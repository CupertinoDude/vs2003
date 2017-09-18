@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-

cd math
vbc %DEBUGSAMPLE% /optionstrict+ /target:library /out:math.dll math.vb
gacutil -i math.dll

cd..\de
resgen MyStrings.de.txt MyStrings.de.resources
al /out:WorldCalc.Resources.Dll /v:1.0.0.0 /c:de /embed:MyStrings.de.resources,MyStrings.de.resources,Private

cd ..\de-CH
resgen MyStrings.de-CH.txt MyStrings.de-CH.resources
al /out:WorldCalc.Resources.Dll /v:1.0.0.0 /c:de-CH /embed:MyStrings.de-CH.resources,MyStrings.de-CH.resources,Private
cd ..

resgen MyStrings.txt MyStrings.resources

vbc %DEBUGSAMPLE% /optionstrict+ /target:module /out:parser.dll Parser.vb

vbc %DEBUGSAMPLE% /optionstrict+ /target:winexe /out:WorldCalc.exe /addmodule:parser.dll /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.dll /r:math\math.dll /res:MyStrings.resources WorldCalc.vb