!IFDEF DEBUG
_CPP_DBG_FLAGS=/Zi /D "_DEBUG"
_LINK_DBG_FLAGS=/debug
_VBC_DBG_FLAGS=/debug:full
_CSC_DBG_FLAGS=/debug:full
!ELSE
_CPP_DBG_FLAGS=
_LINK_DBG_FLAGS=
_VBC_DBG_FLAGS=/debug-
_CSC_DBG_FLAGS=/debug-
!ENDIF


first: run


all:	Account.dll Loan.dll RateSvr.dll Customer.dll

Account.dll:	Account.cpp
	cl /CLR /GX $(_CPP_DBG_FLAGS) $? -link -dll $(_LINK_DBG_FLAGS) /out:$@
	regasm /nologo /silent $*.dll /tlb:$*.tlb
	gacutil /i $*.dll


Loan.dll:	Account.dll
	vbc $(_VBC_DBG_FLAGS) /t:library /r:Account.dll /out:loan.dll loan.vb /nologo
	regasm /nologo /silent $*.dll /tlb:$*.tlb
	gacutil /i $*.dll

RateSvr.dll:		RateSvr\RateLookup.tlb
	regsvr32 /s rateSvr\ratelookup.dll
	tlbimp /nologo RateSvr\RateLookup.dll /silent /keyfile:bank.snk
	gacutil /i $*.dll

Customer.dll:	Customer.cpp
	cl /CLR /GX $(_CPP_DBG_FLAGS) $? -link -dll $(_LINK_DBG_FLAGS) /out:$@
	regasm /nologo /silent $*.dll /tlb:$*.tlb
	gacutil /i $*.dll

run: all
	start bank.vbp

clean:
	@if exist Account.obj  del Account.obj
	@if exist customer.obj del customer.obj
	@if exist Account.dll  del Account.dll
	@if exist Customer.dll del Customer.dll
	@if exist loan.dll     del loan.dll
	@if exist RateSvr.dll  del RateSvr.dll
	@if exist Account.tlb  del Account.tlb
	@if exist Customer.tlb del Customer.tlb
	@if exist Loan.tlb     del Loan.tlb
