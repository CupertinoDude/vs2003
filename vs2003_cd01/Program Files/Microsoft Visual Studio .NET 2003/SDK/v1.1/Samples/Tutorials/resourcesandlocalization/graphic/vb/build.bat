@ REM Set command switch for building debug or retail (default is to build debug)
@ REM Type "build.bat -r" to build for retail
@ SET DEBUGSAMPLE=/debug+
@ IF "%1"=="-r" SET DEBUGSAMPLE=/debug-
@ IF "%1"=="-R" SET DEBUGSAMPLE=/debug-

del /s *.dll
del /s *.exe
del /s *.resx
del /s *.resources

IF EXIST ..\..\resxgen\resxgen.exe GOTO RESXGENEXIT
  CD ..\..\resxgen
  CALL build.bat %1
  CD ..\Graphic\VB
:RESXGENEXIT

..\..\resxgen\resxgen /i:un.jpg     /o:Images.resx       /n:flag
cd en
..\..\..\resxgen\resxgen /i:en.jpg     /o:Images.en.resx    /n:flag
cd ..\en-au
..\..\..\resxgen\resxgen /i:en-AU.jpg  /o:Images.en-AU.resx /n:flag
cd ..\en-ca
..\..\..\resxgen\resxgen /i:en-CA.jpg  /o:Images.en-CA.resx /n:flag
cd ..\en-gb
..\..\..\resxgen\resxgen /i:en-GB.jpg  /o:Images.en-GB.resx /n:flag
cd ..\en-us
..\..\..\resxgen\resxgen /i:en-US.jpg  /o:Images.en-US.resx /n:flag
cd..

resgen Images.resx             Images.resources
resgen en\images.en.resx       en\images.en.resources
resgen en-au\images.en-au.resx en-au\images.en-AU.resources
resgen en-ca\images.en-ca.resx en-ca\images.en-CA.resources
resgen en-gb\images.en-gb.resx en-gb\images.en-GB.resources
resgen en-us\images.en-us.resx en-us\images.en-US.resources

al /out:en\Graphic.resources.dll    /c:en    /embed:en\Images.en.resources,Images.en.resources,Private
al /out:en-au\Graphic.resources.dll /c:en-AU /embed:en-au\Images.en-AU.resources,Images.en-AU.resources,Private
al /out:en-ca\Graphic.resources.dll /c:en-CA /embed:en-ca\Images.en-CA.resources,Images.en-CA.resources,Private
al /out:en-gb\Graphic.resources.dll /c:en-GB /embed:en-gb\Images.en-GB.resources,Images.en-GB.resources,Private
al /out:en-us\Graphic.resources.dll /c:en-US /embed:en-us\Images.en-US.resources,Images.en-US.resources,Private

vbc %DEBUGSAMPLE% /target:winexe /optionstrict+ /r:System.DLL /r:System.Drawing.DLL /r:System.Windows.Forms.DLL /r:System.Data.DLL /res:Images.resources,Images.resources graphic.vb
