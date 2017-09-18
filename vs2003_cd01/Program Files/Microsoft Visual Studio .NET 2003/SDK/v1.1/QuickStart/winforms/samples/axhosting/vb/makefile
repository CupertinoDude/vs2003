!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS  = MDIBrowser.exe
IMPORT_TARGETS = AxShDocVw.DLL
SOURCES = MainForm.vb Document.vb
CLEANUP = *.exe *.dll *.pdb
#--------------------------------------------------

_IMPORTS=$(_VB_WINFORMS_IMPORTS) /R:shdocvw.dll /R:AxShDocVw.DLL

#--------------------------------------------------
!IFNDEF NOREGISTERQS
all : $(TARGETS)
!ELSE
all :
!ENDIF
	rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES) $(IMPORT_TARGETS)
	$(_BC) $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

AxShDocVw.DLL : $(SYSTEMROOT)\SYSTEM32\shdocvw.dll
        aximp $(SYSTEMROOT)\SYSTEM32\shdocvw.dll

clean :
	for %i in ( $(CLEANUP) ) do del %i

