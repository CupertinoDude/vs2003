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
SOURCES=DataGrid1.1.aspx.cs DataGrid1.aspx.cs DataGrid10.aspx.cs DataGrid11.aspx.cs DataGrid12.aspx.cs DataGrid13.aspx.cs DataGrid13_Details.aspx.cs DataGrid14.aspx.cs DataGrid15.aspx.cs DataGrid16.aspx.cs DataGrid17.aspx.cs DataGrid18.aspx.cs DataGrid2.aspx.cs DataGrid3.aspx.cs DataGrid4.aspx.cs DataGrid5.aspx.cs DataGrid6.aspx.cs DataGrid7.aspx.cs DataGrid8.aspx.cs DataGrid9.aspx.cs xmlgen.aspx.cs
#--------------------------------------------------
_IMPORTS=/r:System.Data.dll /r:System.dll /r:System.Web.dll /r:System.Drawing.dll /r:System.Xml.Dll /r:$(_OUTDIR)\QSTools.dll
_OUTDIR=.\bin

#--------------------------------------------------
all : $(TARGET)
    rem Sample $(MAKEDIR)

$(TARGET) : $(SOURCES) $(_OUTDIR)\QSTools.dll
    if not exist $(_OUTDIR) md $(_OUTDIR)
    $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $(SOURCES) $(_WIN32RES) $(_KEYFILE)
    
$(_OUTDIR)\QSTools.dll :
    if not exist $(_OUTDIR) md $(_OUTDIR)
    if exist $(DLLDEP) copy $(DLLDEP) $(_OUTDIR)\QSTools.dll
    if exist $(PDBDEP) copy $(PDBDEP) $(_OUTDIR)\QSTools.pdb

clean :
    for %i in ( $(CLEANUP) ) do if exist %i del %i
    if exist obj $(_RMDIR) obj
    if exist bin $(_RMDIR) bin
#--------------------------------------------------

