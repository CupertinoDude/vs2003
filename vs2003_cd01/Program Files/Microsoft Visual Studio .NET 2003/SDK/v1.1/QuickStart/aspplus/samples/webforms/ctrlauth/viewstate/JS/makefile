!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = $(_OUTDIR)\ViewStateControlSamplesJS.dll
SOURCES = Label.js
CLEANUP = $(_OUTDIR)\ViewStateControlSamplesJS.dll \
  $(_OUTDIR)\ViewStateControlSamplesJS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\ViewStateControlSamplesJS.dll : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.js $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
