<ComClass([!output CLASS_NAME].ClassId, [!output CLASS_NAME].InterfaceId, [!output CLASS_NAME].EventsId)> _
Public Class [!output CLASS_NAME]

#Region "COM GUIDs"
    ' These  GUIDs provide the COM identity for this class 
    ' and its COM interfaces. If you change them, existing 
    ' clients will no longer be able to access the class.
    Public Const ClassId As String = "[!output GUID_COCLASS]"
    Public Const InterfaceId As String = "[!output GUID_INTERFACE]"
    Public Const EventsId As String = "[!output GUID_EVENTS]"
#End Region

    ' A creatable COM class must have a Public Sub New() 
    ' with no parameters, otherwise, the class will not be 
    ' registered in the COM registry and cannot be created 
    ' via CreateObject.
    Public Sub New()
        MyBase.New()
    End Sub

End Class


