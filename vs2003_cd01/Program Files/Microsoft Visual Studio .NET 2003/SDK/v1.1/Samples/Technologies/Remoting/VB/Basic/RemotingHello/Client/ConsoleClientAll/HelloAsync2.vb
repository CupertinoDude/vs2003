
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Messaging
Imports System.Threading
Imports Microsoft.VisualBasic

Imports Hello



Public Class HelloAsync2
    
    Public Shared Sub Main()
        Console.WriteLine(".NET Remoting Sample - HelloAsync2")
        Console.WriteLine("----------------------------------" + ControlChars.Cr)
        
        Dim helloAsync As New HelloAsync2()
        helloAsync.Run()
    End Sub 'Main
    
    
    Public Sub Run()
        Dim name As String = "Bill"
        Dim configFilename As String = "HelloAsync2.exe.config"
        
        Console.WriteLine("Configuring Remoting from {0}", configFilename)
        RemotingConfiguration.Configure(configFilename)
        
        Console.WriteLine("Obtaining Proxy for HelloService, using new")
        Dim helloService As New HelloService()
        
        Console.WriteLine("Creating ReturnGreetingDelegate to HelloService.ReturnGreeting")
        Dim returnGreetingDelegate As New ReturnGreetingDelegate(AddressOf helloService.ReturnGreeting)
        
        Console.WriteLine("Creating AsyncCallback to HelloAsync.greettingCallback")
        Dim asyncCallback As New AsyncCallback(AddressOf Me.greetingCallBack)
        
        Console.WriteLine("Creating ManualResetEvent, will be fired when greetingCallBack is complete")
        Dim evt As New ManualResetEvent(False)
        
        Console.WriteLine("ManualResetEvent is passed in async state object, greetingCallBack will use it")
        Dim stateObject As [Object] = evt
        
        Console.WriteLine("Calling returnGreetingDelegate.BeginInvokeInvoke")
        Dim ar As IAsyncResult = returnGreetingDelegate.BeginInvoke(name, asyncCallback, stateObject)
        
        Console.WriteLine("Waiting for greetingCallback to completed")
        evt.WaitOne()
        Console.WriteLine("Event fired")
    End Sub 'Run
    
    
    Delegate Function ReturnGreetingDelegate(name As String) As String
    
    
    Public Sub greetingCallBack(ar As IAsyncResult)
        Dim returnGreetingDelegate As ReturnGreetingDelegate = CType(CType(ar, AsyncResult).AsyncDelegate, ReturnGreetingDelegate)
        
        Console.WriteLine("Calling returnGreetingDelegate.EndInvoke")
        Dim greeting As String = returnGreetingDelegate.EndInvoke(ar)
        
        Console.WriteLine("returnGreetingDelegate.EndInvoke returned: {0}", greeting)
        
        Console.WriteLine("Fire event that greetingCallBack is complete")
        Dim stateObjectEvt As ManualResetEvent = CType(ar.AsyncState, ManualResetEvent)
        stateObjectEvt.Set()
    End Sub 'greetingCallBack
End Class 'HelloAsync2



