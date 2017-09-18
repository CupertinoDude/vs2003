!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS  = Grid.exe
DLL_TARGET = Data.DLL

EXE_SOURCES = Grid.cs
DLL_SOURCES = CustomersDataSet.cs
CLEANUP = *.exe *.dll *.pdb CustomersDataSet.cs
#--------------------------------------------------

DLL_IMPORTS = $(_CS_WINFORMS_IMPORTS) /R:System.Data.DLL /r:System.Xml.dll
EXE_IMPORTS = $(DLL_IMPORTS) /R:$(DLL_TARGET)

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

CustomersDataSet.cs : CustomersDataSet.xsd
        $(_XSD) /d /l:CSharp /n:Microsoft.Samples.WinForms.Cs.Grid.Data $**
  
$(TARGETS) : $(EXE_SOURCES) $(DLL_TARGET)
        $(_CS) $(_CS_EXE_FLAGS) $(EXE_IMPORTS) /out:$@ $(EXE_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs

$(DLL_TARGET) : $(DLL_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
        $(_CS) $(_CS_DLL_FLAGS) $(DLL_IMPORTS) /out:$@ $**
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj
#--------------------------------------------------

