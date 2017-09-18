!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = SN SharedName.dll
CLEANUP = *.snk *.dll *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

SN :
	SN -k Testkey.snk
	
clean :
	for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
