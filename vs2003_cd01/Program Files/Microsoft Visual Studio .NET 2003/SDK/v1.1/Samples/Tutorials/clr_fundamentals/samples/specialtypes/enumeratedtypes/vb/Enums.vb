Imports System

Enum Color
   Red
   Green
   Blue
End Enum


Class App
   Shared Sub PaintTheHouse(c As Color)
      If Not System.Enum.IsDefined(Type.GetType("Color"), c)
         Throw(New ArgumentOutOfRangeException("color", c, c.ToString() + " is not a valid color value"))
      End If
      Console.WriteLine("Painting the house " + c.ToString())
   End Sub


   Shared Sub Main()
      ' Create a variable of type Color and initialize it to Green
      Dim c As Color = Color.Green

      ' Format() converts the number (1) to the symbol ("Green")
      Console.WriteLine(c.ToString())      ' Displays "Green"

      ' ToString() converts the number (1) to the string ("1")
      Console.WriteLine(c.ToString("D"))    ' Displays 1

      ' Returns array of Color enums
      Dim ca() As Color = CType(System.Enum.GetValues(Type.GetType("Color")), Color())
      Dim colorVar as Color
      For Each colorVar In ca 
         Console.WriteLine("Value: {0}, Symbol: {1}", colorVar.ToString("D"), colorVar.ToString())
      Next

      ' Since Blue is defined as 2, ‘c’ is initialized to 2.
      c = CType(System.Enum.Parse(Type.GetType("Color"), "Blue"), Color)

      ' Since Brown is not defined, an ArgumentException is raised
      Try 
         c = CType(System.Enum.Parse(Type.GetType("Color"), "Brown"), Color)
      Catch argException As ArgumentException
         Console.WriteLine("Brown is not defined by the Color enumerated type.")
      End Try

      PaintTheHouse(CType(2, Color))	 ' Blue
      Try 
         PaintTheHouse(CType(20, Color))  ' Not a defined color
      Catch aoorException As ArgumentOutOfRangeException
         Console.WriteLine("Can't paint the house using a color with value 20.")
      End Try

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class