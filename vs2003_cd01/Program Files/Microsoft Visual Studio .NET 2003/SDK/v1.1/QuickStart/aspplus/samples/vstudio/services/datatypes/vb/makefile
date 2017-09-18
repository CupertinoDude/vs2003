!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#--------------------------------------------------
_NAMESPACE=""
!include $(NETSAMPLEPATH)\QuickStart\master.mak
#--------------------------------------------------
TARGETS = $(_OUTDIR)\DataTypes.dll
SOURCES = DataTypesClient.aspx.vb DataTypes.asmx.vb "Web References\localhost\DataTypes.vb"
CLEANUP = $(_OUTDIR)\DataTypes.dll \
  $(_OUTDIR)\DataTypes.pdb

#--------------------------------------------------
_IMPORTS=/r:System.dll /r:System.Web.Services.dll /r:System.XML.dll /r:System.Web.Dll /r:System.Drawing.Dll
_OUTDIR=.\bin

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)

$(TARGETS) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
  if exist bin $(_RMDIR) bin
  if exist obj $(_RMDIR) obj

#--------------------------------------------------
