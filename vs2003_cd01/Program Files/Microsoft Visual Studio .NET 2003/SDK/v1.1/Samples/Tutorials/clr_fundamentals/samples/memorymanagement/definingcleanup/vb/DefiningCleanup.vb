Option Explicit On
Option Strict On

Imports System
Imports System.IO


' If the base class does not implement IDisposable then
' you should implement the IDisposable interface
' if you want to be cleaned up with C#'s "using" statement
' Public Dispose must also implement IDisposable.Dispose
Class MyType : Implements IDisposable

   ' Called when not explicitly Disposed
   Protected Overrides Sub Finalize()
      Console.WriteLine("Executing Finalize()")
      Dispose(false)
   End Sub

   ' Called when we want to clean up all objects
   ' Should also implement IDisposable.Dispose
   Public Sub Dispose() Implements IDisposable.Dispose
      Console.WriteLine("Executing Dispose()")
      ' Essentially, this sets a flag.
      ' If set, then GC will not call Finalize (and thus not Dispose(false))
      ' If NOT set, then GC will free the state by calling Finalize(false)
      GC.SuppressFinalize(Me)
      Dispose(true)
   End Sub 'Dispose

   ' 1. If flagged, dispose of managed objects
   ' 2. Always cleans up *un*managed objects
   ' 3. When necessary, clean up base objects with MyBase.Dispose
   Protected Sub Dispose(disposing as Boolean)
      Console.WriteLine("Executing Dispose(" & disposing.ToString() & ")")
      If disposing Then ' "true" when we have managed objects to clean up
          ' Dispose of our own managed objects
           Console.WriteLine("Dispose: This is where we cleanup managed objects")
      End If 

      ' Dispose of our own *un*managed object
      Console.WriteLine("Dispose: This is where we cleanup *un*managed objects")

      ' When appropriate, dispose of base object
      'MyBase.Dispose(disposing)
   End Sub 'Dispose

   ' Typically used for objects that may be re-opened 
   Public Sub Close()
      Console.WriteLine("Executing Close()")
      Me.Dispose()
   End Sub

   Public Sub DoSomething()
      Console.WriteLine("MyType object is doing something...")
   End Sub
End Class


Class App
   Shared Sub Main()
      Console.WriteLine("Executing App.Main()")
      Dim mt As New MyType()
      mt.DoSOmething()

      ' If the following line is not executed, then the
      ' GC will call Finalize() at some point in the future
      mt.Dispose()

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class