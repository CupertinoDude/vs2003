!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = OwnerDrawListBox.exe
CLEANUP = *.exe *.pdb
#--------------------------------------------------
_IMPORTS=$(_CS_WINFORMS_IMPORTS)
_WIN32RES=/res:colorbars.jpg,colorbars.jpg

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj
#--------------------------------------------------
