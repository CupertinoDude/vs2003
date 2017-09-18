!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = SharedName.cpp
TARGETS = SN SharedName.dll
CLEANUP = *.snk *.dll *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

SN :
	SN -k Testkey.snk

sharedName.dll : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi /LD $(SOURCES)
	
clean :
	for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
