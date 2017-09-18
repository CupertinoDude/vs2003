Imports System

Class Employee
   Private _name As String
   Private _age As Int32

   Public Property Name As String
      Get 
         Name = _name
      End Get
      Set 
         _name = Value
      End Set
   End Property

   Public Property Age As Int32
      Get 
         Age = _age
      End Get
      Set  
         If value < 0 Then _
            Throw New ArgumentOutOfRangeException("Age must be >= 0")
         _age = Value
      End Set
   End Property
End Class


Class App 
   Shared Sub Main()
      Dim employeeVar As New Employee()
      employeeVar.Name = "Fred Flintstone"
      employeeVar.Age = 30
      Try
         employeeVar.Age = -5
      Catch e As Exception
         Console.WriteLine("Failed to set age: " + e.Message + ".")
      End Try

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class
