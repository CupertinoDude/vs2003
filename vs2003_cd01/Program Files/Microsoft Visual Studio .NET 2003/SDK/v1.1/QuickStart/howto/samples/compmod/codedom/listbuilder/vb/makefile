!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = ListBuilder.exe
CLEANUP = *.exe *.pdb *Collection.vb
#--------------------------------------------------
_IMPORTS=/r:Microsoft.JScript.dll /r:System.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
