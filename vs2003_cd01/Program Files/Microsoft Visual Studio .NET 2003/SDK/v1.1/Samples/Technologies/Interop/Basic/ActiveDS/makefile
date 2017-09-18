#
# ActiveDS makefile
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)
_IMPORTS=/r:System.Drawing.dll /r:System.dll /r:System.Windows.Forms.dll /r:ActiveDIS.dll

all: ActiveDIS.dll adsComputer.exe

ActiveDIS.dll:
    tlbimp /silent activeds.tlb /out:$@

adsComputer.exe:
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) .\Form\*.cs
    -@copy .\ico\*.ico .

clean:
    -@if exist *.dll erase *.dll
    -@if exist adsComputer.exe erase adsComputer.exe
    -@if exist adsComputer.pdb erase adsComputer.pdb
    -@if exist *.ico erase *.ico
