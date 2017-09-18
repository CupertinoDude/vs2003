!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = Parser.cpp
TARGETS = Parser.dll
CLEANUP = *.dll *.pdb
#--------------------------------------------------
_IMPORTS=

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi /LD $(SOURCES)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
