
Imports System
Imports System.Runtime.Remoting
Imports Microsoft.VisualBasic
Imports Hello



Public Class HelloNew
    
    Public Shared Sub Main()
        Console.WriteLine(".NET Remoting Sample - HelloNew")
        Console.WriteLine("--------------------------------" + ControlChars.Cr)
        
        Dim name As [String] = "Bill"
        Dim configFilename As [String] = "HelloNew.exe.config"
        
        Console.WriteLine("Configuring Remoting from {0}", configFilename)
        RemotingConfiguration.Configure(configFilename)
        
        Console.WriteLine("Obtaining Proxy for HelloService, using new")
        Dim helloService As New HelloService()
        
        Console.WriteLine("Calling HelloService.ReturnGreeting({0})", name)
        Dim greeting As [String] = helloService.ReturnGreeting(name)
        
        Console.WriteLine("HelloService.ReturnGreeting returned: {0}", greeting)
    End Sub 'Main
End Class 'HelloNew