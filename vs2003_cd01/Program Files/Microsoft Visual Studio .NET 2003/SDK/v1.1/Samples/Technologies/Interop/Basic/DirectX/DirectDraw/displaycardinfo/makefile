#
# DisplayCardInfo C# makefile
#

_DXDIR=..\..
!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)
_IMPORTS=/r:System.DLL /r:DxVBLib.DLL

all: DxVBLib.DLL DisplayCardInfo.exe

!include ..\..\DxVBLib.mak

DisplayCardInfo.exe:
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) $*.cs

clean:
    -@if exist DxVBLib.DLL erase DxVBLib.DLL
    -@if exist DisplayCardInfo.exe erase DisplayCardInfo.exe
    -@if exist DisplayCardInfo.pdb erase DisplayCardInfo.pdb
