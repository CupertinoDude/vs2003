!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = adorstodataset.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/R:System.dll /R:System.Data.dll /r:System.Xml.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
