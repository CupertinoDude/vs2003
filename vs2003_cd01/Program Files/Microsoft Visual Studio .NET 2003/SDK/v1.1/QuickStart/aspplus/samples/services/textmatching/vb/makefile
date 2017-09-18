!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = MatchService.vb \
  $(_OUTDIR)\MatchServiceVB.dll
CLEANUP = MatchService.vb \
  $(_OUTDIR)\MatchServiceVB.dll \
  $(_OUTDIR)\MatchServiceVB.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.Services.dll /r:System.dll /r:System.XML.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\MatchServiceVB.dll : MatchService.vb $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
