!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_QSDIR)\TocSwitch.dll \
  $(_WFDIR)\TocSwitch.dll \
  $(_HTDIR)\TocSwitch.dll \
  $(_APDIR)\TocSwitch.dll
CLEANUP = $(_QSDIR)\TocSwitch.dll \
  $(_WFDIR)\TocSwitch.dll \
  $(_HTDIR)\TocSwitch.dll \
  $(_APDIR)\TocSwitch.dll \
  $(_QSDIR)\TocSwitch.pdb \
  $(_WFDIR)\TocSwitch.pdb \
  $(_HTDIR)\TocSwitch.pdb \
  $(_APDIR)\TocSwitch.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.dll
_QSDIR=$(NETSAMPLEPATH)\QuickStart\Bin
_WFDIR=$(NETSAMPLEPATH)\QuickStart\WINFORMS\Bin
_HTDIR=$(NETSAMPLEPATH)\QuickStart\HowTo\Bin
_APDIR=$(NETSAMPLEPATH)\QuickStart\AspPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_QSDIR)\TocSwitch.dll : TocSwitch.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_QSDIR) md $(_QSDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_WFDIR)\TocSwitch.dll : TocSwitch.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_WFDIR) md $(_WFDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_HTDIR)\TocSwitch.dll : TocSwitch.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_HTDIR) md $(_HTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_APDIR)\TocSwitch.dll : TocSwitch.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_APDIR) md $(_APDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
