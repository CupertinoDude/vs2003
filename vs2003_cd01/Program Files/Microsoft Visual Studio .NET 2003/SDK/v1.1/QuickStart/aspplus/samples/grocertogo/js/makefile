!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = Market.dll
CLEANUP = $(_OUTDIR)\Market.dll $(_OUTDIR)\Market.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.Data.dll /r:System.dll /r:System.Xml.dll
_OUTDIR=Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
