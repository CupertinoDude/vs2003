!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = TestServer.tlb GAC
CLEANUP = *.dll *.tlb *.pdb
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

TestServer.dll : TestServer.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(_WIN32RES) $(_KEYFILE)

TestServer.tlb : TestServer.dll
!IFNDEF NOREGISTERQS
	$(_REGASM) /tlb $*.dll
!ENDIF

#install assembly in GAC
GAC::
!IFNDEF NOREGISTERQS
	$(_GACUTIL) -i TestServer.dll
!ENDIF


