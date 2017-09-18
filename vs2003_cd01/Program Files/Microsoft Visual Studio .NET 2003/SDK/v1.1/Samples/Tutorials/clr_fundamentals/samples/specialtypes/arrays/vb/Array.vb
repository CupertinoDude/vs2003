Imports System
Imports System.Text

Class App 
   Shared Sub Main()
      SingleDimArray()
      Matrix()

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub

   Shared Sub SingleDimArray()
      Dim x as Int32
      Dim y as Int32

      Console.WriteLine("Single Dimension Array Demo")
      ' Create an array of Int32 value types
      Dim ia(4) as Int32
      ia(0) = 10
      ia(1) = 5
      ia(2) = 100
      ia(3) = 30
      ia(4) = 10

      ' Display all the elements in the array
      For Each x In ia 
         Console.WriteLine(x)
      Next
      Console.WriteLine()

      ' Sort all the items in the array
      Array.Sort(ia)

      ' Display all the elements in the array
      For Each x In ia 
         Console.WriteLine(x)
      Next
      Console.WriteLine()

      ' Get the index of an element in the array
      Console.WriteLine("30 is at index " & Array.IndexOf(ia, 30))
      Console.WriteLine()
   End Sub

   Shared Sub Matrix() 
      Console.WriteLine("Matrix Demo")

      ' Create a matrix of StringBuilder references
      Dim sba(1,2) As StringBuilder

      ' Initialize the references in the matrix to point to real StringBuilder objects
      Dim x as Integer
      Dim y as Integer
      For x = 0 To sba.GetUpperBound(0)
         For y = 0 To sba.GetUpperBound(1)
            sba(x, y) = New StringBuilder(String.Format("({0}, {1})", x, y))
         Next
      Next

      ' Display the Matrix elements
      For x = 0 To sba.GetUpperBound(0)
         For y = 0 To sba.GetUpperBound(1)
            Console.Write(sba(x, y).ToString() & "      ")
         Next
         Console.WriteLine()
      Next
      Console.WriteLine()
   End Sub
End Class