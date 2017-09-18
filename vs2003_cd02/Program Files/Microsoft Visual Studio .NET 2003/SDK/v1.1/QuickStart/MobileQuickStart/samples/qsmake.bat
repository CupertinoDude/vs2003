
@set SWM=System.Web.Mobile.dll
@set QBIN=..\bin
@set QSRC=.
@set QSCS=csc /nologo /t:library /r:%SWM% /debug+
@set QSVB=vbc /nologo /t:library /r:System.dll /r:System.Web.dll /r:System.DirectoryServices.dll /r:%SWM% /debug+ 
@set QSJS=jsc /nologo /t:library /r:System.dll /r:System.Web.dll /r:%SWM% /debug+
if not exist %QBIN% mkdir %QBIN%
%QSCS% /out:%QBIN%\Acme.CustomFiltersCS.dll %QSRC%\DeviceCapabilities\cs\CustomFilters.cs
%QSVB% /out:%QBIN%\Acme.CustomFiltersVB.dll %QSRC%\DeviceCapabilities\vb\CustomFilters.vb
%QSJS% /out:%QBIN%\Acme.CustomFiltersJS.dll %QSRC%\DeviceCapabilities\js\CustomFilters.js
%QSCS% /out:%QBIN%\Acme.CustomControlsCS.dll %QSRC%\WritingControls\cs\Acme*.cs
%QSVB% /out:%QBIN%\Acme.CustomControlsVB.dll %QSRC%\WritingControls\vb\Acme*.vb
%QSCS% /out:%QBIN%\Acme.TimerFormCS.dll %QSRC%\TimerForm\cs\TimerForm.cs
%QSVB% /out:%QBIN%\Acme.TimerFormVB.dll %QSRC%\TimerForm\vb\TimerForm.vb
%QSCS% /out:%QBIN%\Acme.MobileSMTPControlCS.dll %QSRC%\MobileSMTPControl\cs\MobileSMTPControl.cs
%QSVB% /out:%QBIN%\Acme.MobileSMTPControlVB.dll %QSRC%\MobileSMTPControl\vb\MobileSMTPControl.vb