!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#--------------------------------------------------
# Lets override some default rules
#_SDLPATH=http://localhost/quickstart/aspplus/samples/services/datatypes/vb/datatypes.asmx?WSDL
!include $(NETSAMPLEPATH)\QuickStart\master.mak
#--------------------------------------------------
TARGETS = DataTypes.vb \
  $(_OUTDIR)\DataTypesVB.dll
CLEANUP = DataTypes.vb \
  $(_OUTDIR)\DataTypesVB.dll \
  $(_OUTDIR)\DataTypesVB.pdb
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.Services.dll /r:System.XML.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\DataTypesVB.dll : DataTypes.vb $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
