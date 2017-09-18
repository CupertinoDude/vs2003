#
# Makefile
#

_DXDIR=.

all: DirectDraw DirectMusic

DirectDraw::
	-@cd $*
	-@nmake -nologo all
	-@cd ..

DirectMusic::
	-@cd $*
	-@nmake -nologo all
	-@cd ..

clean:
	-@cd DirectDraw
	-@nmake -nologo clean
	-@cd ..\DirectMusic
	-@nmake -nologo clean
	-@cd ..

