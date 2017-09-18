!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = GDIPText.exe
SOURCES = GDIPText.vb
RESOURCES =colorbars.jpg marble.jpg

CLEANUP = *.exe *.dll *.pdb *.resources

#--------------------------------------------------

_IMPORTS=$(_VB_WINFORMS_IMPORTS)
_WIN32RES=/res:colorbars.jpg /res:marble.jpg

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

$(TARGETS) : $(RESOURCES)

$(TARGETS) : $(SOURCES)
	$(_BC) $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $(SOURCES) \
	$(NETSAMPLEPATH)\QuickStart\QSVersion.vb $(_WIN32RES) $(_KEYFILE)


clean :
	for %i in ( $(CLEANUP) ) do del %i
	if exist obj $(_RMDIR) obj
	if exist bin $(_RMDIR) bin