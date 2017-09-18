using System;

// If the base class does not implement IDisposable then
// you should implement the IDisposable interface
// if you want to be cleaned up with C#'s "using" statement
class MyType : IDisposable {

   // Called when not explicitly Disposed
   ~MyType() {
      Console.WriteLine("Executing Finalize()");
      Dispose(false);
   }

   // Because this is a method on an interface it is
   // automatically virtual.
   public void Dispose() {
      Console.WriteLine("Executing Dispose()");

      // Essentially, this sets a flag.
      // If set, then GC will not call Finalize (and thus not Dispose(false))
      // If NOT set, then GC will free the state by calling Finalize(false)
      GC.SuppressFinalize(this);

      Dispose(true);
   }

   // 1. If flagged, dispose of managed objects
   // 2. Always cleans up *un*managed objects
   // 3. When necessary, clean up base objects with MyBase.Dispose
   protected void Dispose(bool disposing) {
      Console.WriteLine("Executing Dispose(" + disposing.ToString() + ")");
      if (disposing) { // "true" when we have managed objects to clean up
          // Dispose of our own managed objects
          Console.WriteLine("Dispose: This is where we cleanup managed objects");
      }

      // Dispose of our own *un*managed object
      Console.WriteLine("Dispose: This is where we cleanup *un*managed objects");

      // If you have a base class that defines Dispose(bool), call it
      // base.Dispose(disposing);

   }

   // Typically used for objects that may be re-opened 
   public void Close() {
      Console.WriteLine("Executing Close()");
      this.Dispose();
   }

   public void DoSomething() {
      Console.WriteLine("MyType object is doing something.");
   }
}

class App {
   public static void Main() {
      Console.WriteLine("Executing App.Main()");
      using (MyType mt = new MyType()) {
         mt.DoSomething();
      }

      Console.Write("Press Enter to terminate application...");
      Console.Read();
   }
}