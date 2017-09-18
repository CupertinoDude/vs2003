using System;
using System.Threading;


class App {
   public static void Main() {
      Console.WriteLine("Checking for status updates every 2 seconds.");
      Console.WriteLine("   (Hit Enter to terminate the sample)");
      Timer timer = new Timer(new TimerCallback(CheckStatus), null, 0, 2000);

      Console.Write("Press Enter to close window...");
      Console.Read();
   }


   // The callback method's signature MUST match that of a System.Threading.TimerCallback 
   // delegate (it takes an Object parameter and returns void)
   static void CheckStatus(Object state) {
      Console.WriteLine("Checking Status.");
      // ...
   }
}