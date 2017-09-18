#
# Makefile
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)

all: shellcmd.exe

shellcmd.exe: shellcmd.cs shellextlib.cs
	csc.exe $(_CS_EXE_FLAGS) /out:$@ $**

clean:
    -@if exist shellcmd.exe erase shellcmd.exe
    -@if exist shellcmd.pdb erase shellcmd.pdb

