!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = Formatters.exe
SOURCES = Formatters.cpp Order.cpp
CLEANUP = *.exe *.pdb *.obj
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
