!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
DLLDEP = $(NETSAMPLEPATH)\QuickStart\bin\QSTools.dll
PDBDEP = $(NETSAMPLEPATH)\QuickStart\bin\QSTools.pdb

TARGET  = $(_OUTDIR)\Data.dll
CLEANUP = $(_OUTDIR)\Data.dll \
    $(_OUTDIR)\Data.pdb
SOURCES=DataGrid1.1.aspx.vb DataGrid1.aspx.vb DataGrid10.aspx.vb DataGrid11.aspx.vb DataGrid12.aspx.vb DataGrid13.aspx.vb DataGrid13_Details.aspx.vb DataGrid14.aspx.vb DataGrid15.aspx.vb DataGrid16.aspx.vb DataGrid17.aspx.vb DataGrid18.aspx.vb DataGrid2.aspx.vb DataGrid3.aspx.vb DataGrid4.aspx.vb DataGrid5.aspx.vb DataGrid6.aspx.vb DataGrid7.aspx.vb DataGrid8.aspx.vb DataGrid9.aspx.vb xmlgen.aspx.vb
#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Web.dll /r:System.Drawing.dll /r:System.Xml.Dll  /r:$(_OUTDIR)\QSTools.dll
_OUTDIR=.\bin

#--------------------------------------------------
all : $(TARGET)
    rem Sample $(MAKEDIR)

$(TARGET) : $(SOURCES) $(_OUTDIR)\QSTools.dll
    if not exist $(_OUTDIR) md $(_OUTDIR)
    $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(_WIN32RES) $(_KEYFILE)

$(_OUTDIR)\QSTools.dll :
    if not exist $(_OUTDIR) md $(_OUTDIR)
    if exist $(DLLDEP) copy $(DLLDEP) $(_OUTDIR)\QSTools.dll
    if exist $(PDBDEP) copy $(PDBDEP) $(_OUTDIR)\QSTools.pdb

clean :
    for %i in ( $(CLEANUP) ) do if exist %i del %i
    if exist obj $(_RMDIR) obj
    if exist bin $(_RMDIR) bin
#--------------------------------------------------