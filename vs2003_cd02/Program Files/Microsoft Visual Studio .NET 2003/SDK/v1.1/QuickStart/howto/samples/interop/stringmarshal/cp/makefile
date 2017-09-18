!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = StringTest2Lib.dll StringClient.exe
CLEANUP = *.exe *.dll *.pdb *.obj
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  $(_REGSVR) /s /u ../StringTest2.dll	
#--------------------------------------------------

StringClient.exe : StringClient.cpp

StringTest2Lib.dll :
	$(_REGSVR) /s ../StringTest2.dll
	$(_TLBIMP) ../StringTest2.dll /out:$*.dll


