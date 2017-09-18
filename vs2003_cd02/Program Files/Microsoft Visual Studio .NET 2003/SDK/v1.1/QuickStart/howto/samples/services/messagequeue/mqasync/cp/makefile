!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = MQAsync.exe
SOURCES = MQAsync.cpp
CLEANUP = *.exe *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi $(SOURCES)

  
clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
