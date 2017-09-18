!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = Clientget.exe Clientgetasync.exe Clientgetwithntlm.exe Clientgetwithproxy.exe Clientgetwithssl.exe Clientpost.exe Clientwebexception.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.dll

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
