!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = AL
CLEANUP = *.dll *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

AL :
	AL /link:publisher.cfg /out:policy.1.0.myasm.dll /keyfile:MyAsm.snk /version:2.0.0.0 /title:" " /descr:"A QuickStart Tutorial Assembly" /config:" " /comp:"Microsoft Corporation" /prod:"Microsoft® QuickStart Tutorials" /copy:"© Microsoft Corporation.  All rights reserved." /trade:" " /c:" "
	
clean :
	for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
