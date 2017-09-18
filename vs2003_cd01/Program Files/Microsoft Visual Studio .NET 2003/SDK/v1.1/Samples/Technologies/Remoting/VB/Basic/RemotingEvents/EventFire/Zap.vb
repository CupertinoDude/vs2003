
Imports System
Imports System.Runtime.Remoting
Imports System.Collections


Namespace Zap
    
    ' Define the event arguments
    <Serializable()> Public Class GreetingEventArgs
        Inherits EventArgs
        
        Public Sub New(greeting As String)
            Me.greeting = greeting
        End Sub 'New
        
        Public greeting As String
    End Class 'GreetingEventArgs
    
    
    ' Define the event
    Public Delegate Sub GreetingEvent(sender As Object, e As GreetingEventArgs)
    
    
    ' Define the Service
    Public Class Waz
        Inherits MarshalByRefObject
        ' The client will subscribe and 
        ' unsubscribe to this event
        Public Event Greeting As GreetingEvent
        
        
        ' Method called remotely by client
        Public Sub HelloMethod(greeting As String)
            Console.WriteLine("Received String {0}", greeting)
            
            ' Package String in GreetingEventArgs
            Dim e As New GreetingEventArgs(greeting)
            
            ' Fire Event
            If Not (Greeting Is Nothing) Then
                Console.WriteLine("Firing Event")
                RaiseEvent Greeting(Me, e)
            End If
        End Sub 'HelloMethod
    End Class 'Waz
End Namespace 'Zap