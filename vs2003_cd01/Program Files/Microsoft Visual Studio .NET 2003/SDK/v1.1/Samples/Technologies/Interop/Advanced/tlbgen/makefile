#
# Makefile 
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)


all: tlbgen.exe

tlbgen.exe: tlbgen.cs programbase.cs tlbexp.cs assemblyinfo.cs strongname.cs resource.cs
	csc.exe $(_CS_EXE_FLAGS) /out:$@ $**

clean:
    -@if exist tlbgen.exe erase tlbgen.exe
