!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET  = ComboBoxBinding.exe
DLL_TARGET = Microsoft.Samples.WinForms.Vb.ComboBoxBinding.Data.DLL

EXE_SOURCES = ComboBoxBinding.vb USState.VB
DLL_SOURCES = CustomersDataSet.vb
CLEANUP = *.exe *.dll *.pdb CustomersDataSet.vb
#--------------------------------------------------

DLL_IMPORTS = $(_VB_WINFORMS_IMPORTS) /R:System.Data.DLL /r:System.Xml.dll
EXE_IMPORTS = $(DLL_IMPORTS) /R:$(DLL_TARGET)

#--------------------------------------------------
all : $(TARGET)
  rem Sample $(MAKEDIR)

  
CustomersDataSet.VB : CustomersDataSet.xsd
        $(_XSD) /d /l:VB /n:Microsoft.Samples.WinForms.VB.ComboBoxBinding.Data $**

$(TARGET) : $(EXE_SOURCES) $(DLL_TARGET)
        $(_BC) $(_VB_EXE_FLAGS) $(EXE_IMPORTS) /out:$@ $(EXE_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

$(DLL_TARGET) : $(DLL_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
        $(_BC) $(_VB_DLL_FLAGS) $(DLL_IMPORTS) /out:$@ $**


  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj
#--------------------------------------------------

