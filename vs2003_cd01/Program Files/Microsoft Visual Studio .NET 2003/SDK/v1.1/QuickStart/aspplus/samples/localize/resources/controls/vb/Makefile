!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\LocalizedControlsVB.dll \
  $(_OUTDIR)\de\LocalizedControlsVB.resources.dll \
  $(_OUTDIR)\ja\LocalizedControlsVB.resources.dll
CLEANUP = $(_OUTDIR)\LocalizedControlsVB.dll \
  $(_OUTDIR)\de\LocalizedControlsVB.resources.dll \
  $(_OUTDIR)\ja\LocalizedControlsVB.resources.dll \
  $(_OUTDIR)\LocalizedControlsVB.pdb \
  $(_OUTDIR)\de\LocalizedControlsVB.resources.pdb \
  $(_OUTDIR)\ja\LocalizedControlsVB.resources.pdb \
  ..\en-us\lcontrols.resources \
  ..\de\lcontrols.resources \
  ..\ja\lcontrols.resources
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.dll /r:System.Data.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\aspplus\samples\localize\resources\bin
_WIN32RES=/res:..\en-us\lcontrols.resources,LocalizedStringsVB.resources

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\LocalizedControlsVB.dll: LocalizedButtons.vb ..\en-us\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ LocalizedButtons.vb $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\de\LocalizedControlsVB.resources.dll: ..\de\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  $(_AL) /out:$(_OUTDIR)\de\LocalizedControlsVB.resources.dll \
     /embed:..\de\lcontrols.resources,LocalizedStringsVB.de.resources \
     /culture:de

$(_OUTDIR)\ja\LocalizedControlsVB.resources.dll: ..\ja\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  $(_AL) /out:$(_OUTDIR)\ja\LocalizedControlsVB.resources.dll \
     /embed:..\ja\lcontrols.resources,LocalizedStringsVB.ja.resources \
     /culture:ja

clean :
  @for %i in ( $(CLEANUP) ) do @if exist %i @del %i
#--------------------------------------------------
