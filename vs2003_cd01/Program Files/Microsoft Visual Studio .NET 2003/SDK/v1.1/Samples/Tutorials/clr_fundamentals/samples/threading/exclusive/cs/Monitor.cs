using System;
using System.IO;
using System.Threading;


class App {
   static StreamWriter sw = new StreamWriter(new FileStream("Test.txt", FileMode.Create));
   const Int32 maxThreads = 10;
   static Int32 numAsyncOps = maxThreads;
   static AutoResetEvent asyncOpsAreDone = new AutoResetEvent(false);
   

   public static void Main() {
      for (Int32 threadNum = 0; threadNum < maxThreads; threadNum++) {
         ThreadPool.QueueUserWorkItem(new WaitCallback(AppendNumbers), threadNum * 100);
      }

      asyncOpsAreDone.WaitOne();
      sw.Close();

      Console.Write("Press Enter to close window...");
      Console.Read();
   }


   // The callback method's signature MUST match that of a System.Threading.TimerCallback 
   // delegate (it takes an Object parameter and returns void)
   static void AppendNumbers(Object state) {
      Console.WriteLine("Writing to file:  Test.txt");

      Int32 numStart = (Int32) state;
      lock (sw) {
         for (Int32 x = 0; x < 100; x++) {
            sw.WriteLine(x + numStart);
            Thread.Sleep(0);
         }
      }
      if (Interlocked.Decrement(ref numAsyncOps) == 0)
         asyncOpsAreDone.Set();
   }
}