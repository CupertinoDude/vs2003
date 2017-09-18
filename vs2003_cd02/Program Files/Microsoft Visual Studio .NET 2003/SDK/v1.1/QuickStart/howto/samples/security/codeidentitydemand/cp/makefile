!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
SHARED = CompanyAShared.dll
CLIENT1 = CompanyACaller.exe
CLIENT2 = CompanyBCaller.exe

SRC_SHARED = CompanyAShared.cpp
SRC_CLIENT1 = CompanyACaller.cpp
SRC_CLIENT2 = CompanyBCaller.cpp

CLEANUP = *.exe *.pdb *.dll *.obj

#--------------------------------------------------
all : $(SHARED) $(CLIENT1) $(CLIENT2)
	rem Sample $(MAKEDIR)

$(SHARED) : $(SRC_SHARED)
	if not exist $(_OUTDIR) md $(_OUTDIR)
	$(_CL) $(_CCFLAGS) /LD $(SRC_SHARED)

$(CLIENT1) : $(SRC_CLIENT1) $(SHARED)
	if not exist $(_OUTDIR) md $(_OUTDIR)
	$(_CL) $(_CCFLAGS) $(SRC_CLIENT1)

$(CLIENT2) : $(SRC_CLIENT2) $(SHARED)
	if not exist $(_OUTDIR) md $(_OUTDIR)
	$(_CL) $(_CCFLAGS) $(SRC_CLIENT2)

clean :
	for %i in ( $(CLEANUP) ) do del %i

#--------------------------------------------------
