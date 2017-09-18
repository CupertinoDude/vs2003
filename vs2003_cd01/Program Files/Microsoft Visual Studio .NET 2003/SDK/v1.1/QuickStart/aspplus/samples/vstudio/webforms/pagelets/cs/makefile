!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET  = $(_OUTDIR)\Pagelets.dll
CLEANUP = $(_OUTDIR)\Pagelets.dll \
	$(_OUTDIR)\Pagelets.pdb
SOURCES=pagelet1.aspx.cs pagelet1.ascx.cs pagelet2.aspx.cs pagelet2.ascx.cs pagelet3.aspx.cs pagelet3.ascx.cs pagelet4.aspx.cs pagelet4.ascx.cs pagelet5.aspx.cs pagelet5.ascx.cs pagelet6.aspx.cs pagelet6.ascx.cs pagelet7.aspx.cs pagelet7.ascx.cs

#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Web.dll /r:System.Drawing.dll /r:System.Xml.dll
_OUTDIR=.\bin

#--------------------------------------------------
all : $(TARGET)
	rem Sample $(MAKEDIR)

$(TARGET) : $(SOURCES)
	if not exist $(_OUTDIR) md $(_OUTDIR)
	$(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)

clean :
	for %i in ( $(CLEANUP) ) do if exist %i del %i
	if exist obj $(_RMDIR) obj
	if exist bin $(_RMDIR) bin
#--------------------------------------------------

