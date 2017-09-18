Imports System
Imports System.Threading

class App 
   Public Shared Sub MyThreadMethod()
      Console.WriteLine("The secondary thread executes in here...")
   End Sub

   Shared Sub Main() 
      ' Create a ThreadStart delegate object identifying the callback method
      Dim ts As New ThreadStart(AddressOf MyThreadMethod)

      ' Create a Thread object and tell it where the thread should
      ' begin its execution.
      Dim t As New Thread(ts)

      ' Start the new thread: It will execute the MyThreadMethod code
      t.Start()

      Console.WriteLine("The primary thread continues to run here...")

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class
