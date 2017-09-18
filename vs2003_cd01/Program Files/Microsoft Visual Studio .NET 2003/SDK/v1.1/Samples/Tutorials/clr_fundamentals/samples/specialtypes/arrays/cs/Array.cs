using System;
using System.Text;

class App {
   static void Main() {
      SingleDimArray();
      Matrix();

      Console.Write("Press Enter to close window...");
      Console.Read();
   }

   static void SingleDimArray() {
      Console.WriteLine("\nSingle Dimension Array Demo");
      // Create an array of Int32 value types
      Int32[] ia = new Int32[5];
      ia[0] = 10;
      ia[1] = 5;
      ia[2] = 100;
      ia[3] = 30;
      ia[4] = 10;

      // Display all the elements in the array
      foreach (Int32 x in ia) 
         Console.WriteLine(x);
      Console.WriteLine();

      // Sort all the items in the array
      Array.Sort(ia);

      // Display all the elements in the array
      foreach (Int32 x in ia) 
         Console.WriteLine(x);
      Console.WriteLine();

      // Get the index of an element in the array
      Console.WriteLine("30 is at index " + Array.IndexOf(ia, 30));
      Console.WriteLine();
   }

   static void Matrix() {
      Console.WriteLine("\nMatrix Demo");

      // Create a matrix of StringBuilder references
      StringBuilder[,] sba = new StringBuilder[2, 3];

      // Initialize the references in the matrix to point to real StringBuilder objects
      for (int x = 0; x <= sba.GetUpperBound(0); x++) {
         for (int y = 0; y <= sba.GetUpperBound(1); y++) {
            sba[x, y] = new StringBuilder(String.Format("({0}, {1})", x, y));
         }
      }

      // Display the Matrix elements
      for (int x = 0; x <= sba.GetUpperBound(0); x++) {
         for (int y = 0; y <= sba.GetUpperBound(1); y++) {
            Console.Write(sba[x, y] + "      ");
         }
         Console.WriteLine();
      }
      Console.WriteLine();
   }
}