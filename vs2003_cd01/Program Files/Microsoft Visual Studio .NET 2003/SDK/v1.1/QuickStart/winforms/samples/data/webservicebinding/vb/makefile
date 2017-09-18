
!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
CLIENTDIR = Client
DATADIR = DataSet
BINDIR = bin

FORM_TARGET = WebServiceClient.exe
SERVICE_TARGET = WebService.DLL
DATA_TARGET = CustomersAndOrdersDataSet.DLL

FORM_SOURCES = $(CLIENTDIR)\WebServiceClient.VB SimpleCustomersWebService.VB
SERVICE_SOURCES = SimpleCustomersWebService.asmx.VB
DATA_SOURCES = CustomersAndOrdersDataSet.VB

# NOTE: The C# source file(s) below is a (are) temporary file(S) created by $(_WSDL)
CLEANUP = *.exe *.dll *.pdb  $(BINDIR)\*.dll $(BINDIR)\*.pdb SimpleCustomersWebService.VB CustomersAndOrdersDataSet.VB
#--------------------------------------------------

FORM_IMPORTS = $(_VB_WINFORMS_IMPORTS) /R:$(DATA_TARGET) /R:System.Data.DLL /R:System.Xml.DLL /R:System.Web.Services.Dll
SERVICE_IMPORTS = $(DLL_IMPORTS) /R:$(DATA_TARGET) /R:System.DLL /R:System.Data.DLL /R:System.Xml.DLL /R:System.Web.Services.Dll
DATA_IMPORTS = $(_VB_WINFORMS_IMPORTS) /R:System.Data.DLL /r:System.Xml.dll

#--------------------------------------------------
all : $(DATA_TARGET) $(FORM_TARGET) $(BINDIR)\$(SERVICE_TARGET)
  rem Sample $(MAKEDIR)

#- Copy DLLs to application bin dir
$(BINDIR)\$(SERVICE_TARGET) : $(SERVICE_TARGET) $(DATA_TARGET)
        copy $(SERVICE_TARGET) $(BINDIR)
	copy $(DATA_TARGET) $(BINDIR)

$(DATA_TARGET) : $(DATA_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
        $(_BC) $(_VB_DLL_FLAGS) $(DATA_IMPORTS) /out:$@ $**

$(SERVICE_TARGET) : $(SERVICE_SOURCES) $(DATA_TARGET)
        $(_BC) $(_VB_DLL_FLAGS) $(SERVICE_IMPORTS) /out:$@ $(SERVICE_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

$(FORM_TARGET) : $(FORM_SOURCES) $(DATA_TARGET)
        $(_BC) $(_VB_EXE_FLAGS) $(FORM_IMPORTS) /out:$@ $(FORM_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

SimpleCustomersWebService.VB : SimpleCustomersWebService.WSDL
        $(_WSDL) /l:VB /n:Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding.localhost /out:$@ $**

CustomersAndOrdersDataSet.VB : $(DATADIR)\CustomersAndOrdersDataSet.xsd
        $(_XSD) /d /l:VB /n:Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding.Data $**

#$(_WSDL) /c:getWSDL /URL:http://localhost/quickstart/winforms/Samples/Data/WebServiceBinding/VB/SimpleCustomersWebService.asmx?WSDL
SimpleCustomersWebService.wsdl : SimpleCustomersWebService.asmx
        ECHO ***
        ECHO ***
        ECHO *** You need to rebuild the SimpleCustomersWebService WSDL file - see makefile for details
        ECHO ***
        ECHO ***

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
  if exist obj $(_RMDIR) obj
  if exist $(CLIENTDIR)\obj $(_RMDIR) $(CLIENTDIR)\obj
  if exist $(DATADIR)\obj $(_RMDIR) $(DATADIR)\obj
#--------------------------------------------------
