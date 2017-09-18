!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = ClassInfoJS.dll
CLEANUP = $(_OUTDIR)\ClassInfoJS.dll $(_OUTDIR)\ClassInfoJS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.Data.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
ClassInfoJS.dll : ClassInfo.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.js $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------