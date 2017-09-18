!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
SOURCES = TestServer.cpp
TARGETS = TestServer.tlb GAC
CLEANUP = *.dll *.tlb *.pdb *.obj
#--------------------------------------------------
_IMPORTS=

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

clean :
!IFNDEF NOREGISTERQS
  $(_GACUTIL) -u TestServer.dll
  $(_REGASM) /unregister TestServer.dll
!ENDIF
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------

TestServer.dll : TestServer.cpp
  $(_CL) $(_CCFLAGS) /Zi /LD $(SOURCES)

TestServer.tlb : TestServer.dll
!IFNDEF NOREGISTERQS
	$(_REGASM) /tlb $*.dll
!ENDIF

#install assembly in GAC
GAC::
!IFNDEF NOREGISTERQS
	$(_GACUTIL) -i TestServer.dll
!ENDIF



