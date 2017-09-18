!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET     = LicensedHost.exe
DLL_TARGET = LicensedControl.DLL

EXE_SOURCES = HostApp.cs
DLL_SOURCES = LicensedControl.cs
LICENSES    = $(TARGET).licenses

CLEANUP = *.exe *.dll *.pdb *.licenses

PROJECT = LicensedControl
#--------------------------------------------------

DLL_IMPORTS = $(_CS_WINFORMS_IMPORTS)
EXE_IMPORTS = $(DLL_IMPORTS) /R:$(DLL_TARGET)
_WIN32RES=/res:$(LICENSES)

#--------------------------------------------------
all : $(TARGET)
	rem Sample $(MAKEDIR)


$(TARGET) : $(EXE_SOURCES) $(DLL_TARGET) $(LICENSES)
        $(_CS) $(_CS_EXE_FLAGS) $(EXE_IMPORTS) $(_WIN32RES) /out:$@ $(EXE_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs

$(DLL_TARGET) : $(DLL_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
        $(_CS) $(_CS_DLL_FLAGS) $(DLL_IMPORTS) /out:$@ $**

$(LICENSES) : $(LICENSES).txt $(PROJECT).lic
	lc /target:$(TARGET) /complist:$(LICENSES).txt /i:$(DLL_TARGET)

clean :
	for %i in ( $(CLEANUP) ) do del %i

#--------------------------------------------------




