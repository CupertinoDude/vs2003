!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET  = $(_OUTDIR)\Customize.dll
CLEANUP = $(_OUTDIR)\Customize.dll \
	$(_OUTDIR)\Customize.pdb
SOURCES=datalist1.aspx.vb datalist2.aspx.vb datalist3.aspx.vb datalist4.aspx.vb datalist5.aspx.vb datalist6.aspx.vb datalist7.aspx.vb datalist8.aspx.vb purchase.aspx.vb style1.aspx.vb style2.aspx.vb style3.aspx.vb style4.aspx.vb style5.aspx.vb style6.aspx.vb style7.aspx.vb style8.aspx.vb style9.aspx.vb
#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Web.dll /r:System.Drawing.dll /r:System.Xml.Dll
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