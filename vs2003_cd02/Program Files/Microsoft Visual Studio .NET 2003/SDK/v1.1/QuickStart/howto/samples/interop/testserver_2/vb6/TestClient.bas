Attribute VB_Name = "TestClient"
Sub Main()
        Dim dotNETServer As TestServer.ITest
        Set dotNETServer = New TestServer.Test
        
        Dim str As Variant
        
        Debug.Print ".NET server returned: "
        For Each str In dotNETServer.GetArray
                Debug.Print str
        Next
End Sub

