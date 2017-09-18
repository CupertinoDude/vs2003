!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = StringTest2Lib.dll StringClient.exe
CLEANUP = *.exe *.dll *.pdb
#--------------------------------------------------
_IMPORTS=/r:StringTest2Lib.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------

StringClient.exe : StringClient.vb

StringTest2Lib.dll :
	$(_TLBIMP) ../StringTest2.dll /out:$*.dll

