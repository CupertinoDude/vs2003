using System;


class App {
   // This method is called when the Button object is clicked
   static Int32 Divide(Int32 numerator, Int32 denominator) {

      Console.WriteLine("Validating the parameters to the Divide method");

      // Validate the method's parameters
      if (denominator == 0) {

         Console.WriteLine("The denominator can't be 0, throwing an exception to indicate error");
         throw new ArgumentOutOfRangeException("denominator", "denominator can't be 0");
      }

      Console.WriteLine("Divide method is running ok");
      return numerator / denominator;
   }


   static void Main() {

      // A try block indicates code requiring common error recovery or common cleanup code
      try {
         Console.WriteLine("---> About to call Divide the 1st time");
         Console.WriteLine("6 / 2 = " + Divide(6, 2));

         Console.WriteLine("\n---> About to call Divide the 2nd time");
         Console.WriteLine("5 / 0 = " + Divide(5, 0));

         Console.WriteLine("This never executes because an exception is thrown earlier");
      }
      catch (ArgumentOutOfRangeException argException) {
         // The catch block runs if an ArgumentOutOfRange excetpion is thrown
         Console.WriteLine("An error occurred while executing code within the try block");
         Console.WriteLine(argException.Message);
         Console.WriteLine("We are gracefully recoverring and continuing to execute");
      }
      finally {
         // The finally block is where you put any and all common cleanup tasks
         Console.WriteLine("Executing common cleanup tasks");

         // This sample doesn't have any common cleanup tasks.
         // However, if you opened or created a file, created a bitmap, established a 
         // network connection, and so on earlier, you should put the corresponding 
         // cleanup code here in the finally block to close the file, dispose the 
         // bitmap, disconnect the connection, etc.
      }
      Console.WriteLine("\n---> The method continues to run...");

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}
