!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#--------------------------------------------------
_NAMESPACE=""
!include $(NETSAMPLEPATH)\QuickStart\master.mak
#--------------------------------------------------
TARGETS = $(_OUTDIR)\Intrinsics.dll
SOURCES = SessionService1Client.aspx.vb SessionService1.asmx.vb "Web References\localhost\SessionService1.vb"
CLEANUP = $(_OUTDIR)\Intrinsics.dll \
  $(_OUTDIR)\Intrinsics.pdb

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
