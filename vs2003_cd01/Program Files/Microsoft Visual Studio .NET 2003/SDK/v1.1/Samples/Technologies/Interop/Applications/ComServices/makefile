# Edit this to identify the installed location of msado15.dll
_ADO_DIR=%ProgramFiles%\Common Files\System\ado
#

_OUTDIR=.\Output
_COMMON=.\Common
_VB6=VB6

all: reg ADODB.dll Account.dll CSharpBank.dll VB7Bank.dll VC7Bank.dll

clean:
	- @del $(_OUTDIR)\*.dll
	- @cd VC7Bank
	- @nmake /nologo clean
	- @cd ..

reg: VB6BANK\vbacct.dll
	regsvr32 /s $(_COMMON)\AccountCom.dll
	cd BankAdmin
	cscript installSamplebank.Vbs //NoLogo
	cd ..


ADODB.dll:
	if not exist $(_OUTDIR) md $(_OUTDIR)
	tlbimp /silent /nologo "$(_ADO_DIR)\msado15.dll" /keyfile:$(_COMMON)\testkey.snk /out:$(_OUTDIR)\ADODB.dll
	gacutil    /i $(_OUTDIR)\adodb.dll

Account.dll:
	if not exist $(_OUTDIR) md $(_OUTDIR)
	regsvr32 /s $(_COMMON)\AccountCom.dll
	tlbimp /nologo $(_COMMON)\AccountCom.dll /keyfile:$(_COMMON)\testkey.snk /out:$(_OUTDIR)\AccountComLib.dll
	gacutil    /i $(_OUTDIR)\AccountComLib.dll

CSharpBank.dll VB7Bank.dll VC7Bank.dll:
	cd $*
	- nmake /nologo all
	cd ..


run:
	cd VB6BankClient
	start vbbank.Vbp
	cd ..

