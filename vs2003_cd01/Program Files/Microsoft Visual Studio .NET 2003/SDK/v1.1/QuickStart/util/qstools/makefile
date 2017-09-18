!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_QSDIR)\QSTools.dll \
  $(_WFDIR)\QSTools.dll \
  $(_HTDIR)\QSTools.dll \
  $(_APDIR)\QSTools.dll \
  $(_VS_DATA_CS)\QSTools.dll \
  $(_VS_DATA_VB)\QSTools.dll \
  $(_WF_DATA_MASTER_CS)\QSTools.dll \
  $(_WF_DATA_MASTER_VB)\QSTools.dll \
  $(_WF_DATA_UPDATE_CS)\QSTools.dll \
  $(_WF_DATA_UPDATE_VB)\QSTools.dll

CLEANUP = $(_QSDIR)\QSTools.dll \
  $(_WFDIR)\QSTools.dll \
  $(_HTDIR)\QSTools.dll \
  $(_APDIR)\QSTools.dll \
  $(_VS_DATA_CS)\QSTools.dll \
  $(_VS_DATA_VB)\QSTools.dll \
  $(_WF_DATA_MASTER_CS)\QSTools.dll \
  $(_WF_DATA_MASTER_VB)\QSTools.dll \
  $(_WF_DATA_UPDATE_CS)\QSTools.dll \
  $(_WF_DATA_UPDATE_VB)\QSTools.dll \
  $(_QSDIR)\QSTools.pdb \
  $(_WFDIR)\QSTools.pdb \
  $(_HTDIR)\QSTools.pdb \
  $(_APDIR)\QSTools.pdb \
  $(_VS_DATA_CS)\QSTools.pdb \
  $(_VS_DATA_VB)\QSTools.pdb \
  $(_WF_DATA_MASTER_CS)\QSTools.pdb \
  $(_WF_DATA_MASTER_VB)\QSTools.pdb \
  $(_WF_DATA_UPDATE_CS)\QSTools.pdb \
  $(_WF_DATA_UPDATE_VB)\QSTools.pdb 
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.dll

_QSDIR=$(NETSAMPLEPATH)\QuickStart\Bin
_WFDIR=$(NETSAMPLEPATH)\QuickStart\WINFORMS\Bin
_HTDIR=$(NETSAMPLEPATH)\QuickStart\HowTo\Bin
_APDIR=$(NETSAMPLEPATH)\QuickStart\AspPlus\Bin

_VS_DATA_CS=$(NETSAMPLEPATH)\QuickStart\AspPlus\Samples\VStudio\WebForms\Data\CS\Bin
_VS_DATA_VB=$(NETSAMPLEPATH)\QuickStart\AspPlus\Samples\VStudio\WebForms\Data\VB\Bin

_WF_DATA_MASTER_CS=$(NETSAMPLEPATH)\QuickStart\WinForms\Samples\Data\MasterDetails\CS\Bin
_WF_DATA_MASTER_VB=$(NETSAMPLEPATH)\QuickStart\WinForms\Samples\Data\MasterDetails\VB\Bin

_WF_DATA_UPDATE_CS=$(NETSAMPLEPATH)\QuickStart\WinForms\Samples\Data\Update\CS\Bin
_WF_DATA_UPDATE_VB=$(NETSAMPLEPATH)\QuickStart\WinForms\Samples\Data\Update\VB\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_QSDIR)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_QSDIR) md $(_QSDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_WFDIR)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_WFDIR) md $(_WFDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_HTDIR)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_HTDIR) md $(_HTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_APDIR)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_APDIR) md $(_APDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_VS_DATA_CS)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_VS_DATA_CS) md $(_VS_DATA_CS)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_VS_DATA_VB)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_VS_DATA_VB) md $(_VS_DATA_VB)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_WF_DATA_MASTER_CS)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_WF_DATA_MASTER_CS) md $(_WF_DATA_MASTER_CS)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_WF_DATA_MASTER_VB)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_WF_DATA_MASTER_VB) md $(_WF_DATA_MASTER_VB)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_WF_DATA_UPDATE_CS)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_WF_DATA_UPDATE_CS) md $(_WF_DATA_UPDATE_CS)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

$(_WF_DATA_UPDATE_VB)\QSTools.dll : InputValidator.cs LangSwitch.cs Tab.cs TabControl.cs $(NETSAMPLEPATH)\Quickstart\QSVersion.cs
  if not exist $(_WF_DATA_UPDATE_VB) md $(_WF_DATA_UPDATE_VB)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)


clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
