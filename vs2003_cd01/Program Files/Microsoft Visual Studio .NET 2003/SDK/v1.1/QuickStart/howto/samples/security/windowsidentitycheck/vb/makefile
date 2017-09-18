!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = IdentityCheck.exe
CLEANUP = *.exe *.pdb

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)
	
clean :
	for %i in ( $(CLEANUP) ) do del %i

#--------------------------------------------------
