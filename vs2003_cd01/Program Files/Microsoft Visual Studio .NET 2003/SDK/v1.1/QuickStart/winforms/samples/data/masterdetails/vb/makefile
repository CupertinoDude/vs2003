
!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
DLLDEP = $(NETSAMPLEPATH)\QuickStart\bin\QSTools.dll
PDBDEP = $(NETSAMPLEPATH)\QuickStart\bin\QSTools.pdb

CLIENTDIR = Client
DATADIR = DataSet
BINDIR = bin

FORM_TARGET = MasterDetails.exe
SERVICE_TARGET = MasterDetailsWebService.DLL
DATA_TARGET = CustomersAndOrdersDataSet.DLL

FORM_SOURCES = $(CLIENTDIR)\CustomersForm.vb CustomersAndOrdersWebService.vb
SERVICE_SOURCES = CustomersAndOrdersWebService.asmx.vb
DATA_SOURCES = CustomersAndOrdersDataSet.vb

ROOTNS = Microsoft.Samples.Windows.Forms.Vb.MasterDetails
WEBNS = Microsoft.Samples.Windows.Forms.Vb.MasterDetails.localhost

# NOTE: The C# source file(s) below is a (are) temporary file(S) created by $(_WSDL)
CLEANUP = *.exe *.dll *.pdb CustomersAndOrders.vb $(BINDIR)\*.dll $(BINDIR)\*.pdb CustomersAndOrdersWebService.vb CustomersAndOrdersDataSet.vb
#--------------------------------------------------

FORM_IMPORTS = $(_VB_WINFORMS_IMPORTS) /R:$(DATA_TARGET) /R:System.Data.DLL /R:System.Xml.DLL /R:System.Web.Services.Dll
SERVICE_IMPORTS = $(DLL_IMPORTS) /R:$(DATA_TARGET) /R:System.DLL /R:System.Data.DLL /R:System.Xml.DLL /R:System.Web.Services.Dll /R:$(BINDIR)\QSTools.dll
DATA_IMPORTS = $(_VB_WINFORMS_IMPORTS) /R:System.Data.DLL /r:System.Xml.dll

#--------------------------------------------------
all : $(DATA_TARGET) $(FORM_TARGET) $(BINDIR)\$(SERVICE_TARGET)
  rem Sample $(MAKEDIR)

#- Copy DLLs to application bin dir
$(BINDIR)\$(SERVICE_TARGET) : $(SERVICE_TARGET) $(DATA_TARGET)
    copy $(SERVICE_TARGET) $(BINDIR)
    copy $(DATA_TARGET) $(BINDIR)

$(DATA_TARGET) : $(DATA_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
        $(_BC) /nowarn $(_VB_DLL_FLAGS) $(DATA_IMPORTS) /out:$@ $**

$(SERVICE_TARGET) : $(SERVICE_SOURCES) $(DATA_TARGET) $(BINDIR)\QSTools.dll
        $(_BC) $(_VB_DLL_FLAGS) $(SERVICE_IMPORTS) /out:$@ $(SERVICE_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

$(FORM_TARGET) : $(FORM_SOURCES) $(DATA_TARGET)
        $(_BC) $(_VB_EXE_FLAGS) $(FORM_IMPORTS) /out:$@ $(FORM_SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

CustomersAndOrdersWebService.vb : CustomersAndOrdersWebService.WSDL
        $(_WSDL) /l:VB /n:$(WEBNS) /out:$@ $**

CustomersAndOrdersDataSet.vb : $(DATADIR)\CustomersAndOrdersDataSet.xsd
        $(_XSD) /d /l:VB /n:$(ROOTNS).Data $**

#$(_WSDL) /c:getWSDL /URL:http://localhost/quickstart/winforms/Samples/Data/MasterDetails/vb/CustomersAndOrdersWebService.asmx?WSDL
CustomersAndOrdersWebService.WSDL : CustomersAndOrdersWebService.asmx
        ECHO ***
        ECHO ***
        ECHO *** You need to rebuild the CustomersAndOrdersWebService WSDL file - see makefile for details
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
#--------------------------------------------------
