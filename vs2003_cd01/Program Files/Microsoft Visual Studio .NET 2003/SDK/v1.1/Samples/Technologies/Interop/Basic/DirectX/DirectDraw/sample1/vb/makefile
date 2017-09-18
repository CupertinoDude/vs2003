#
# Sample1 VB makefile
#

_DXDIR=..\..\..
!IFDEF DEBUG
_VB_DBG_FLAGS=/debug+
!ENDIF

_VB_OPTION_FLAGS=/optionstrict- /t:winexe
_VB_EXE_FLAGS=/t:exe $(_VB_DBG_FLAGS) $(_VB_OPTION_FLAGS)
_IMPORTS=/r:System.DLL /r:System.Windows.Forms.DLL /r:System.Drawing.dll /r:DxVBLib.dll


all: DxVBLib.DLL Sample1Form.exe

!include $(_DXDIR)\DxVBLib.mak

Sample1Form.exe:
    vbc $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$@ $*.vb

clean:
    -@if exist DxVBLib.DLL erase DxVBLib.DLL
    -@if exist Sample1Form.exe erase Sample1Form.exe
    -@if exist Sample1Form.pdb erase Sample1Form.pdb

