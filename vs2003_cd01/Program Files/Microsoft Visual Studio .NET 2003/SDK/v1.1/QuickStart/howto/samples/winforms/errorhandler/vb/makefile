!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = ErrorHandler.exe
SOURCES = ErrorHandler.vb CustomExceptionHandler.vb
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=$(_VB_WINFORMS_IMPORTS)

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
	$(_BC) $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj
#--------------------------------------------------
