!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = CustomReader.exe
CLEANUP = *.exe *.pdb *.obj
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
