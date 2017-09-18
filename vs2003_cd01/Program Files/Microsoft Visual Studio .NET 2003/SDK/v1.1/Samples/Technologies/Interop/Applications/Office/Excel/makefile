#
#  Makefile
#

_XLDIR=.


all: $(_XLDIR)\Excel.DLL CS VB VC

!include Excel.mak

CS::
	cd $*
	- nmake all
	cd ..

VB::
	cd $*
	- nmake all
	cd ..

VC::
	cd $*
	- nmake all
	cd ..

clean: RemoveDLL
	-cd CS
	- nmake clean
	- cd ..

	-cd VB
	- nmake clean
	- cd ..

	-cd VC
	- nmake clean
	- cd ..

