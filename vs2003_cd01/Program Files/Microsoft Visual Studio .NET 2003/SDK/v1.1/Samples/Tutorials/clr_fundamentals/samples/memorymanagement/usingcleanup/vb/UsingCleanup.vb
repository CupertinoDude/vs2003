imports System
imports System.IO

class App 
   Shared Sub Main()
      Dim filename As String = "TemporaryFile.dat"

      Console.WriteLine("Creating File")
      Dim fs As New FileStream(filename, FileMode.Create)

      Dim data() As Byte = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
      Console.WriteLine("Writing to file")
      fs.Write(data, 0, data.Length)

      Console.WriteLine("Closing file")
      fs.Close()

      Console.WriteLine("Deleting file")
      File.Delete(filename)

      Console.WriteLine()
      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class