#
# Set an environment variable OfficeDir to identify the location of Office
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)
_IMPORTS = /r:..\Excel.dll
_XLDIR=..

all: $(_XLDIR)\Excel.DLL AutoExcel.exe

!include ..\Excel.mak

AutoExcel.exe:
    csc $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ AutoExcel.cs

clean: RemoveDLL
    -@if exist AutoExcel.exe erase AutoExcel.exe
    -@if exist AutoExcel.pdb erase AutoExcel.pdb
