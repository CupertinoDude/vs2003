!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = TypedDataClient.exe
SOURCES = TypedData.cs
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/R:System.dll /R:System.Data.dll /R:System.XML.dll /R:$(NETSAMPLEPATH)\QuickStart\howto\samples\adoplus\typeddata\CS\TypedData.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs
	$(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
