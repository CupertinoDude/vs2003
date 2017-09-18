!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\Personalization.dll \
  $(_OUTDIR)\PortalModuleControl.dll \
  $(_OUTDIR)\PortalModulePage.dll
CLEANUP = $(_OUTDIR)\Personalization.dll \
  $(_OUTDIR)\PortalModuleControl.dll \
  $(_OUTDIR)\PortalModulePage.dll \
  $(_OUTDIR)\Personalization.pdb \
  $(_OUTDIR)\PortalModuleControl.pdb \
  $(_OUTDIR)\PortalModulePage.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.dll /r:System.Data.dll /r:System.Xml.dll
_DIMPORTS=/r:$(_OUTDIR)\Personalization.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Samples\Portal\VB\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\Personalization.dll : Personalization.vb $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\PortalModuleControl.dll : PortalModuleControl.vb $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) $(_DIMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\PortalModulePage.dll : PortalModulePage.vb $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) $(_DIMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
