!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = CalcR.dll gac
SOURCES = calcr.cs
CLEANUP = *.dll *.pdb
#--------------------------------------------------

#--------------------------------------------------
all : $(TARGETS)
	rem Sample $(MAKEDIR)

gac :
!IFNDEF NOREGISTERQS
	gacutil /i calcr.dll
!ENDIF

CalcR.dll : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
	for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
