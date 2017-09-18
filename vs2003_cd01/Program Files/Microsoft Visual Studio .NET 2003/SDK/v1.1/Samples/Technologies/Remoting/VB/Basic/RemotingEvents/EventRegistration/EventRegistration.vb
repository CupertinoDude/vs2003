
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.Http

Imports Zap
Imports Wak



Public Class Client
    
    Public Shared Sub Main()
        ' This could also be done with a Remoting configuration file
        ' Register the HTTP Channel
        ChannelServices.RegisterChannel(New HttpChannel(0))
        
        Dim baz As Baz = CType(Activator.GetObject(GetType(Baz), "http://localhost:888/EventSinkHost/Baz.soap"), Baz)
        
        ' Obtain a Proxy to the SOAP URL
        Dim waz As Waz = CType(Activator.GetObject(GetType(Waz), "http://localhost:999/EventFireHost/Waz.soap"), Waz)
        
        ' Subscribe to event : occurs over SOAP
        AddHandler waz.Greeting, AddressOf baz.GreetingHandler
        
        waz.HelloMethod("Hi from the client")
        
        ' Unsubscribe to event : occurs over SOAP
        RemoveHandler waz.Greeting, AddressOf baz.GreetingHandler
    End Sub 'Main
End Class 'Client