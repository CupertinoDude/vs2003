
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Messaging
Imports System.Threading
Imports Microsoft.VisualBasic

Imports Hello



Public Class HelloAsync
    
    Public Shared Sub Main()
        Console.WriteLine(".NET Remoting Sample - HelloAsync")
        Console.WriteLine("---------------------------------" + ControlChars.Cr)
        
        Dim helloAsync As New HelloAsync()
        helloAsync.Run()
    End Sub 'Main
    
    
    Public Sub Run()
        Dim name As String = "Bill"
        Dim configFilename As String = "HelloAsync.exe.config"
        
        Console.WriteLine("Configuring Remoting from {0}", configFilename)
        RemotingConfiguration.Configure(configFilename)
        
        Console.WriteLine("Obtaining Proxy for HelloService, using new")
        Dim helloService As New HelloService()
        
        Console.WriteLine("Creating ReturnGreetingDelegate to HelloService.ReturnGreeting")
        Dim returnGreetingDelegate As New ReturnGreetingDelegate(AddressOf helloService.ReturnGreeting)
        
        Console.WriteLine("Calling returnGreetingDelegate.BeginInvokeInvoke")
        Dim ar As IAsyncResult = returnGreetingDelegate.BeginInvoke(name, Nothing, Nothing)
        
        Console.WriteLine("Calling returnGreetingDelegate.EndInvoke")
        Dim greeting As String = returnGreetingDelegate.EndInvoke(ar)
        
        Console.WriteLine("returnGreetingDelegate.EndInvoke returned: {0}", greeting)
    End Sub 'Run
    
    
    Delegate Function ReturnGreetingDelegate(name As String) As String
End Class 'HelloAsync 
