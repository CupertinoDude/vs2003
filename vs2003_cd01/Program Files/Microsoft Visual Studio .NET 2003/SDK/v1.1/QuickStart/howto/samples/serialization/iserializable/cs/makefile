!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = ISerializable.exe
CLEANUP = *.exe *.pdb *.xml
#--------------------------------------------------
_CS_EXE_FLAGS=$(_CS_EXE_FLAGS) /w:0
_IMPORTS=/r:System.Runtime.Serialization.Formatters.Soap.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
