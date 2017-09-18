
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.Http

Imports Zap



Public Class Client
    
    Public Shared Sub Main()
        ' This could also be done with a Remoting configuration file
        ' Register the HTTP Channel
        ChannelServices.RegisterChannel(New HttpChannel())
        
        ' Obtain a Proxy to the SOAP URL
        Dim waz As Waz = CType(Activator.GetObject(GetType(Waz), "http://localhost:999/EventFireHost/Waz.soap"), Waz)
        
        Dim i As Integer
        For i = 0 To 4
            ' Occurs over SOAP to waz)
            waz.HelloMethod(("Bill" & " " & i.ToString()))
        Next i
    End Sub 'Main 
End Class 'Client