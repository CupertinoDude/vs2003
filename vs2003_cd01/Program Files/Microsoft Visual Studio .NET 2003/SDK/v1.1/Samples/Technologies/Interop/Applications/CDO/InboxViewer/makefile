#
# Makefile 
#

!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS) /t:winexe
_IMPORTS=/r:System.Windows.Forms.DLL /r:System.Drawing.dll /r:System.dll


all: InboxViewer.exe

clean:
    -@erase InboxViewer.exe
    -@erase InboxViewer.pdb

InboxViewer.exe: *.cs
    csc $(_CS_EXE_FLAGS) /out:$@ $(_IMPORTS) InboxViewerForm.cs MessageForm.cs CDO.cs 
