
Imports System


Namespace Hello
    
    Public Class HelloService
        Inherits MarshalByRefObject
        
        Public Function ReturnGreeting(name As [String]) As [String]
            Dim message As [String] = "Hi there " + name + ", you are using .NET Remoting"
            Console.WriteLine(message)
            Return message
        End Function 'ReturnGreeting
    End Class 'HelloService
End Namespace 'Hello