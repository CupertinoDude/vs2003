
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels.Http
Imports Microsoft.VisualBasic

Imports Hello



Public Class HelloNew
    
    Public Shared Sub Main()
        Console.WriteLine(".NET Remoting Sample - HelloGetObj")
        Console.WriteLine("-------------------------------------" + ControlChars.Cr)
        
        Dim name As [String] = "Bill"
        Dim configFilename As [String] = "HelloGetObj.exe.config"
        Dim type As Type = GetType(HelloService)
        Dim url As [String] = "http://localhost:8000/RemotingHello/HelloService.soap"
        
        Console.WriteLine("Configuring Remoting from {0}", configFilename)
        RemotingConfiguration.Configure(configFilename)
        
        Console.WriteLine("Obtaining Proxy for HelloService, using Activator.GetObject")
        Dim helloService As HelloService = CType(Activator.GetObject(type, url), HelloService)
        
        Console.WriteLine("Calling HelloService.ReturnGreeting({0})", name)
        Dim greeting As [String] = helloService.ReturnGreeting(name)
        
        Console.WriteLine("HelloService.ReturnGreeting returned: {0}", greeting)
    End Sub 'Main
End Class 'HelloNew

