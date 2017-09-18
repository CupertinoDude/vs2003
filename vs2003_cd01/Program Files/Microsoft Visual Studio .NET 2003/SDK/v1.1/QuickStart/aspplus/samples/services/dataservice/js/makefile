!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#--------------------------------------------------
#_SDLPATH=http://localhost/quickstart/aspplus/samples/services/dataservice/js/dataservice.asmx?WSDL
!include $(NETSAMPLEPATH)\QuickStart\master.mak
#--------------------------------------------------
TARGETS = DataService.js \
  $(_OUTDIR)\DataServiceJS.dll
CLEANUP = DataService.js \
  $(_OUTDIR)\DataServiceJS.dll \
  $(_OUTDIR)\DataServiceJS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.Services.dll /r:System.XML.dll /r:System.Data.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\DataServiceJS.dll : DataService.js $(NETSAMPLEPATH)\QuickStart\QSVersion.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
