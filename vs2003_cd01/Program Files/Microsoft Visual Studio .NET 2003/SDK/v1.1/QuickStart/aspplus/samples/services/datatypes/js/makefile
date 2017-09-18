!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#--------------------------------------------------
# Lets override some default rules
#_SDLPATH=http://localhost/quickstart/aspplus/samples/services/datatypes/js/datatypes.asmx?WSDL
!include $(NETSAMPLEPATH)\QuickStart\master.mak
#--------------------------------------------------
TARGETS = DataTypes.js \
  $(_OUTDIR)\DataTypesJS.dll
CLEANUP = DataTypes.js \
  $(_OUTDIR)\DataTypesJS.dll \
  $(_OUTDIR)\DataTypesJS.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.Services.dll /r:System.XML.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\DataTypesJS.dll : DataTypes.js $(NETSAMPLEPATH)\QuickStart\QSVersion.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
