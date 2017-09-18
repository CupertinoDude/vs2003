!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = Acme.CustomFiltersVB.dll
CLEANUP = $(_OUTDIR)\Acme.CustomFiltersVB.dll $(_OUTDIR)\Acme.CustomFiltersVB.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.Data.dll /r:System.Web.Mobile.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\mobilequickstart\bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

Acme.CustomFiltersVB.dll : CustomFilters.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS)  /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.vb $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------