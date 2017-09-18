Imports System


Class Days

   Public Const minutesPerHour As Int32 = 60
   Public Const hoursPerDay As Int32 = 24

   Public ReadOnly minutesPerDays As Int32

   Public Sub New(days As Int32)
      minutesPerDays = days * minutesPerHour * hoursPerDay
   End Sub

   Shared Sub Main()
      Console.WriteLine("Hours Per Day={0}, Minutes Per Hour={1}, Minutes Per Day={2}", _
         hoursPerDay, minutesPerHour, hoursPerDay * minutesPerHour)

      Dim days As New Days(5)

      Console.WriteLine("Number of minutes in 5 days={0}", days.minutesPerDays)

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class
