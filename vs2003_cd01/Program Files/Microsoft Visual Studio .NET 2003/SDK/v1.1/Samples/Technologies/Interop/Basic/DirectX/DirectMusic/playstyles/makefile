#
# PlayStyles C# makefile
#

_DXDIR=..\..
!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS) /t:winexe
_IMPORTS=/r:System.Drawing.dll /r:System.Windows.Forms.dll /r:System.dll /r:DxVBLib.dll

all: DxVBLib.DLL PlayStyles.exe

!include $(_DXDIR)\DxVBLib.mak

PlayStyles.exe:
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) $*.cs

clean:
    -@if exist DxVBLib.DLL erase DxVBLib.DLL
    -@if exist PlayStyles.exe erase PlayStyles.exe
    -@if exist PlayStyles.pdb erase PlayStyles.pdb
