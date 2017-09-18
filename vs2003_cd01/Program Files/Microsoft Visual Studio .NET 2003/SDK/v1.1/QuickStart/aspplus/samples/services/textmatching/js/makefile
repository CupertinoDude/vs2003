!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = MatchService.js \
  $(_OUTDIR)\MatchServiceJS.dll
CLEANUP = MatchService.js \
  $(_OUTDIR)\MatchServiceJS.dll \
  $(_OUTDIR)\MatchServiceJS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.Services.dll /r:System.XML.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\MatchServiceJS.dll : MatchService.js $(NETSAMPLEPATH)\QuickStart\QSVersion.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
