!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = bin\parser.dll Math.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
bin\parser.dll :
  $(_MAKE_IN_DIR) bin all
  
clean :
  $(_MAKE_IN_DIR) bin clean
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
