###############################################################################
##
## Microsoft Common Language Runtime Debugger Test Shell (CORDBG) Makefile
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
    "uuid.lib"       \
    "ole32.lib"      \
    "libcpd.lib"     \
    "user32.lib"     \
    "rpcrt4.lib"     \
    "imagehlp.lib"   \
    "oleaut32.lib"   \
    "advapi32.lib"   \
    "kernel32.lib"   \
    "msvcrtd.lib"    


###############################################################################
##
## CLR Libs
##
###############################################################################
CLR_LIBS= \
    "corguids.lib"
    
    
###############################################################################
##
## Debugger Shell obj Files
##
###############################################################################
OBJS= \
	"$(INTDIR)\utf.obj"          \
	"$(INTDIR)\shell.obj"        \
	"$(INTDIR)\source.obj"       \
	"$(INTDIR)\dshell.obj"       \
    "$(INTDIR)\cordbg.obj"       \
	"$(INTDIR)\commands.obj"     \
    "$(INTDIR)\debuggerutil.obj" 


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
    /D "_WIN32_DCOM"                \
    /D "WIN32_LEAN_AND_MEAN"        \
    /D "JIT_OR_NATIVE_SUPPORTED"    


###############################################################################
##
## Compiler/Linker Flags
##
###############################################################################
_CFLAGS= \
   $(_MACROS) /Gz /nologo /MD /W2 /Gm /GX /Zi /Od \
   /Fp"$(INTDIR)\cordbg.pch" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

_LFLAGS= \
    /nologo /subsystem:console /incremental:no /machine:I386 /nodefaultlib \
    /out:"$(OUTDIR)\cordbg.exe"


###############################################################################
##
## Build Debugger Shell
##
###############################################################################
ALL: "$(OUTDIR)\cordbg.exe"


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

.c{$(INTDIR)}.obj::
   $(_COMPILER) @<<
   $(_CFLAGS) $< 
<<

"$(OUTDIR)\cordbg.exe": "$(OUTDIR)" $(OBJS)
    $(_LINKER) @<<
  $(WIN32_SDK_LIBS) $(CLR_LIBS) $(_LFLAGS) $(OBJS)
<<


###############################################################################
##
## Clean
##
###############################################################################
CLEAN:
	-@erase "$(INTDIR)\utf.obj"
    -@erase "$(INTDIR)\vc60.idb"
    -@erase "$(INTDIR)\shell.obj"
    -@erase "$(INTDIR)\dshell.obj"
    -@erase "$(INTDIR)\cordbg.obj"
    -@erase "$(INTDIR)\source.obj"
    -@erase "$(OUTDIR)\cordbg.exe"
    -@erase "$(INTDIR)\commands.obj"
    -@erase "$(INTDIR)\debuggerutil.obj"


###############################################################################
##
## Debugger Shell Sources
##
###############################################################################
"$(INTDIR)\utf.obj":          $(SOURCE)\utf.c            "$(INTDIR)"
"$(INTDIR)\shell.obj":        $(SOURCE)\shell.cpp        "$(INTDIR)"
"$(INTDIR)\dshell.obj":       $(SOURCE)\dshell.cpp       "$(INTDIR)"
"$(INTDIR)\source.obj":       $(SOURCE)\source.cpp       "$(INTDIR)"
"$(INTDIR)\cordbg.obj":       $(SOURCE)\cordbg.cpp       "$(INTDIR)"
"$(INTDIR)\commands.obj":     $(SOURCE)\commands.cpp     "$(INTDIR)"
"$(INTDIR)\debuggerutil.obj": $(SOURCE)\debuggerutil.cpp "$(INTDIR)"

## End of File
