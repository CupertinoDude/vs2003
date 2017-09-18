!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\HelloObj.dll \
  $(_OUTDIR)\DataObj.dll \
  $(_OUTDIR)\BusObj.dll
CLEANUP = $(_OUTDIR)\HelloObj.dll \
  $(_OUTDIR)\DataObj.dll \
  $(_OUTDIR)\BusObj.dll \
  $(_OUTDIR)\HelloObj.pdb \
  $(_OUTDIR)\DataObj.pdb \
  $(_OUTDIR)\BusObj.pdb 

#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Xml.dll
_DIMPORTS=/r:$(_OUTDIR)\DataObj.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\HelloObj.dll : HelloObj.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\DataObj.dll : DataObj.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\BusObj.dll : BusObj.cs $(_OUTDIR)\DataObj.dll
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) $(_DIMPORTS) /out:$@ BusObj.cs $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------