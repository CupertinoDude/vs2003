#
# Makefile 
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)
_IMPORTS=/r:SHDocVw.dll

all: Shdocvw.dll Explorer.exe

Shdocvw.dll:
	tlbimp shdocvw.dll

Explorer.exe: 
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) $*.cs


clean:
    -@if exist SHDocVw.dll erase SHDocVw.dll
    -@if exist Explorer.exe erase Explorer.exe
    -@if exist Explorer.pdb erase Explorer.pdb
