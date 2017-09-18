!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = DelaySign.cpp
TARGETS = SNgen SNpub DelaySign.dll SNSkip SNSig
CLEANUP = *.snk *.dll *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

SNgen :
	SN -k Testkey.snk
SNpub : Testkey.snk
        SN -p Testkey.snk TestPublicKey.snk

DelaySign.dll: $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi /LD $(SOURCES)

SNSkip: DelaySign.dll
        SN -Vr DelaySign.dll

SNSig: DelaySign.dll TestKey.snk
	SN -R DelaySign.dll TestKey.snk
	
clean :
	for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
