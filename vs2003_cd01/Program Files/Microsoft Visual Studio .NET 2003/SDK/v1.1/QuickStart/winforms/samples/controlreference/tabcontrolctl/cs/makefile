!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = TabControlCtl.exe
SOURCES = TabControlCtl.cs
TARGET_RES = TabControlCtl.resources
SOURCE_RES = TabControlCtl.resX
CLEANUP = *.exe *.pdb *.resources
#--------------------------------------------------

_IMPORTS=$(_CS_WINFORMS_IMPORTS) 
_NETRES=/res:$(TARGET_RES)

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

$(TARGETS) : $(TARGET_RES)

$(TARGETS) : $(SOURCES)
	$(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $(SOURCES) \
	$(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_NETRES) $(_KEYFILE)

$(TARGET_RES) : $(SOURCE_RES)
	$(_RESGEN) $(_RESGEN_FLAGS) $** $@

	
clean :
	for %i in ( $(CLEANUP) ) do del %i
	if exist obj $(_RMDIR) obj


