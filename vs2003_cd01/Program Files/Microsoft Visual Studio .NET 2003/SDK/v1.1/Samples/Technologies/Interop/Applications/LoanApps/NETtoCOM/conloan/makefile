tlbimp ../LoanLib/LoanLib.dll /out:LoanLib.dll
csc ConLoan.cs /r:LoanLib.dll

TARGETS = LoanLib.dll ConLoan.exe
CLEANUP = *.dll *.exe *.pdb
#--------------------------------------------------
_IMPORTS = /r:LoanLib.dll

#--------------------------------------------------
all : $(TARGETS)

clean :
  @if exist *.dll @del *.dll
  @if exist *.exe @del *.exe
  @if exist *.pdb @del *.pdb
  @if exist *.tlb @del *.tlb

#--------------------------------------------------

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)

#--------------------------------------------------
ConLoan.exe : ConLoan.cs
	csc $(_CS_EXE_FLAGS) $(_IMPORTS) $*.cs

LoanLib.dll :
	tlbimp ../LoanLib/LoanLib.dll /out:$*.dll