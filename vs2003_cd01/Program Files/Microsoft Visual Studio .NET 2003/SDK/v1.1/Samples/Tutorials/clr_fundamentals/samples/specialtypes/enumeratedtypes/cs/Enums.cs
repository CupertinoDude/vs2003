using System;

enum Color {
   Red,
   Green,
   Blue
}


class App {
   static void PaintTheHouse(Color c) {
      if (!Enum.IsDefined(typeof(Color), c))
         throw(new ArgumentOutOfRangeException("color", c, c.ToString() + " is not a valid color value"));
      Console.WriteLine("Painting the house " + c.ToString());
   }


   static void Main() {
      // Create a variable of type Color and initialize it to Green
      Color c = Color.Green;

      // Format() converts the number (1) to the symbol ("Green")
      Console.WriteLine(c.ToString());      // Displays "Green"

      // ToString() converts the number (1) to the string ("1")
      Console.WriteLine(c.ToString("D"));    // Displays 1

      // Returns array of Color enums
      Color[] ca = (Color[]) Enum.GetValues(typeof(Color));
      foreach (Color color in ca) {
         Console.WriteLine("Value: {0}, Symbol: {1}", 
            color.ToString("D"), color.ToString());
      }

      // Since Blue is defined as 2, ‘c’ is initialized to 2.
      c = (Color) Enum.Parse(typeof(Color), "Blue");

      // Since Brown is not defined, an ArgumentException is raised
      try {
         c = (Color) Enum.Parse(typeof(Color), "Brown");
      }
      catch (ArgumentException) {
         Console.WriteLine("Brown is not defined by the Color enumerated type.");
      }

      PaintTheHouse((Color) 2);	 // Blue
      try {
         PaintTheHouse((Color) 20);  // Not a defined color
      }
      catch (ArgumentOutOfRangeException) {
         Console.WriteLine("Can't paint the house using a color with value 20.");
      }

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}