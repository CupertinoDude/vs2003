
Imports System
Imports System.Runtime.Remoting
Imports Microsoft.VisualBasic

Imports Hello



Public Class HelloNew2
    
    Public Shared Sub Main()
        Console.WriteLine(".NET Remoting Sample - HelloNew2")
        Console.WriteLine("--------------------------------" + ControlChars.Cr)
        
        Dim name As String = "Bill"
        Dim configFilename As String = "HelloNew2.exe.config"
        
        Console.WriteLine("Configuring Remoting from {0}", configFilename)
        RemotingConfiguration.Configure(configFilename)
        
        Console.WriteLine("Obtaining Proxy for HelloService, using new")
        Dim helloService As New HelloService()
        
        Console.WriteLine("Checking if helloservice is really a proxy")
        If RemotingServices.IsTransparentProxy(helloService) = True Then
            Console.WriteLine("helloService is a proxy!")
        Else
            Throw New Exception("helloService is not a proxy")
        End If 
        Console.WriteLine("Calling HelloService.ReturnGreeting({0})", name)
        Dim greeting As String = helloService.ReturnGreeting(name)
        
        Console.WriteLine("HelloService.ReturnGreeting returned: {0}", greeting)
    End Sub 'Main
End Class 'HelloNew2