!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET  = HelpLabelHost.exe
DLL_TARGET = HelpLabelControl.DLL

EXE_SOURCES = HostApp\HostApp.cs
DLL_SOURCES = Control\HelpLabel.cs
CLEANUP = *.exe *.dll *.pdb
#--------------------------------------------------

DLL_IMPORTS = $(_CS_WINFORMS_IMPORTS) /r:System.Design.DLL
EXE_IMPORTS = $(DLL_IMPORTS) /R:$(DLL_TARGET)

#--------------------------------------------------
all : $(TARGET)
	rem Sample $(MAKEDIR)


$(TARGET) : $(EXE_SOURCES) $(DLL_TARGET)
        $(_CS) $(_CS_EXE_FLAGS) $(EXE_IMPORTS) /out:$@ $(EXE_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs

$(DLL_TARGET) : $(DLL_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
        $(_CS) $(_CS_DLL_FLAGS) $(DLL_IMPORTS) /out:$@ $**



clean :
	for %i in ( $(CLEANUP) ) do del %i
	if exist Control\obj $(_RMDIR) Control\obj
	if exist HostApp\obj $(_RMDIR) HostApp\obj
	if exist Control\bin $(_RMDIR) Control\bin
	if exist HostApp\bin $(_RMDIR) HostApp\bin

#--------------------------------------------------

