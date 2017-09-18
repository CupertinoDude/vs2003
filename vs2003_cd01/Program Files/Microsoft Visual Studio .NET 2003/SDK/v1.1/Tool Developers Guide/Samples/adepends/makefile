!include master.mak

_CS_EXE_FLAGS=$(_CS_EXE_FLAGS) /main:ADepends.MainProgram


_IMPORTS=$(_IMPORTS) \
  /r:System.Dll \
  /r:System.Drawing.Dll \
  /r:System.Windows.Forms.Dll \
  /r:System.Xml.Dll

all: Adepends.exe

Adepends.exe:  \
  appconfig.cs \
  assemblydependencies.cs \
  assemblyexceptioninfo.cs \
  assemblyinfo.cs \
  assemblyloadas.cs \
  assemblyref.cs \
  IAssemblyInfo.cs \
  loadassembly.cs \
  loadassemblyinfo.cs \
  localization.cs \
  moduleinfo.cs \
  parseopts.cs \
  adepends.cs \
  Gui\about.cs \
  Gui\explorer.cs \
  Gui\gui.cs \
  Gui\infopanels.cs \
  Gui\menu.cs \
  Gui\openmanifest.cs \
  Gui\paths.cs \
  Gui\resizeableform.cs \
  Gui\wfutils.cs
