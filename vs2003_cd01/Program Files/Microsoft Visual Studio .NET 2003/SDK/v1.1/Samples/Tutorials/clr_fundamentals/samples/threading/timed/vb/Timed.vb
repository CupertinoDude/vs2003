Imports System
Imports System.Threading


Class App
   Shared Sub Main()
      Console.WriteLine("Checking for status updates every 2 seconds.")
      Console.WriteLine("   (Hit Enter to terminate the sample)")
      Dim timer As New Timer(new TimerCallback(AddressOf CheckStatus), nothing, 0, 2000)

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub


   ' The callback method's signature MUST match that of a System.Threading.TimerCallback 
   ' delegate (it takes an Object parameter and returns void)
   Shared Sub CheckStatus(state As Object)
      Console.WriteLine("Checking Status.")
      ' ...
   End Sub
End Class