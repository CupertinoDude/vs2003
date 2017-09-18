###############################################################################
##
## Microsoft .NET MetaData Dump Utility (MetaInfo) Makefile
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
## .NET Libs
##
###############################################################################
NET_LIBS= \
    "corguids.lib"
    
    
###############################################################################
##
## MetaInfo obj files
##
###############################################################################
OBJS= \
	"$(INTDIR)\metainfo.obj"     \
	"$(INTDIR)\mdinfo.obj"       \
	"$(INTDIR)\mdobj.obj"        \


###############################################################################
##
## MACROS
##
###############################################################################
_MACROS= \
    /D "_WIN32"                     \
    /D "_DEBUG"                     \
    /D "_WIN32_DCOM"                \
    /D "WIN32_LEAN_AND_MEAN"        \
    /D "JIT_OR_NATIVE_SUPPORTED"    \
    /D "_META_DATA_SCOPE_WRAPPER_"  \
    /D "UNICODE"		    \
    /D "_UNICODE"


###############################################################################
##
## FLAGS
##
###############################################################################
_CFLAGS= \
   $(_MACROS) /Gz /nologo /MD /W2 /Gm /GX /Zi /Od \
   /Fp"$(INTDIR)\metainfo.pch" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 


_LFLAGS= \
    /nologo /subsystem:console /incremental:no /machine:I386 /debug /nodefaultlib /out:"$(OUTDIR)\metainfo.exe"


###############################################################################
##
## Build MetaInfo
##
###############################################################################
ALL: "$(OUTDIR)\metainfo.exe"


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

"$(OUTDIR)\metainfo.exe": "$(OUTDIR)" $(OBJS)
    $(_LINKER) @<<
  $(WIN32_SDK_LIBS) $(NET_LIBS) $(_LFLAGS) $(OBJS)
<<


###############################################################################
##
## Clean up
##
###############################################################################
CLEAN:
    -@erase "$(INTDIR)\vc60.idb"
    -@erase "$(INTDIR)\mdinfo.obj"
    -@erase "$(INTDIR)\mdobj.obj"
    -@erase "$(INTDIR)\metainfo.obj"
    -@erase "$(OUTDIR)\metainfo.exe"


###############################################################################
##
## Metainfo Sources
##
###############################################################################
"$(INTDIR)\mdobj.obj":        $(SOURCE)\mdobj.cpp        "$(INTDIR)"
"$(INTDIR)\dmdobj.obj":       $(SOURCE)\mdinfo.cpp       "$(INTDIR)"
"$(INTDIR)\metainfo.obj":     $(SOURCE)\metainfo.cpp     "$(INTDIR)"

## End of File
