!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = ThreadMarshal.cpp AssemblyInfo.cpp stdafx.cpp
TARGETS = ThreadMarshal.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CDFLAGS) $(SOURCES)
  $(_LINK) $(_LFLAGS) $(_LIBS) *.obj /OUT:ThreadMarshal.exe
	  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj
#--------------------------------------------------
