!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
SHARED = CompanyAShared.dll
CLIENT1 = CompanyACaller.exe
CLIENT2 = CompanyBCaller.exe

SRC_CLIENT1 = CompanyACaller.vb
SRC_CLIENT2 = CompanyBCaller.vb

CLEANUP = *.exe *.pdb *.dll

#--------------------------------------------------
_CIMPORTS=/r:CompanyAShared.dll

#--------------------------------------------------
all : $(SHARED) $(CLIENT1) $(CLIENT2)
	rem Sample $(MAKEDIR)

$(CLIENT1) : $(SRC_CLIENT1) $(SHARED)
	if not exist $(_OUTDIR) md $(_OUTDIR)
	$(_BC) $(_VB_EXE_FLAGS) $(_CIMPORTS) /out:$(_OUTDIR)\$@ $(SRC_CLIENT1) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

$(CLIENT2) : $(SRC_CLIENT2) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(SHARED)
	if not exist $(_OUTDIR) md $(_OUTDIR)
	$(_BC) $(_VB_EXE_FLAGS) $(_CIMPORTS) /out:$(_OUTDIR)\$@ $(SRC_CLIENT2) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

clean :
	for %i in ( $(CLEANUP) ) do del %i

#--------------------------------------------------
