using System;
using System.Threading;


class App {
   public static void Main() {
      Console.WriteLine("Main thread: Queuing an asynchronous operation.");
      AutoResetEvent asyncOpIsDone = new AutoResetEvent(false);
      ThreadPool.QueueUserWorkItem(new WaitCallback(MyAsyncOperation), asyncOpIsDone);

      Console.WriteLine("Main thread: Performing other operations.");
      // ...

      Console.WriteLine("Main thread: Waiting for asynchronous operation to complete.");
      asyncOpIsDone.WaitOne();

      Console.Write("Press Enter to close window...");
      Console.Read();
   }


   // The callback method's signature MUST match that of a System.Threading.WaitCallback 
   // delegate (it takes an Object parameter and returns void)
   static void MyAsyncOperation(Object state) {
      Console.WriteLine("WorkItem thread: Performing asynchronous operation.");
      // ...
      Thread.Sleep(5000);	// Sleep for 5 seconds to simulate doing work

      // Signal that the async operation is now complete.
      ((AutoResetEvent)state).Set();
   }
}