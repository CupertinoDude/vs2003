###############################################################################
##
## Microsoft CLR Profiler Sample (ProfilerHST) Makefile
##
###############################################################################


###############################################################################
##
## General
##
###############################################################################
!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

SOURCE=.

OUTDIR= $(SOURCE)\Debug
INTDIR= $(SOURCE)\Debug


###############################################################################
##
## Tools (compiler, linker, etc)
##
###############################################################################
_LINKER= link.exe
_COMPILER= cl.exe


###############################################################################
##
## Win32 Libs
##
###############################################################################
WIN32_SDK_LIBS= \
    "uuid.lib"		 \
    "ole32.lib"      \
    "libcpd.lib"     \
    "user32.lib"     \
    "oleaut32.lib"   \
    "advapi32.lib"   \
    "kernel32.lib"   


###############################################################################
##
## CLR Libs
##
###############################################################################
CLR_LIBS= \
    "corguids.lib"
    
    
###############################################################################
##
## Profiler obj Files
##
###############################################################################
OBJS= \
	"$(INTDIR)\ProfilerHST.obj"		


###############################################################################
##
## Compiler Macros
##
###############################################################################
_MACROS= \
    /D "_WIN32"                     \
    /D "_DEBUG"                     \
    /D "UNICODE"                    \
    /D "_UNICODE"                   \
    /D "_SAMPLES_"                  \
    /D "WIN32_LEAN_AND_MEAN"


###############################################################################
##
## Compiler/Linker Flags
##
###############################################################################
_CFLAGS= \
   $(_MACROS) /I..\include /nologo /Gz /GX /MTd /W3 /Zi /Od /Gy \
   /Fp"$(INTDIR)\ProfilerHST.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

_LFLAGS= \
    /nologo /dll /def:"$(SOURCE)\ProfilerHST.def" /incremental:no /machine:I386 \
    /out:"$(OUTDIR)\ProfilerHST.dll" 


###############################################################################
##
## Build Profiler DLL
##
###############################################################################
ALL : "$(OUTDIR)\ProfilerHST.dll"


###############################################################################
##
## Output Directory
##
###############################################################################
"$(OUTDIR)":
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"


###############################################################################
##
## Compiler/Linker Rules
##
###############################################################################
.cpp{$(INTDIR)}.obj::
   $(_COMPILER) @<<
   $(_CFLAGS) $< 
<<

"$(OUTDIR)\ProfilerHST.dll": "$(OUTDIR)" $(OBJS)
    $(_LINKER) @<<
  $(WIN32_SDK_LIBS) $(CLR_LIBS) $(_LFLAGS) $(OBJS)
<<


###############################################################################
##
## Clean
##
###############################################################################
CLEAN :
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ProfilerHST.dll"
	-@erase "$(OUTDIR)\ProfilerHST.exp"
	-@erase "$(OUTDIR)\ProfilerHST.ilk"
	-@erase "$(OUTDIR)\ProfilerHST.lib"
	-@erase "$(OUTDIR)\ProfilerHST.pdb"
	-@erase "$(INTDIR)\ProfilerHST.obj"


###############################################################################
##
## Profiler Sources
##
###############################################################################
"$(INTDIR)\ProfilerHST.obj":        $(SOURCE)\ProfilerHST.cpp      	"$(INTDIR)"

## End of File
