
TARGETS = LoanLib.dll WinLoan.exe
#--------------------------------------------------
_IMPORTS = /r:LoanLib.dll /r:System.Windows.Forms.DLL /r:System.Data.DLL /r:System.DLL /r:System.Drawing.DLL

#--------------------------------------------------
all : $(TARGETS)

clean :
  @if exist *.dll del *.dll
  @if exist *.exe del *.exe
  @if exist *.dll del *.pdb

#--------------------------------------------------

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)

#--------------------------------------------------

WinLoan.exe : Form1.cs
	csc $(_CS_EXE_FLAGS) /out:WinLoan.exe /t:winexe $(_IMPORTS) Form1.cs

LoanLib.dll :
	tlbimp ../LoanLib/LoanLib.dll /out:$*.dll

