
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
        Dim returnGreetingDelegateObj As New ReturnGreetingDelegate(AddressOf helloService.ReturnGreeting)
        
        Console.WriteLine("Calling returnGreetingDelegateObj.BeginInvokeInvoke")
        Dim ar As IAsyncResult = returnGreetingDelegateObj.BeginInvoke(name, Nothing, Nothing)
        
        Console.WriteLine("Calling returnGreetingDelegateObj.EndInvoke")
        Dim greeting As String = returnGreetingDelegateObj.EndInvoke(ar)
        
        Console.WriteLine("returnGreetingDelegateObj.EndInvoke returned: {0}", greeting)
    End Sub 'Run
    
    
    Delegate Function ReturnGreetingDelegate(name As String) As String
End Class 'HelloAsync 
