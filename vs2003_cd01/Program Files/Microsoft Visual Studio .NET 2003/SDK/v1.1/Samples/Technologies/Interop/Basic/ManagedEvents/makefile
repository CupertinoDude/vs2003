#
# ManagedEvents makefile
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS) /target:library
_IMPORTS=

all: EventSrc.tlb EventSrc.dll

EventSrc.tlb: EventSrc.dll
    regasm $*.dll /tlb:$@

EventSrc.dll:
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) .\EventSource\*.cs

clean:
    -@if exist Sink.exe erase Sink.exe
    -@if exist EventSrc.tlb erase EventSrc.tlb
    -@if exist EventSrc.dll regasm /u EventSrc.dll
    -@if exist EventSrc.dll erase EventSrc.dll
