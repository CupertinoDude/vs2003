!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
TARGETS = Installers.exe
SOURCES = Installers.cpp ProjectInstaller.cpp
CLEANUP = *.exe *.pdb *.obj
_LFLAGS = $(_LFLAGS) -fixed:no -entry:main
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CDFLAGS) $(SOURCES)
  $(_LINK) $(_LFLAGS) $(_LIBS) *.obj /OUT:Installers.exe

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
