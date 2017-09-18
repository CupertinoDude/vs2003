using System;


class Days {

   public const Int32 minutesPerHour = 60;
   public const Int32 hoursPerDay = 24;

   public readonly Int32 minutesPerDays;

   public Days(Int32 days) {
      minutesPerDays = days * minutesPerHour * hoursPerDay;
   }

   static void Main() {
      Console.WriteLine("Hours Per Day={0}, Minutes Per Hour={1}, Minutes Per Day={2}",
         hoursPerDay, minutesPerHour, hoursPerDay * minutesPerHour);

      Days days = new Days(5);

      Console.WriteLine("Number of minutes in 5 days={0}", days.minutesPerDays);

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}
