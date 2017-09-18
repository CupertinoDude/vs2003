!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = outparamswithacommand.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/R:System.dll /R:System.Data.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
