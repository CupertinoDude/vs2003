#
# LoanApps makefile
#

all:
	CreateVRoot.vbs -q
	cd bin
	- nmake all
	cd ..

clean:
	cd bin
	- nmake clean
	cd ..	
	CreateVRoot.vbs -u -q