
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Messaging
Imports Microsoft.VisualBasic
Imports Zap


Namespace Wak
    
    ' Marshal by Ref Object onto which the event will be fired
    Public Class Baz
        Inherits MarshalByRefObject
        
        <OneWay()> Public Sub GreetingHandler(sender As Object, e As GreetingEventArgs)
            Console.WriteLine("GreetingHandler callback : Greeting : {0}" + ControlChars.Cr, e.greeting)
        End Sub 'GreetingHandler
    End Class 'Baz
End Namespace 'Wak