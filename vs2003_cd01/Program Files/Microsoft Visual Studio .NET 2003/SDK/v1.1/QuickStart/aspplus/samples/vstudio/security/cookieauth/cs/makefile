!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGET  = $(_OUTDIR)\CookieAuth.dll
CLEANUP = $(_OUTDIR)\CookieAuth.dll \
	$(_OUTDIR)\CookieAuth.pdb
SOURCES=Login.aspx.cs Default.aspx.cs

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
	@for %i in ( $(CLEANUP) ) do @if exist %i @del %i
	@if exist obj $(_RMDIR) obj
	@if exist bin $(_RMDIR) bin
#--------------------------------------------------

