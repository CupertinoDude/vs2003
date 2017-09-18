!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#--------------------------------------------------
_NAMESPACE=""
!include $(NETSAMPLEPATH)\QuickStart\master.mak
#--------------------------------------------------
TARGETS = $(_OUTDIR)\DataService.dll
SOURCES = DataService.Asmx.vb DataServiceClient.Aspx.vb "Web References\localhost\DataService.vb"
CLEANUP = $(_OUTDIR)\DataService.dll \
  $(_OUTDIR)\DataService.pdb \
  "Web References\localhost\DataService.vb"
#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.Services.dll /r:System.XML.dll /r:System.Data.dll /r:System.Drawing.dll /r:System.Web.dll
_OUTDIR=.\bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
	for %i in ( $(CLEANUP) ) do if exist %i del %i
	if exist obj $(_RMDIR) obj
	if exist bin $(_RMDIR) bin
#--------------------------------------------------
