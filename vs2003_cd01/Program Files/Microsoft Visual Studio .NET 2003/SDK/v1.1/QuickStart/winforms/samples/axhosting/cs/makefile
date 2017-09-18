!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS=MDIBrowser.exe

IMPORT_TARGETS = AxShDocVw.DLL
SOURCES = MainForm.cs Document.cs
CLEANUP = *.exe *.dll *.pdb
#--------------------------------------------------
_IMPORTS=$(_CS_WINFORMS_IMPORTS) /R:shdocvw.dll /R:AxShDocVw.DLL

#--------------------------------------------------
!IFNDEF NOREGISTERQS
all : $(TARGETS)
!ELSE
all :
!ENDIF
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES) $(IMPORT_TARGETS)
  $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs

AxShDocVw.DLL : $(SYSTEMROOT)\SYSTEM32\shdocvw.dll
        aximp $(SYSTEMROOT)\SYSTEM32\shdocvw.dll

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------

