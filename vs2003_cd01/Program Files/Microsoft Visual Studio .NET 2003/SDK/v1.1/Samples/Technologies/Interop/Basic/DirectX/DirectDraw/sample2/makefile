#
# Sample2 makefile
#

_DXDIR=..\..

all: CS VB

CS::
	-@cd $*
	-@nmake -nologo all
	-@cd ..

VB::
	-@cd $*
	-@nmake -nologo all
	-@cd ..


clean:
	-@cd CS
	-@nmake -nologo clean
	-@cd ..\VB
	-@nmake -nologo clean
	-@cd ..
