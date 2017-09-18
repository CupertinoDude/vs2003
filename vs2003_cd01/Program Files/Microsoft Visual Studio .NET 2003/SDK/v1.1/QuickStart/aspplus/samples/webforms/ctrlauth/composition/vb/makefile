!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\CompositionSampleControlsVB.dll
SOURCES = Composition1.vb Composition2.vb Composition3.vb
CLEANUP = $(_OUTDIR)\CompositionSampleControlsVB.dll \
  $(_OUTDIR)\CompositionSampleControlsVB.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\CompositionSampleControlsVB.dll : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(NETSAMPLEPATH)\Quickstart\QSVersion.vb $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
