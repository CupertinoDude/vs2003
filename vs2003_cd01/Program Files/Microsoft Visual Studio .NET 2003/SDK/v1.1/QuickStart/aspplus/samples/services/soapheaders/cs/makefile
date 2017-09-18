!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#--------------------------------------------------
#_SDLPATH=http://localhost/quickstart/aspplus/samples/services/soapheaders/cs/soapheaders.asmx?WSDL
!include $(NETSAMPLEPATH)\QuickStart\master.mak
#--------------------------------------------------
TARGETS = SoapHeaders.cs \
  $(_OUTDIR)\SoapHeaders.dll
CLEANUP = SoapHeaders.cs \
  $(_OUTDIR)\SoapHeaders.dll \
  $(_OUTDIR)\SoapHeaders.pdb
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.Services.dll /r:System.XML.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\SoapHeaders.dll : SoapHeaders.cs $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
