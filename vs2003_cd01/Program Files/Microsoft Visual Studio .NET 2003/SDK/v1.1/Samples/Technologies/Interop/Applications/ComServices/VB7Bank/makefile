!include ..\common.mak

_OUTDIR=..\$(_OUTDIR)
_COMMON=..\$(_COMMON)


_IMPORTS=$(_IMPORTS) /r:$(_OUTDIR)\ADODB.dll /r:$(_OUTDIR)\AccountComLib.dll /r:$(_OUTDIR)\CSharpBank.dll /r:System.EnterpriseServices.dll

all: $(_OUTDIR)\VB7Bank.DLL VB7Bank.reg

$(_OUTDIR)\VB7Bank.DLL: account.vb movemoney.vb getreceipt.vb updatereceipt.vb createtable.vb
	vbc.exe /t:library /out:$@ $** $(_IMPORTS)

VB7Bank.reg:
	gacutil /i $(_OUTDIR)\VB7Bank.DLL
	regsvcs /nologo /fc $(_OUTDIR)\VB7Bank.dll