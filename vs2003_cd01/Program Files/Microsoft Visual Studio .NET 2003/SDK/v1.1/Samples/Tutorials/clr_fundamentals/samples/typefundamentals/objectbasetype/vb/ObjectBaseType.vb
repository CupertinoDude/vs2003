Imports System

Class SimpleType
End Class

Class App
    Public Shared Sub Main()
        Dim st As New SimpleType()
        Console.WriteLine("Equals object: " + st.Equals(New Object()).ToString())
        Console.WriteLine("GetHashCode: " + st.GetHashCode().ToString())
        Console.WriteLine("ToString: " + st.ToString())
        Console.WriteLine("GetType: " + st.GetType().ToString())
        
        Console.WriteLine()
	Console.Write("Press Enter to close window.")
        Console.Read()
    End Sub
End Class