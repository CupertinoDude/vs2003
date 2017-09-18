!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = Acme.CustomControlsCS.dll
CLEANUP = $(_OUTDIR)\Acme.CustomControlsCS.dll $(_OUTDIR)\Acme.CustomControlsCS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.dll /r:System.Data.dll /r:System.Web.Mobile.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\mobilequickstart\bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

Acme.CustomControlsCS.dll : AcmeLogin.cs AcmeMenu.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)


clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------