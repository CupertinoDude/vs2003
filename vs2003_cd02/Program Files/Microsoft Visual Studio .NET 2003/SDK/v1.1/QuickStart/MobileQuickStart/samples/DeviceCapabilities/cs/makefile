!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = Acme.CustomFiltersCS.dll
CLEANUP = $(_OUTDIR)\Acme.CustomFiltersCS.dll $(_OUTDIR)\Acme.CustomFiltersCS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.Data.dll /r:System.Web.Mobile.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\mobilequickstart\bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

Acme.CustomFiltersCS.dll : CustomFilters.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)


clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------