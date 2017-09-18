﻿
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.Http
Imports Microsoft.VisualBasic

Imports Hello



Public Class HelloNew
    
    Public Shared Sub Main()
        Console.WriteLine(".NET Remoting Sample - HelloNew3")
        Console.WriteLine("--------------------------------" + ControlChars.Cr)
        Dim name As String = "Bill"
        Dim configFilename As String = "HelloNew3.exe.config"
        Dim type As Type = GetType(HelloService)
        Dim url As String = "http://localhost/RemotingHello/HelloService.soap"
        
        Console.WriteLine("Configuring Remoting from {0}", configFilename)
        RemotingConfiguration.Configure(configFilename)
        
        Console.WriteLine("Loading HttpChannel")
        ChannelServices.RegisterChannel(New HttpChannel())
        
        Console.WriteLine("Configuring HelloService as WellKnown Client Type")
        RemotingConfiguration.RegisterWellKnownClientType(type, url)
        
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
End Class 'HelloNew