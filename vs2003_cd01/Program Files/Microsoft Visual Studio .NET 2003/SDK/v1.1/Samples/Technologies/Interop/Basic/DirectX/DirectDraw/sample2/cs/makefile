#
# Sample2 C# makefile
#

_DXDIR=..\..\..
!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS) /t:winexe
_IMPORTS=/r:System.DLL /r:System.Windows.Forms.DLL /r:System.Drawing.DLL /r:DxVBLib.DLL

all: DxVBLib.DLL Sample2Form.exe

!include $(_DXDIR)\DxVBLib.mak

Sample2Form.exe:
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) $*.cs

clean:
    -@if exist DxVBLib.DLL erase DxVBLib.DLL
    -@if exist Sample2Form.exe erase Sample2Form.exe
    -@if exist Sample2Form.pdb erase Sample2Form.pdb
