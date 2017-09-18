using System;
using System.Threading;

class App {
   public static void MyThreadMethod() {
      Console.WriteLine("The secondary thread executes in here...");
   }

   static void Main() {
      // Create a ThreadStart delegate object identifying the callback method
      ThreadStart ts = new ThreadStart(MyThreadMethod);

      // Create a Thread object and tell it where the thread should
      // begin its execution.
      Thread t = new Thread(ts);

      // Start the new thread: It will execute the MyThreadMethod code
      t.Start();

      Console.WriteLine("The primary thread continues to run here...");

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}
