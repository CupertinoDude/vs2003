!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = $(_OUTDIR)\TemplateControlSamplesVB.dll
SOURCES = Template1.vb Repeater1.vb Repeater2.vb RepeaterItem.vb RepeaterItemCollection.vb
CLEANUP = $(_OUTDIR)\TemplateControlSamplesVB.dll \
  $(_OUTDIR)\TemplateControlSamplesVB.pdb
#--------------------------------------------------
_IMPORTS=/r:System.Web.dll /r:System.dll
_OUTDIR=$(NETSAMPLEPATH)\QuickStart\ASPPlus\Bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(_OUTDIR)\TemplateControlSamplesVB.dll : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
