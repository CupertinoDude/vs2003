Imports System
Imports System.Threading


Class App
   Shared Sub Main()
      Console.WriteLine("Main thread: Queuing an asynchronous operation.")
      Dim asyncOpIsDone As New AutoResetEvent(False)
      ThreadPool.QueueUserWorkItem(New WaitCallback(AddressOf MyAsyncOperation), asyncOpIsDone)

      Console.WriteLine("Main thread: Performing other operations.")
      ' ...

      Console.WriteLine("Main thread: Waiting for asynchronous operation to complete.")
      asyncOpIsDone.WaitOne()

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub


   ' The callback method's signature MUST match that of a System.Threading.WaitCallback 
   ' delegate (it takes an Object parameter and returns void)
   Shared Sub MyAsyncOperation(state As Object)
      Console.WriteLine("WorkItem thread: Performing asynchronous operation.")
      ' ...
      Thread.Sleep(5000)	' Sleep for 5 seconds to simulate doing work

      ' Signal that the async operation is now complete.
      CType(state, AutoResetEvent).Set()
   End Sub
End Class