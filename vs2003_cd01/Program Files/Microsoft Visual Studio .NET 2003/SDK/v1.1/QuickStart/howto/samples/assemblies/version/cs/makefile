!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = CalcRV5 CalcRV6 Parser
TARGET = Math.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/r:calcrv5\calcr.dll /r:parser\parser.dll
SUB_DIRS=CalcRV5 CalcRV6 Parser

#--------------------------------------------------
all : $(TARGET)
  rem Sample $(MAKEDIR)

$(TARGET) :
  for %i in ( $(TARGETS) ) do $(_MAKE_IN_DIR) %i all
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $*.cs $(_WIN32RES) $(_KEYFILE) 

clean :
  for %i in ( $(CLEANUP) ) do del %i
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i clean
#--------------------------------------------------
