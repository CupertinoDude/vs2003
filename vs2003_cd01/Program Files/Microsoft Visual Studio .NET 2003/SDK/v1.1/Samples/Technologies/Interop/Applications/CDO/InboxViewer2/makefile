#
# Makefile
#

#Set up the library build flags
!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_DLL_FLAGS=$(_CS_DBG_FLAGS) /t:library

all: CDODataProvider.DLL

CDODataProvider.DLL: *.cs
	csc $(_CS_DLL_FLAGS) /out:$@ $*.cs
	regasm $*.dll /tlb:$*.tlb

clean:
    -@if exist CDODataProvider.DLL regasm /u CDODataProvider.DLL
    -@if exist CDODataProvider.DLL erase CDODataProvider.DLL
    -@if exist CDODataProvider.pdb erase CDODataProvider.pdb
    -@if exist CDODataProvider.tlb erase CDODataProvider.tlb