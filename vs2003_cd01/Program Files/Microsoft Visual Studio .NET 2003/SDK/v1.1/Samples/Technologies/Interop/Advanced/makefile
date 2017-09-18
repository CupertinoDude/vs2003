all: comreg Marshaler TlbGen

comreg::
	cd $*
	- nmake all
	cd ..

Marshaler::
	cd $*
	- nmake all
	cd ..

TlbGen::
	cd $*
	- nmake all
	cd ..


clean:
	cd comreg
	- nmake clean
	cd ..

	cd Marshaler
	- nmake clean
	cd ..

	cd TlbGen
	- nmake clean
	cd ..

