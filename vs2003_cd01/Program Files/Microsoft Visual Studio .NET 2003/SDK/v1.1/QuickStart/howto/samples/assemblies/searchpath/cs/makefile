!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = bin\parser.dll Math.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=/r:bin\parser.dll 

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
bin\parser.dll :
  $(_MAKE_IN_DIR) bin all
 
Math.exe : Math.cs
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  $(_MAKE_IN_DIR) bin clean
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
