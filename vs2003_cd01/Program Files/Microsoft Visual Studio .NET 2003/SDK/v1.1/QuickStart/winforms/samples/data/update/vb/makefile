
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

FORM_SOURCES = $(CLIENTDIR)\UpdateForm.vb $(CLIENTDIR)\State.vb ListCustomers.vb UpdateCustomers.vb
SERVICE_SOURCES = UpdateCustomers.asmx.vb ListCustomers.asmx.vb
DATA_SOURCES = CustomersDataSet.vb

ROOTNS = Microsoft.Samples.Windows.Forms.Vb.Update
WEBNS = Microsoft.Samples.Windows.Forms.Vb.Update.localhost

# NOTE: The VB source file(s) below is a (are) temporary file(S) created by $(_WSDL)
CLEANUP = *.exe *.dll *.pdb  $(BINDIR)\*.dll $(BINDIR)\*.pdb ListCustomers.vb UpdateCustomers.vb CustomersDataSet.vb
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

ListCustomers.vb : ListCustomers.WSDL
        $(_WSDL) /l:VB /n:$(WEBNS) /out:$@ $**

UpdateCustomers.vb : UpdateCustomers.WSDL
        $(_WSDL) /l:VB /n:$(WEBNS) /out:$@ $**

CustomersDataSet.vb : $(DATADIR)\CustomersDataSet.xsd
        $(_XSD) /d /l:VB /n:$(ROOTNS).Data $**

#$(_WSDL) /c:getWSDL /URL:http://localhost/quickstart/winforms/Samples/Data/Update/vb/ListCustomers.asmx?WSDL
ListCustomers.WSDL : ListCustomers.asmx
        ECHO ***
        ECHO ***
        ECHO *** You need to rebuild the ListCustomers WSDL file - see makefile for details
        ECHO ***
        ECHO ***

#$(_WSDL) /c:getWSDL /URL:http://localhost/quickstart/winforms/Samples/Data/Update/vb/UpdateCustomers.asmx?WSDL
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
