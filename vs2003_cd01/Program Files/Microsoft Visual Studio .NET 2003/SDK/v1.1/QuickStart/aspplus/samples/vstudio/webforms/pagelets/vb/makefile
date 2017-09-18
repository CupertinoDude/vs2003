!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET  = $(_OUTDIR)\Pagelets.dll
CLEANUP = $(_OUTDIR)\Pagelets.dll \
	$(_OUTDIR)\Pagelets.pdb
SOURCES =pagelet1.aspx.vb pagelet1.ascx.vb pagelet2.aspx.vb pagelet2.ascx.vb pagelet3.aspx.vb pagelet3.ascx.vb pagelet4.aspx.vb pagelet4.ascx.vb pagelet5.aspx.vb pagelet5.ascx.vb pagelet6.aspx.vb pagelet6.ascx.vb pagelet7.aspx.vb pagelet7.ascx.vb
#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Web.dll /r:System.Drawing.dll /r:System.Xml.dll
_OUTDIR=.\bin

#--------------------------------------------------
all : $(TARGET)
	rem Sample $(MAKEDIR)

$(TARGET) : $(SOURCES)
	if not exist $(_OUTDIR) md $(_OUTDIR)
	$(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
	for %i in ( $(CLEANUP) ) do if exist %i del %i
	if exist obj $(_RMDIR) obj
	if exist bin $(_RMDIR) bin
#--------------------------------------------------