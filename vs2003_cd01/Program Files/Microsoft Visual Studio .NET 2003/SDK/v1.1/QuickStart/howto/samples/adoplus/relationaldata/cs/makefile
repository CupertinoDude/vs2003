!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = relationaldata.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/R:System.dll /R:System.Data.dll /R:System.XML.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
