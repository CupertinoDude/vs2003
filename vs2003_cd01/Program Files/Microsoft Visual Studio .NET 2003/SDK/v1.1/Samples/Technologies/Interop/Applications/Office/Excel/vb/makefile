# Set an environment variable OfficeDir to identify the location of Office
#

!IFDEF DEBUG
_VB_DBG_FLAGS=/debug+
!ENDIF

_VB_OPTION_FLAGS=/optionstrict-
_VB_EXE_FLAGS=/t:exe $(_VB_DBG_FLAGS) $(_VB_OPTION_FLAGS)
_IMPORTS = /r:..\Excel.dll
_XLDIR=..


all: $(_XLDIR)\Excel.DLL AutoExcel.exe 

!include ..\Excel.mak

AutoExcel.exe:
    vbc $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$@ $*.vb

clean: RemoveDLL
    -@if exist AutoExcel.exe erase AutoExcel.exe
    -@if exist AutoExcel.pdb erase AutoExcel.pdb
