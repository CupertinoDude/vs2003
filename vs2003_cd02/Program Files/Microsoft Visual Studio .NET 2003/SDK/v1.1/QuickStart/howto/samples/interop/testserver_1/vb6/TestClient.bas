Attribute VB_Name = "TestClient"
Sub Main()
    Dim dotNETServer As TestServer.ITest
    Set dotNETServer = New TestServer.Test

    Debug.Print ".NET server returned: " + FormatDateTime(dotNETServer.GetTime, vbGeneralDate)
End Sub

