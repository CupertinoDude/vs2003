!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = Serialize.exe
CLEANUP = *.exe *.pdb foo.bin
#--------------------------------------------------
_IMPORTS=

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

clean :
	for %i in ( $(CLEANUP) ) do if exist %i del %i

#--------------------------------------------------
