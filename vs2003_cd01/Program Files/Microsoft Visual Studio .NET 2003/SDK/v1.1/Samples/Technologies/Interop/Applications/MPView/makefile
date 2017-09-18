#
# MPView makefile
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)
_IMPORTS=/r:System.Drawing.dll /r:System.dll /r:System.Windows.Forms.dll /r:System.Data.dll

all: MpView.exe

MpView.exe : MODULECOLLib.dll COMPUTERINFOLib.dll
    csc $(_CS_EXE_FLAGS) /out:$@ .\Form\*.cs  $(_IMPORTS) /r:MODULECOLLib.dll /r:COMPUTERINFOLib.dll 
    copy .\Form\*.ico
    copy .\ModuleCol\ModuleCol.dll
    copy .\ComputerInfo\ComputerInfo.dll

MODULECOLLib.dll : ModuleCol.tlb
    tlbimp ModuleCol.tlb /out:$@

COMPUTERINFOLib.dll : ComputerInfo.tlb
    tlbimp ComputerInfo.tlb /out:$@

ModuleCol.tlb : 
    copy .\ModuleCol\$@ .

ComputerInfo.tlb :
    copy .\ComputerInfo\$@

clean:
    -@if exist MpView.exe erase MpView.exe
    -@if exist MpView.pdb erase MpView.pdb
    -@if exist *.ico erase *.ico
    -@if exist MODULECOLLib.dll erase MODULECOLLib.dll
    -@if exist COMPUTERINFOLib.dll erase COMPUTERINFOLib.dll
    -@if exist ModuleCol.tlb erase ModuleCol.tlb
    -@if exist ComputerInfo.tlb erase ComputerInfo.tlb
