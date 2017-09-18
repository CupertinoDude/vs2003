#
# Sample2 VB makefile
#

_DXDIR=..\..\..
!IFDEF DEBUG
_VB_DBG_FLAGS=/debug+
!ENDIF

_VB_OPTION_FLAGS=/optionstrict- /t:winexe
_VB_EXE_FLAGS=/t:exe $(_VB_DBG_FLAGS) $(_VB_OPTION_FLAGS)
_IMPORTS=/r:System.DLL /r:System.Windows.Forms.DLL /r:System.Drawing.dll /r:DxVBLib.dll


all: DxVBLib.DLL Sample2Form.exe


!include $(_DXDIR)\DxVBLib.mak

Sample2Form.exe:
    vbc $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$@ $*.vb

clean:
    -@if exist DxVBLib.DLL erase DxVBLib.DLL
    -@if exist Sample2Form.exe erase Sample2Form.exe
    -@if exist Sample2Form.pdb erase Sample2Form.pdb
