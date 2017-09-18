!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = OwnerDrawListBox.cpp AssemblyInfo.cpp stdafx.cpp
TARGETS = OwnerDrawListBox.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------


#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CDFLAGS) $(SOURCES)
  $(_LINK) $(_LFLAGS) $(_LIBS) *.obj /assemblyresource:colorbars.jpg /OUT:OwnerDrawListBox.exe
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj
#--------------------------------------------------
