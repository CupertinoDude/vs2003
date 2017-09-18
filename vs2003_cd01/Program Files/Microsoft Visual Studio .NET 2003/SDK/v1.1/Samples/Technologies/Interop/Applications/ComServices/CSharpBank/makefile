!include ..\common.mak

_OUTDIR=..\$(_OUTDIR)
_COMMON=..\$(_COMMON)

all: $(_OUTDIR)\CSharpBank.DLL CSharpBank.reg

_IMPORTS=$(_IMPORTS) /r:$(_OUTDIR)\ADODB.dll /r:$(_OUTDIR)\AccountComLib.dll /r:System.EnterpriseServices.dll

$(_OUTDIR)\CSharpBank.DLL: Account.cs CSharpBank.cs MoveMoney.cs GetReceipt.cs UpdateReceipt.cs CreateTable.cs
	csc.exe /t:library /out:$@ $** $(_IMPORTS)

CSharpBank.reg:
	gacutil /i $(_OUTDIR)\CSharpBank.DLL
	regsvcs /fc /nologo $(_OUTDIR)\CSharpBank.dll 
