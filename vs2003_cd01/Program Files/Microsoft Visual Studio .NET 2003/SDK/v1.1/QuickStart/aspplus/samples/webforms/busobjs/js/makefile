!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\HelloObjJS.dll \
  $(_OUTDIR)\DataObjJS.dll \
  $(_OUTDIR)\BusObjJS.dll
CLEANUP = $(_OUTDIR)\HelloObjJS.dll \
  $(_OUTDIR)\DataObjJS.dll \
  $(_OUTDIR)\BusObjJS.dll \
  $(_OUTDIR)\HelloObjJS.pdb \
  $(_OUTDIR)\DataObjJS.pdb \
  $(_OUTDIR)\BusObjJS.pdb

#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Xml.dll
_DIMPORTS=/r:$(_OUTDIR)\DataObjJS.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\HelloObjJS.dll : HelloObj.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\DataObjJS.dll : DataObj.js
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\BusObjJS.dll : BusObj.js $(_OUTDIR)\DataObjJS.dll
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) $(_DIMPORTS) /out:$@ BusObj.js $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------