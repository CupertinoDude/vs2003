#
#  Windows Forms example makefile
#

!IFDEF DEBUG
_VB_DBG_FLAGS=/debug+
!ENDIF

_VB_OPTION_FLAGS=/t:library
_VB_DLL_FLAGS=/t:exe $(_VB_DBG_FLAGS) $(_VB_OPTION_FLAGS)
_IMPORTS=/r:System.DLL /r:System.Windows.Forms.DLL /r:System.Drawing.dll

all: MyForm.dll

MyForm.dll: $*.vb
    vbc $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $*.vb
    regasm /tlb $@

run:
    start Forms.exe

clean:
    -@if exist MyForm.dll erase MyForm.dll
    -@if exist MyForm.pdb erase MyForm.pdb

