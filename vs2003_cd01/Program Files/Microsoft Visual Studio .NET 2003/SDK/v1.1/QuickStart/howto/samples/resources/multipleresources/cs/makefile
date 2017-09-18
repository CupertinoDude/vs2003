!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET1 = MakeResources.exe
TARGET2 = MultipleResources.exe

SOURCES1 = MakeResources.cs
SOURCES2 = MultipleResources.cs

CLEANUP = *.exe *.dll *.pdb *.resources
CLEANUPDLL = en-NZ\MultipleResources.resources.dll \
             ja\MultipleResources.resources.dll \
             de\MultipleResources.resources.dll
#--------------------------------------------------
_IMPORTS=/r:System.Drawing.dll /r:System.Windows.Forms.dll /r:System.dll

#--------------------------------------------------
all : $(TARGET1) DLLS $(TARGET2)
    rem Sample $(MAKEDIR)

$(TARGET1) : $(SOURCES1) 
    $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES1) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
    $@

DLLS : $(TARGET1)
    if not exist en-NZ md en-NZ
    if not exist de md de
    if not exist ja md ja
    $(_AL) /t:lib /out:.\en-NZ\MultipleResources.resources.dll /embed:items.en-NZ.resources /culture:en-NZ /title:" " /descr:"A QuickStart Tutorial Assembly" /config:" " /comp:"Microsoft Corporation" /prod:"Microsoft® QuickStart Tutorials" /copy:"© Microsoft Corporation.  All rights reserved." /trade:" " /v:1.1.*
    $(_AL) /t:lib /out:.\de\MultipleResources.resources.dll /embed:items.de.resources /culture:de /title:" " /descr:"A QuickStart Tutorial Assembly" /config:" " /comp:"Microsoft Corporation" /prod:"Microsoft® QuickStart Tutorials" /copy:"© Microsoft Corporation.  All rights reserved." /trade:" " /v:1.1.*
    $(_AL) /t:lib /out:.\ja\MultipleResources.resources.dll /embed:items.ja.resources /culture:ja /title:" " /descr:"A QuickStart Tutorial Assembly" /config:" " /comp:"Microsoft Corporation" /prod:"Microsoft® QuickStart Tutorials" /copy:"© Microsoft Corporation.  All rights reserved." /trade:" " /v:1.1.*

$(TARGET2) : DLLS $(SOURCES2) 
    $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES2) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs /res:items.resources

clean :
    for %i in ( $(CLEANUP) ) do del %i
    for %i in ( $(CLEANUPDLL) ) do if exist %i del %i
    if exist en-NZ rd en-NZ
    if exist de rd de
    if exist ja rd ja
#--------------------------------------------------

