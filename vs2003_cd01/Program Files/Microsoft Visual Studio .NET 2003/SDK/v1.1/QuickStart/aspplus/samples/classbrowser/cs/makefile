!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = ClassInfo.dll
CLEANUP = $(_OUTDIR)\ClassInfo.dll $(_OUTDIR)\ClassInfo.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.Data.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------