!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = PrintingExample1.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------

_IMPORTS=$(_CS_WINFORMS_IMPORTS)

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)
	
clean :
	for %i in ( $(CLEANUP) ) do del %i
	if exist obj $(_RMDIR) obj

#--------------------------------------------------

