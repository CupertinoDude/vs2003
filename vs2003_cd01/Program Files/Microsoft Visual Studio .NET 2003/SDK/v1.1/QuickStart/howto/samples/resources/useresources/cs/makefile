!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET1 = UseResources.resources \
          en-NZ\UseResources.resources.dll \
          ja\UseResources.resources.dll \
          de\UseResources.resources.dll

TARGET2 = UseResources.en-NZ.resources \
          UseResources.ja.resources \
          UseResources.de.resources

TARGET3 = UseResources.exe

SOURCES = UseResources.cs

CLEANUP = *.exe *.dll *.pdb *.resources
CLEANUPDLL = en-NZ\UseResources.resources.dll \
             ja\UseResources.resources.dll \
             de\UseResources.resources.dll
#--------------------------------------------------
_IMPORTS=/r:System.Drawing.dll

#--------------------------------------------------
all : $(TARGET1) $(TARGET2) $(TARGET3)
    rem Sample $(MAKEDIR)

$(TARGET3) : $(TARGET1)
    $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs /res:UseResources.resources

en-NZ\UseResources.resources.dll : $(TARGET2)
    if not exist en-NZ md en-NZ
    $(_AL) /t:lib /culture:en-NZ /embed:UseResources.en-NZ.resources /out:en-NZ\UseResources.resources.dll /title:" " /descr:"A QuickStart Tutorial Assembly" /config:" " /comp:"Microsoft Corporation" /prod:"Microsoft® QuickStart Tutorials" /copy:"© Microsoft Corporation.  All rights reserved." /trade:" " /v:1.1.*

ja\UseResources.resources.dll : $(TARGET2)
    if not exist ja md ja
    $(_AL) /t:lib /culture:ja /embed:UseResources.ja.resources /out:ja\UseResources.resources.dll /title:" " /descr:"A QuickStart Tutorial Assembly" /config:" " /comp:"Microsoft Corporation" /prod:"Microsoft® QuickStart Tutorials" /copy:"© Microsoft Corporation.  All rights reserved." /trade:" " /v:1.1.*

de\UseResources.resources.dll : $(TARGET2)
    if not exist de md de
    $(_AL) /t:lib /culture:de /embed:UseResources.de.resources /out:de\UseResources.resources.dll /title:" " /descr:"A QuickStart Tutorial Assembly" /config:" " /comp:"Microsoft Corporation" /prod:"Microsoft® QuickStart Tutorials" /copy:"© Microsoft Corporation.  All rights reserved." /trade:" " /v:1.1.*

clean :
    for %i in ( $(CLEANUP) ) do del %i
    for %i in ( $(CLEANUPDLL) ) do if exist %i del %i
    if exist de rd de=
    if exist ja rd ja
    if exist en-NZ rd en-NZ
#--------------------------------------------------

