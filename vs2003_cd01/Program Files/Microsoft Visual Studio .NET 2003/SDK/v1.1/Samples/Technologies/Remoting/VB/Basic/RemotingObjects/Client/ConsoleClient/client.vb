
Imports System
Imports System.IO
Imports System.Text
Imports System.Runtime.Remoting
Imports System.Security.Policy
Imports System.Threading
Imports Microsoft.VisualBasic

Imports CAOLibrary



Public Class Client
    
    Public Shared Function Main() As Integer
        Dim result As Boolean = True
        Dim totalNumber As Integer = 0
        
        ' Load the Http Channel from the config file
        RemotingConfiguration.Configure("Client.exe.config")
        
        Dim counterPiet As New Counter("Piet")
        
        ' Retrieve the name from the activated object
        Console.WriteLine(("Count.name: " + counterPiet.name))
        
        ' Perform a series of calls on the object
        Dim i As Integer
        For i = 0 To 2
            Console.WriteLine("counterPiet.DoWorkWithNumber (100)")
            result = counterPiet.DoWorkWithNumber(100)
            totalNumber = counterPiet.TotalNumber
            Console.WriteLine("After DoWorkWithNumber Total Number is {0}" + ControlChars.Cr, totalNumber)
        Next i
        
        Dim counterJohn As New Counter("John")
        
        ' Retrieve the name from the activated object
        Console.WriteLine(("Counter.name: " + counterJohn.name))
        
        ' Perform a series of calls on the object
        For i = 0 To 2
            Console.WriteLine("counterJohn.DoWorkWithNumber (50)")
            result = counterJohn.DoWorkWithNumber(50)
            totalNumber = counterJohn.TotalNumber
            Console.WriteLine("After DoWorkWithNumber Total Number is {0}" + ControlChars.Cr, totalNumber)
        Next i
        
        Dim counterBill As New Counter("Bill")
        
        ' Retrieve the name from the activated object
        Console.WriteLine(("Counter.name: " + counterBill.name))
        
        counterBill.TotalNumber = 1000
        
        Dim numbers As Integer() =  {50, 25, 100}
        
        Console.WriteLine("counterBill.DoWorkWithNumbers ({0})", numbers)
        result = counterBill.DoWorkWithNumbers(numbers)
        totalNumber = counterBill.TotalNumber
        Console.WriteLine("After DoWorkWithNumbers Total Number is {0}" + ControlChars.Cr, totalNumber)
        
        Dim strNumbers As [String]() =  {"15", "45", "5"}
        
        Console.WriteLine("counterBill.DoWorkWithNumbers ({0})", strNumbers)
        result = counterBill.DoWorkWithNumbers(strNumbers)
        totalNumber = counterBill.TotalNumber
        Console.WriteLine("After DoWorkWithNumbers Total Number is {0}" + ControlChars.Cr, totalNumber)
        
        Return 0
    End Function 'Main
End Class 'Client
