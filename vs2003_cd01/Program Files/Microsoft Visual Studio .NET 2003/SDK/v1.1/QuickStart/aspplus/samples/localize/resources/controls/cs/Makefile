!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\LocalizedControlsCS.dll \
  $(_OUTDIR)\de\LocalizedControlsCS.resources.dll \
  $(_OUTDIR)\ja\LocalizedControlsCS.resources.dll
CLEANUP = $(_OUTDIR)\LocalizedControlsCS.dll \
  $(_OUTDIR)\de\LocalizedControlsCS.resources.dll \
  $(_OUTDIR)\ja\LocalizedControlsCS.resources.dll \
  $(_OUTDIR)\LocalizedControlsCS.pdb \
  $(_OUTDIR)\de\LocalizedControlsCS.resources.pdb \
  $(_OUTDIR)\ja\LocalizedControlsCS.resources.pdb \
  ..\en-us\lcontrols.resources \
  ..\de\lcontrols.resources \
  ..\ja\lcontrols.resources
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.dll /r:System.Data.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\aspplus\samples\localize\resources\bin
_WIN32RES=/res:..\en-us\lcontrols.resources,LocalizedStringsCS.resources

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\LocalizedControlsCS.dll: LocalizedButtons.cs ..\en-us\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ LocalizedButtons.cs $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\de\LocalizedControlsCS.resources.dll: ..\de\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
  $(_AL) /out:$(_OUTDIR)\de\LocalizedControlsCS.resources.dll \
     /embed:..\de\lcontrols.resources,LocalizedStringsCS.de.resources \
     /culture:de

$(_OUTDIR)\ja\LocalizedControlsCS.resources.dll: ..\ja\lcontrols.resources $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
  $(_AL) /out:$(_OUTDIR)\ja\LocalizedControlsCS.resources.dll \
     /embed:..\ja\lcontrols.resources,LocalizedStringsCS.ja.resources \
     /culture:ja

clean :
  @for %i in ( $(CLEANUP) ) do @if exist %i @del %i
#--------------------------------------------------
