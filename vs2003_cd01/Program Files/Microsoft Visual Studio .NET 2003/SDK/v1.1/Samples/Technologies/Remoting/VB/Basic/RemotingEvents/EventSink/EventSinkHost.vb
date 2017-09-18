
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.Http

Imports Zap
Imports Wak



Public Class Client
    
    Public Shared Sub Main()
        ' This could also be done with a Remoting configuration file
        ' Registe the HTTP Channel
        ChannelServices.RegisterChannel(New HttpChannel(888))
        
        ' Register the wellknown server type. 
        ' This could also done in the remoting configuration file.
        RemotingConfiguration.RegisterWellKnownServiceType(Type.GetType("Wak.Baz, Wak"), "EventSinkHost/Baz.soap", WellKnownObjectMode.Singleton)
        
        ' We are done, wait until the user wants to exit
        Console.WriteLine("Host is ready to process remote messages.")
        Console.WriteLine("Press ENTER to exit")
        Dim keyState As [String] = Console.ReadLine()
    End Sub 'Main 
End Class 'Client