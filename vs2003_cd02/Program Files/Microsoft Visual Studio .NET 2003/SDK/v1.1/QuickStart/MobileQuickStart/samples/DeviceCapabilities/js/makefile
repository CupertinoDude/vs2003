!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = Acme.CustomFiltersJS.dll
CLEANUP = $(_OUTDIR)\Acme.CustomFiltersJS.dll $(_OUTDIR)\Acme.CustomFiltersJS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.Data.dll /r:System.Web.Mobile.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\mobilequickstart\bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

Acme.CustomFiltersJS.dll : CustomFilters.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.js $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------