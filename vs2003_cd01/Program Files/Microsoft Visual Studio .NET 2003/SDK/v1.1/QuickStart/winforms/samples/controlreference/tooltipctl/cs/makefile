!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = ToolTipCtl.exe
SOURCES = ToolTipCtl.cs ChangeToolTips.cs
TARGET_RES = ToolTipCtl.resources ChangeToolTips.resources
TARGET_RES1 = ToolTipCtl.resources
TARGET_RES2 = ChangeToolTips.resources
SOURCE_RES = ToolTipCtl.resX ChangeToolTips.resx
SOURCE_RES1 = ToolTipCtl.resX
SOURCE_RES2 = ChangeToolTips.resx
CLEANUP = *.exe *.pdb *.resources
#--------------------------------------------------

_IMPORTS=$(_CS_WINFORMS_IMPORTS) 
_NETRES=/res:$(TARGET_RES1) /res:$(TARGET_RES2)

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

$(TARGETS) : $(TARGET_RES)

$(TARGETS) : $(SOURCES)
	$(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $(SOURCES) \
	$(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_NETRES) $(_KEYFILE)

$(TARGET_RES1) : $(SOURCE_RES1)
	$(_RESGEN) $(_RESGEN_FLAGS) $** $@

$(TARGET_RES2) : $(SOURCE_RES2)
	$(_RESGEN) $(_RESGEN_FLAGS) $** $@

	
clean :
	for %i in ( $(CLEANUP) ) do del %i
	if exist obj $(_RMDIR) obj

