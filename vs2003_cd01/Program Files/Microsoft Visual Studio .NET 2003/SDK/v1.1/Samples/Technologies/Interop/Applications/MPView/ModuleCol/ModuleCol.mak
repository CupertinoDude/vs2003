# Microsoft Developer Studio Generated NMAKE File, Based on ModuleCol.dsp
!IF "$(CFG)" == ""
CFG=ModuleCol - Win32 Debug
!MESSAGE No configuration specified. Defaulting to ModuleCol - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "ModuleCol - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ModuleCol.mak" CFG="ModuleCol - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ModuleCol - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe
OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\ModuleCol.dll" ".\Debug\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\DllCol.obj"
	-@erase "$(INTDIR)\ModuleCol.obj"
	-@erase "$(INTDIR)\ModuleCol.pch"
	-@erase "$(INTDIR)\ModuleCol.res"
	-@erase "$(INTDIR)\ProcCollection.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ModuleCol.dll"
	-@erase "$(OUTDIR)\ModuleCol.exp"
	-@erase "$(OUTDIR)\ModuleCol.ilk"
	-@erase "$(OUTDIR)\ModuleCol.lib"
	-@erase "$(OUTDIR)\ModuleCol.pdb"
	-@erase ".\ModuleCol.h"
	-@erase ".\ModuleCol.tlb"
	-@erase ".\ModuleCol_i.c"
	-@erase ".\Debug\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ModuleCol.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib Psapi.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\ModuleCol.pdb" /debug /machine:I386 /def:".\ModuleCol.def" /out:"$(OUTDIR)\ModuleCol.dll" /implib:"$(OUTDIR)\ModuleCol.lib" /pdbtype:sept 
DEF_FILE= \
	".\ModuleCol.def"
LINK32_OBJS= \
	"$(INTDIR)\DllCol.obj" \
	"$(INTDIR)\ModuleCol.obj" \
	"$(INTDIR)\ProcCollection.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\ModuleCol.res"

"$(OUTDIR)\ModuleCol.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\Debug
TargetPath=.\Debug\ModuleCol.dll
InputPath=.\Debug\ModuleCol.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)\ModuleCol.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL_PROJ=
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ModuleCol.res" /d "_DEBUG" 

!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("ModuleCol.dep")
!INCLUDE "ModuleCol.dep"
!ELSE 
!MESSAGE Warning: cannot find "ModuleCol.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "ModuleCol - Win32 Debug"
SOURCE=.\DllCol.cpp

"$(INTDIR)\DllCol.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\ModuleCol.pch" ".\ModuleCol.h"


SOURCE=.\dlldatax.c
SOURCE=.\ModuleCol.cpp

"$(INTDIR)\ModuleCol.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\ModuleCol.pch" ".\ModuleCol_i.c" ".\ModuleCol.h"


SOURCE=.\ModuleCol.idl
MTL_SWITCHES=/tlb ".\ModuleCol.tlb" /h "ModuleCol.h" /iid "ModuleCol_i.c" /Oicf 

".\ModuleCol.tlb"	".\ModuleCol.h"	".\ModuleCol_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


SOURCE=.\ModuleCol.rc

"$(INTDIR)\ModuleCol.res" : $(SOURCE) "$(INTDIR)" ".\ModuleCol.tlb"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\ProcCollection.cpp

"$(INTDIR)\ProcCollection.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\ModuleCol.pch" ".\ModuleCol.h"


SOURCE=.\StdAfx.cpp
CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)\ModuleCol.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\ModuleCol.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<



!ENDIF 

