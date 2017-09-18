!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\LocalizedControlsJS.dll \
  $(_OUTDIR)\en\LocalizedControlsJS.resources.dll \
  $(_OUTDIR)\de\LocalizedControlsJS.resources.dll \
  $(_OUTDIR)\ja\LocalizedControlsJS.resources.dll
CLEANUP = $(_OUTDIR)\LocalizedControlsJS.dll \
  $(_OUTDIR)\LocalizedControlsJS.pdb \
  $(_OUTDIR)\en\LocalizedControlsJS.resources.dll \
  $(_OUTDIR)\en\LocalizedControlsJS.resources.pdb \
  $(_OUTDIR)\de\LocalizedControlsJS.resources.dll \
  $(_OUTDIR)\de\LocalizedControlsJS.resources.pdb \
  $(_OUTDIR)\ja\LocalizedControlsJS.resources.dll \
  $(_OUTDIR)\ja\LocalizedControlsJS.resources.pdb \
  ..\en-us\lcontrols.resources \
  ..\de\lcontrols.resources \
  ..\ja\lcontrols.resources
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.dll /r:System.Data.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\aspplus\samples\localize\resources\bin
#_WIN32RES=/res:..\en-us\lcontrols.resources,LocalizedStringsJS.resources

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\LocalizedControlsJS.dll: LocalizedButtons.js $(NETSAMPLEPATH)\QuickStart\QSVersion.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$@ LocalizedButtons.js $(_KEYFILE)

$(_OUTDIR)\en\LocalizedControlsJS.resources.dll: ..\en-us\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.js
  $(_AL) /out:$(_OUTDIR)\en\LocalizedControlsJS.resources.dll \
     /embed:..\en-us\lcontrols.resources,LocalizedStringsJS.en.resources \
     /culture:en

$(_OUTDIR)\de\LocalizedControlsJS.resources.dll: ..\de\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.js
  $(_AL) /out:$(_OUTDIR)\de\LocalizedControlsJS.resources.dll \
     /embed:..\de\lcontrols.resources,LocalizedStringsJS.de.resources \
     /culture:de

$(_OUTDIR)\ja\LocalizedControlsJS.resources.dll: ..\ja\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.js
  $(_AL) /out:$(_OUTDIR)\ja\LocalizedControlsJS.resources.dll \
     /embed:..\ja\lcontrols.resources,LocalizedStringsJS.ja.resources \
     /culture:ja

clean :
  @for %i in ( $(CLEANUP) ) do @if exist %i @del %i
#--------------------------------------------------
