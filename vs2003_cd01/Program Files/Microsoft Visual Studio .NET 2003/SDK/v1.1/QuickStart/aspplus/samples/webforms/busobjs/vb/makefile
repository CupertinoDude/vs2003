!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\HelloObjVB.dll \
  $(_OUTDIR)\DataObjVB.dll \
  $(_OUTDIR)\BusObjVB.dll
CLEANUP = $(_OUTDIR)\HelloObjVB.dll \
  $(_OUTDIR)\DataObjVB.dll \
  $(_OUTDIR)\BusObjVB.dll \
  $(_OUTDIR)\HelloObjVB.pdb \
  $(_OUTDIR)\DataObjVB.pdb \
  $(_OUTDIR)\BusObjVB.pdb 
#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Xml.dll
_DIMPORTS=/r:$(_OUTDIR)\DataObjVB.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\HelloObjVB.dll : HelloObj.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\DataObjVB.dll : DataObj.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\BusObjVB.dll : BusObj.vb $(_OUTDIR)\DataObjVB.dll
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) $(_DIMPORTS) /out:$@ BusObj.vb $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------