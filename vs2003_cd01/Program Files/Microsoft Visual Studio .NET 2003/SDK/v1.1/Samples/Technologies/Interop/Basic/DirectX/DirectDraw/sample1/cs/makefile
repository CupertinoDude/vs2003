#
# Sample1 C# makefile
#

_DXDIR=..\..\..
!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS) /t:winexe
_IMPORTS=/r:System.DLL /r:System.Windows.Forms.DLL /r:System.Drawing.DLL /r:DxVBLib.DLL

all: DxVBLib.DLL Sample1Form.exe

!include $(_DXDIR)\DxVBLib.mak

Sample1Form.exe:
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) $*.cs

clean:
    -@if exist DxVBLib.DLL erase DxVBLib.DLL
    -@if exist Sample1Form.exe erase Sample1Form.exe
    -@if exist Sample1Form.pdb erase Sample1Form.pdb
