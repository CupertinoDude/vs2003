#
# WMI sample makefile
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)
_IMPORTS=/r:System.Drawing.dll /r:System.dll /r:System.Windows.Forms.dll

all: PSView.exe
    -@copy .\ico\*.ico

PSView.exe: WBEMSCRIPTING.dll
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) /r:WBEMSCRIPTING.dll .\Form\*.cs

WBEMSCRIPTING.dll:
    tlbimp wbemdisp.tlb /out:$@

clean:
    -@if exist *.ico erase *.ico
    -@if exist WBEMSCRIPTING.dll erase WBEMSCRIPTING.dll
    -@if exist PSView.exe erase PSView.exe
    -@if exist PSView.pdb erase PSView.pdb
