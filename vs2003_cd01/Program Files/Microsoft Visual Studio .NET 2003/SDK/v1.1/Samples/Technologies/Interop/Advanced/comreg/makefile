#
# Makefile 
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)


all: comreg.exe

comreg.exe: comreg.cs programbase.cs fusioninstall.cs assemblyinfo.cs
	csc.exe  $(_CS_EXE_FLAGS) /out:$@ $**


clean:
    -@if exist comreg.exe erase comreg.exe

