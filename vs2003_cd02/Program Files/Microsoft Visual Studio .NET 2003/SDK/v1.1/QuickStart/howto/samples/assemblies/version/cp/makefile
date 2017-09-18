!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = math.cpp
TARGETS = CalcRV5 CalcRV6 Parser
TARGET = Math.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
SUB_DIRS=CalcRV5 CalcRV6 Parser

#--------------------------------------------------
all : $(TARGET)
  rem Sample $(MAKEDIR)

$(TARGET) :
  for %i in ( $(TARGETS) ) do $(_MAKE_IN_DIR) %i all
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi $(SOURCES)


clean :
  for %i in ( $(CLEANUP) ) do del %i
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i clean
#--------------------------------------------------
