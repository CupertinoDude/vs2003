!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = GDIPBrushes.exe
SOURCES = GDIPBrushes.cs
RESOURCES =colorbars.jpg

CLEANUP = *.exe *.dll *.pdb *.resources
#--------------------------------------------------

_IMPORTS=$(_CS_WINFORMS_IMPORTS) 
_WIN32RES=/res:$(RESOURCES)

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

$(TARGETS) : $(RESOURCES)

$(TARGETS) : $(SOURCES)
	$(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $(SOURCES) \
	$(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)


clean :
	for %i in ( $(CLEANUP) ) do del %i
	if exist obj $(_RMDIR) obj



