# Marshal.dll make file

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF

!IFDEF DEBUG
_CPP_DBG_FLAGS=/Zi /D "_DEBUG"
_LINK_DBG_FLAGS=/debug
!ELSE
_CPP_DBG_FLAGS=
_LINK_DBG_FLAGS=
!ENDIF


OUTFILE="Marshaler"
CPP=cl.exe
LINK32=link.exe

ALL : CLEAN "$(OUTFILE).dll"

CLEAN :
	-@erase "Marshaler.obj"
	-@erase "$(OUTFILE).dll"
	-@erase "$(OUTFILE).exp"
	-@erase "$(OUTFILE).ilk"
	-@erase "$(OUTFILE).lib"
	-@erase "$(OUTFILE).pdb"

CPP_PROJ= /CLR /MTd /W3 /Od /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /FD /c  $(_CPP_DBG_FLAGS)

LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib rpcrt4ext.lib /subsystem:windows /dll /incremental:yes /pdb:"$(OUTFILE).pdb" /machine:I386 /def:".\Marshaler.def" /out:"$(OUTFILE).dll" /implib:"$(OUTFILE).lib" $(_LINK_DBG_FLAGS)
DEF_FILE= \
	".\Marshaler.def"
LINK32_OBJS= \
	"Marshaler.obj"

"$(OUTFILE).dll" : $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetPath=$(OUTFILE).dll
InputPath=$(OUTFILE).dll
SOURCE="$(InputPath)"



.c.obj::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cpp.obj::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cxx.obj::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.c.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cpp.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cxx.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<


SOURCE=.\Marshaler.cpp

"Marshaler.obj" : $(SOURCE)



