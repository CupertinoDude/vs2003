#
# LoanApps makefile
#

all: ConLoan LoanWebService WebLoan WinLoan

ConLoan::
	cd $*
	- nmake all
	cd ..
	
LoanWebService::
	cd $*
	- nmake all
	cd ..	
	
WebLoan::
	cd $*
	- nmake all
	cd ..	
	
WinLoan::
	cd $*
	- nmake all
	cd ..			

clean:
	cd ConLoan
	- nmake clean
	cd ..

	cd LoanWebService
	- nmake clean
	cd ..
	
	cd WebLoan
	- nmake clean
	cd ..
	
	cd WinLoan
	- nmake clean
	cd ..		