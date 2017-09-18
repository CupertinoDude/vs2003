!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = ExplorerLib.dll TestClient.exe
CLEANUP = *.exe *.dll *.pdb
#--------------------------------------------------
_IMPORTS=/r:ExplorerLib.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------

TestClient.exe : TestClient.cs

ExplorerLib.dll :
	$(_TLBIMP) SHDocVw.dll /out:$*.dll


