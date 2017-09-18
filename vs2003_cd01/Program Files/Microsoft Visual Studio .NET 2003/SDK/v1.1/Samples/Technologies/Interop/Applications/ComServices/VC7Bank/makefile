!include ..\common.mak

_CURDIR=..\VC7Bank
_OUTDIR=..\$(_OUTDIR)
_COMMON=..\$(_COMMON)

_LIBS=

all: $(_OUTDIR)\VC7Bank.DLL VC7Bank.reg

Init:
	cd $(_OUTDIR)

clean:
	- @cd $(_CURDIR)
	- @del *.obj
	- @del *.dll
	- @del *.pdb


_CFLAGS=/CLR /GX /I$(_OUTDIR)
_LDFLAGS=-dll

$(_OUTDIR)\VC7Bank.DLL:	Account.cpp CreateTable.cpp GetReceipt.cpp MoveMoney.cpp UpdateReceipt.cpp
	cl $(_CFLAGS) /AI $(_OUTDIR) $? -link $(_LDFLAGS) /out:$@


VC7Bank.reg:
	gacutil     /i $(_OUTDIR)\VC7Bank.DLL
	regsvcs /nologo /fc $(_OUTDIR)\VC7Bank.dll
