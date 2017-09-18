#
# Makefile
#

_DXDIR=..
all: DisplayCardInfo Sample1 Sample2

DisplayCardInfo::
	-@cd $*
	-@nmake -nologo all
	-@cd ..

Sample1::
	-@cd $*
	-@nmake -nologo all
	-@cd ..

Sample2::
	-@cd $*
	-@nmake -nologo all
	-@cd ..


clean::
	-@cd DisplayCardInfo
	-@nmake -nologo clean
	-@cd ..\Sample1
	-@nmake -nologo clean
	-@cd ..\Sample2
	-@nmake -nologo clean
	-@cd ..

