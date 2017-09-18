# Microsoft Developer Studio Generated NMAKE File, Based on ComputerInfo.dsp
!IF "$(CFG)" == ""
CFG=ComputerInfo - Win32 Debug
!MESSAGE No configuration specified. Defaulting to ComputerInfo - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "ComputerInfo - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ComputerInfo.mak" CFG="ComputerInfo - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ComputerInfo - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

ALL : "$(OUTDIR)\ComputerInfo.dll" ".\Debug\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\ComputerInfo.obj"
	-@erase "$(INTDIR)\ComputerInfo.pch"
	-@erase "$(INTDIR)\ComputerInfo.res"
	-@erase "$(INTDIR)\FileInfo.obj"
	-@erase "$(INTDIR)\MachineInfo.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ComputerInfo.dll"
	-@erase "$(OUTDIR)\ComputerInfo.exp"
	-@erase "$(OUTDIR)\ComputerInfo.ilk"
	-@erase "$(OUTDIR)\ComputerInfo.lib"
	-@erase "$(OUTDIR)\ComputerInfo.pdb"
	-@erase ".\ComputerInfo.h"
	-@erase ".\ComputerInfo.tlb"
	-@erase ".\ComputerInfo_i.c"
	-@erase ".\Debug\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ComputerInfo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\ComputerInfo.pdb" /debug /machine:I386 /def:".\ComputerInfo.def" /out:"$(OUTDIR)\ComputerInfo.dll" /implib:"$(OUTDIR)\ComputerInfo.lib" /pdbtype:sept 
DEF_FILE= \
	".\ComputerInfo.def"
LINK32_OBJS= \
	"$(INTDIR)\ComputerInfo.obj" \
	"$(INTDIR)\FileInfo.obj" \
	"$(INTDIR)\MachineInfo.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\ComputerInfo.res"

"$(OUTDIR)\ComputerInfo.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\Debug
TargetPath=.\Debug\ComputerInfo.dll
InputPath=.\Debug\ComputerInfo.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
<< 
	
CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)\ComputerInfo.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ComputerInfo.res" /d "_DEBUG" 

!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("ComputerInfo.dep")
!INCLUDE "ComputerInfo.dep"
!ELSE 
!MESSAGE Warning: cannot find "ComputerInfo.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "ComputerInfo - Win32 Debug"
SOURCE=.\ComputerInfo.cpp

"$(INTDIR)\ComputerInfo.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\ComputerInfo.pch" ".\ComputerInfo_i.c" ".\ComputerInfo.h"


SOURCE=.\ComputerInfo.idl
MTL_SWITCHES=/tlb ".\ComputerInfo.tlb" /h "ComputerInfo.h" /iid "ComputerInfo_i.c" /Oicf 

".\ComputerInfo.tlb"	".\ComputerInfo.h"	".\ComputerInfo_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


SOURCE=.\ComputerInfo.rc

"$(INTDIR)\ComputerInfo.res" : $(SOURCE) "$(INTDIR)" ".\ComputerInfo.tlb"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\dlldatax.c
SOURCE=.\FileInfo.cpp

"$(INTDIR)\FileInfo.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\ComputerInfo.pch" ".\ComputerInfo.h"


SOURCE=.\MachineInfo.cpp

"$(INTDIR)\MachineInfo.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\ComputerInfo.pch" ".\ComputerInfo.h"


SOURCE=.\StdAfx.cpp
CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)\ComputerInfo.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\ComputerInfo.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<



!ENDIF 

