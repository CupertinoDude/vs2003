!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = LinkLabelCtl.exe
SOURCES = LinkLabelCtl.vb
TARGET_RES=LinkLabelCtl.resources
SOURCE_RES=LinkLabelCtl.resX
CLEANUP = *.exe *.dll *.pdb *.resources
#--------------------------------------------------

_IMPORTS=$(_VB_WINFORMS_IMPORTS)
_NETRES=/res:$(TARGET_RES)

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

$(TARGETS) : $(TARGET_RES)

$(TARGETS) : $(SOURCES)
	$(_BC) $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $(SOURCES) \
	$(NETSAMPLEPATH)\QuickStart\QSVersion.vb $(_NETRES) $(_KEYFILE)

$(TARGET_RES) : $(SOURCE_RES)
	$(_RESGEN) $(_RESGEN_FLAGS) $** $@


clean :
	for %i in ( $(CLEANUP) ) do del %i
	if exist obj $(_RMDIR) obj


