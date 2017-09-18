
Imports System
Imports Microsoft.VisualBasic

Class App
    
    ' This method is called when the Button object is clicked
    Shared Function Divide(numerator As Int32, denominator As Int32) As Int32
        
        Console.WriteLine("Validating the parameters to the Divide method")
        
        ' Validate the method's parameters
        If denominator = 0 Then
            Console.WriteLine("The denominator can't be 0, throwing an exception to indicate error")
            Throw New ArgumentOutOfRangeException("denominator", "denominator can't be 0")
        End If
        
        Console.WriteLine("Divide method is running ok")
        Return CType(numerator / denominator, Int32)
    End Function 'Divide
    
    
    
    Shared Sub Main()
        
        ' A try block indicates code requiring common error recovery or common cleanup code
        Try
            Console.WriteLine("---> About to call Divide the 1st time")
            Console.WriteLine(("6 / 2 = " & Divide(6, 2)))
            
            Console.WriteLine(ControlChars.CrLf & "---> About to call Divide the 2nd time")
            Console.WriteLine(("5 / 0 = " & Divide(5, 0)))
            
            Console.WriteLine("This never executes because an exception is thrown earlier")
        Catch argException As ArgumentOutOfRangeException
          ' The catch block runs if an ArgumentOutOfRange excetpion is thrown
          Console.WriteLine("An error occurred while executing code within the try block")
          Console.WriteLine(argException.Message)
          Console.WriteLine("We are gracefully recoverring and continuing to execute")
        Finally
            ' The finally block is where you put any and all common cleanup tasks
            Console.WriteLine("Executing common cleanup tasks")
        End Try 
        ' This sample doesn't have any common cleanup tasks.
        ' However, if you opened or created a file, created a bitmap, established a 
        ' network connection, and so on earlier, you should put the corresponding 
        ' cleanup code here in the finally block to close the file, dispose the 
        ' bitmap, disconnect the connection, etc.
        Console.WriteLine(ControlChars.CrLf & "---> The method continues to run...")

        Console.Write("Press Enter to close window...")
	Console.Read()
    End Sub 'Main
End Class 'App