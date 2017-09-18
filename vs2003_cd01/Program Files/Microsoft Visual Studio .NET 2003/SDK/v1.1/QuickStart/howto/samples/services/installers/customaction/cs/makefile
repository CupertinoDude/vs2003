!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = CustomAction.exe
SOURCES = CustomAction.cs ProjectInstaller.cs CustomInstaller.cs
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/r:System.DLL /r:System.Configuration.Install.DLL

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(_WIN32RES) $(_KEYFILE) 

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
