#
# LoanApps makefile
#

all: COMtoNET NETtoCOM

COMtoNET::
	cd $*
	- nmake all
	cd ..

NETtoCOM::
	cd $*
	- nmake all
	cd ..

clean:
	cd COMtoNET
	- nmake clean
	cd ..

	cd NETtoCOM
	- nmake clean
	cd ..
