
TARGETS = LoanLib.tlb GAC
CLEANUP = *.dll *.tlb *.pdb
#--------------------------------------------------
all : $(TARGETS)

clean :
	@if exist LoanLib gacutil -u LoanLib.dll
	@if exist LoanLib regasm /unregister LoanLib.dll
	@if exist *.dll del *.dll
	@if exist *.tlb del *.tlb
	@if exist *.pdb del *.pdb

#--------------------------------------------------

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)

#--------------------------------------------------

LoanLib.dll : LoanLib.cs
	csc $(_CS_EXE_FLAGS) /t:library $*.cs

LoanLib.tlb : LoanLib.dll
	regasm /tlb $*.dll
	tlbexp $*.dll /names:LoanLib.names

#install assembly in GAC
GAC::
	gacutil -i LoanLib.dll 