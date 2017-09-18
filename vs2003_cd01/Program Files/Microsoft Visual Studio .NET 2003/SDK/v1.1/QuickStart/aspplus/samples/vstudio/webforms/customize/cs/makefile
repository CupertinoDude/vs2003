!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET  = $(_OUTDIR)\Customize.dll
CLEANUP = $(_OUTDIR)\Customize.dll \
	$(_OUTDIR)\Customize.pdb
SOURCES=datalist1.aspx.cs datalist2.aspx.cs datalist3.aspx.cs datalist4.aspx.cs datalist5.aspx.cs datalist6.aspx.cs datalist7.aspx.cs datalist8.aspx.cs purchase.aspx.cs style1.aspx.cs style2.aspx.cs style3.aspx.cs style4.aspx.cs style5.aspx.cs style6.aspx.cs style7.aspx.cs style8.aspx.cs style9.aspx.cs

#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Web.dll /r:System.Drawing.dll /r:System.Xml.Dll
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

