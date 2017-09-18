# Set an environment variable OfficeDir to identify the location of Office
#

!IFNDEF LIB
!error LIB path variable undefined
!ENDIF

!IFDEF DEBUG
_C_DBG_FLAGS=/Zi
_L_DBG_FLAGS=/debug
!ENDIF
_CFLAGS=/c /CLR /AI.. $(_C_DBG_FLAGS)
_LFLAGS=$(_L_DBG_FLAGS) /nod:libcpmt.lib
_LIBS=kernel32.lib mscoree.lib
_XLDIR=..

all: $(_XLDIR)\Excel.DLL AutoExcel.exe 

!include ..\Excel.mak

AutoExcel.exe:
    cl $(_CFLAGS) $*.cpp
    link $(_LFLAGS) $(_LIBS) /out:$@ $*.obj


clean: RemoveDLL
    -@if exist AutoExcel.exe erase AutoExcel.exe
    -@if exist AutoExcel.obj erase AutoExcel.obj
    -@if exist AutoExcel.ilk erase AutoExcel.ilk
    -@if exist *.pdb erase *.pdb






