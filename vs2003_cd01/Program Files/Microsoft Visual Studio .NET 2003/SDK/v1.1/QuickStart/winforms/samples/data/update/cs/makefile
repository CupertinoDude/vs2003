
!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
DLLDEP = $(NETSAMPLEPATH)\QuickStart\bin\QSTools.dll
PDBDEP = $(NETSAMPLEPATH)\QuickStart\bin\QSTools.pdb

CLIENTDIR = Client
DATADIR = CustomersDataSet
BINDIR = bin

FORM_TARGET = Update.exe
SERVICE_TARGET = UpdateWebService.DLL
DATA_TARGET = CustomersDataSet.DLL

FORM_SOURCES = $(CLIENTDIR)\UpdateForm.cs $(CLIENTDIR)\State.cs ListCustomers.cs UpdateCustomers.cs
SERVICE_SOURCES = UpdateCustomers.asmx.cs ListCustomers.asmx.cs
DATA_SOURCES = CustomersDataSet.cs

# NOTE: The C# source file(s) below is a (are) temporary file(S) created by $(_WSDL)
CLEANUP = *.exe *.dll *.pdb  $(BINDIR)\*.dll $(BINDIR)\*.pdb ListCustomers.cs UpdateCustomers.cs CustomersDataSet.cs
#--------------------------------------------------

FORM_IMPORTS = $(_CS_WINFORMS_IMPORTS) /R:$(DATA_TARGET) /R:System.Data.DLL /R:System.Xml.DLL /R:System.Web.Services.Dll
SERVICE_IMPORTS = $(DLL_IMPORTS) /R:$(DATA_TARGET) /R:System.DLL /R:System.Data.DLL /R:System.Xml.DLL /R:System.Web.Services.Dll /R:$(BINDIR)\QSTools.dll
DATA_IMPORTS = $(_CS_WINFORMS_IMPORTS) /R:System.Data.DLL /r:System.Xml.dll

#--------------------------------------------------
all : $(DATA_TARGET) $(FORM_TARGET) $(BINDIR)\$(SERVICE_TARGET)
  rem Sample $(MAKEDIR)

#- Copy DLLs to application bin dir
$(BINDIR)\$(SERVICE_TARGET) : $(SERVICE_TARGET) $(DATA_TARGET)
    copy $(SERVICE_TARGET) $(BINDIR)
    copy $(DATA_TARGET) $(BINDIR)

$(DATA_TARGET) : $(DATA_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
        $(_CS) /w:0 $(_CS_DLL_FLAGS) $(DATA_IMPORTS) /out:$@ $**

$(SERVICE_TARGET) : $(SERVICE_SOURCES) $(DATA_TARGET) $(BINDIR)\QSTools.dll
        $(_CS) $(_CS_DLL_FLAGS) $(SERVICE_IMPORTS) /out:$@ $(SERVICE_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs

$(FORM_TARGET) : $(FORM_SOURCES) $(DATA_TARGET)
        $(_CS) $(_CS_EXE_FLAGS) $(FORM_IMPORTS) /out:$@ $(FORM_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs

ListCustomers.cs : ListCustomers.WSDL
        $(_WSDL) /l:CS /n:Microsoft.Samples.Windows.Forms.Cs.Update.localhost /out:$@ $**

UpdateCustomers.cs : UpdateCustomers.WSDL
        $(_WSDL) /l:CS /n:Microsoft.Samples.Windows.Forms.Cs.Update.localhost /out:$@ $**

CustomersDataSet.cs : $(DATADIR)\CustomersDataSet.xsd
        $(_XSD) /d /l:CSharp /n:Microsoft.Samples.Windows.Forms.Cs.Update.Data $**

#$(_WSDL) /c:getWSDL /URL:http://localhost/quickstart/winforms/Samples/Data/Update/cs/ListCustomers.asmx?WSDL
ListCustomers.WSDL : ListCustomers.asmx
        ECHO ***
        ECHO ***
        ECHO *** You need to rebuild the ListCustomers WSDL file - see makefile for details
        ECHO ***
        ECHO ***

#$(_WSDL) /c:getWSDL /URL:http://localhost/quickstart/winforms/Samples/Data/Update/cs/UpdateCustomers.asmx?WSDL
UpdateCustomers.WSDL : UpdateCustomers.asmx
        ECHO ***
        ECHO ***
        ECHO *** You need to rebuild the UpdateCustomers WSDL file - see makefile for details
        ECHO ***
        ECHO ***

$(BINDIR)\QSTools.dll :
    if not exist $(BINDIR) md $(BINDIR)
    if exist $(DLLDEP) copy $(DLLDEP) $(BINDIR)\QSTools.dll
    if exist $(PDBDEP) copy $(PDBDEP) $(BINDIR)\QSTools.pdb

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
  if exist obj $(_RMDIR) obj
  if exist $(CLIENTDIR)\obj $(_RMDIR) $(CLIENTDIR)\obj
  if exist $(DATADIR)\obj $(_RMDIR) $(DATADIR)\obj
  if exist $(BINDIR)\$(SERVICE_TARGET) del $(BINDIR)\$(SERVICE_TARGET)
  if exist $(BINDIR)\$(DATA_TARGET) del $(BINDIR)\$(DATA_TARGET)
#--------------------------------------------------
