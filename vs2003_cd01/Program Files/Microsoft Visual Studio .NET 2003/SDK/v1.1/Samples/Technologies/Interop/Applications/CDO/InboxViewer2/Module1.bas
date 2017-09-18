Attribute VB_Name = "Module1"
Option Explicit

Public CDO As New CDODataProvider.CDODataProvider
Public currentSession As Object

Sub Main()

    On Error GoTo ErrCatch

    ' Create a new Session
    Set currentSession = CDO.CreateNewSession()
    If (currentSession Is Nothing) Then End
    
    InboxViewerForm.Show
    InboxViewerForm.Fill
    Exit Sub
    
ErrCatch:

    ' Check for MAPI_E_USER_CANCEL:
    If Err.Number <> -2147221229 Then
        MsgBox "Unexpected Error: " & Err.Description
    End If
    
End Sub
