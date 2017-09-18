!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = CalcR.cpp
TARGETS = CalcR.dll gac
CLEANUP = *.dll *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

CalcR.dll : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi /LD $(SOURCES)

gac :
!IFNDEF NOREGISTERQS
	gacutil /i calcr.dll
!ENDIF

clean :
	for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
