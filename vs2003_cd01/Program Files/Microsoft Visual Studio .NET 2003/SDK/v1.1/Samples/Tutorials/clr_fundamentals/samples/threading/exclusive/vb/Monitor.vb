imports System
imports System.IO
imports System.Threading


class App
   Shared Dim sw As New StreamWriter(new FileStream("Test.txt", FileMode.Create))
   const maxThreads As Int32 = 10
   Shared Dim numAsyncOps As Int32 = maxThreads
   Shared Dim asyncOpsAreDone As New AutoResetEvent(false)
   

   Shared Sub Main()
      Dim threadNum As Int32
      for threadNum = 0 To (maxThreads-1)
         ThreadPool.QueueUserWorkItem(new WaitCallback(AddressOf AppendNumbers), threadNum * 100)
      next

      asyncOpsAreDone.WaitOne()
      sw.Close()

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub


   ' The callback method's signature MUST match that of a System.Threading.TimerCallback 
   ' delegate (it takes an Object parameter and returns void)
   Shared Sub AppendNumbers(state As Object)
      Console.WriteLine("Writing to file: Test.txt")

      Dim numStart As Int32 = CType(state, Int32)
      SyncLock (sw) 
         Dim x As Int32
         for x = 0 To (100-1)
            sw.WriteLine(x + numStart)
            Thread.Sleep(0)
         next
      End SyncLock
      if (Interlocked.Decrement(numAsyncOps) = 0)
         asyncOpsAreDone.Set()
      End If
   End Sub
End Class