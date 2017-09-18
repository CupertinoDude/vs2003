using System;
using System.IO;

class App {
   public static void Main() {
      String filename = "TemporaryFile.dat";

      Console.WriteLine("Creating File");
      FileStream fs = new FileStream(filename, FileMode.Create);

      Byte[] data = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
      Console.WriteLine("Writing to file");
      fs.Write(data, 0, data.Length);

      Console.WriteLine("Closing file");
      fs.Close();

      Console.WriteLine("Deleting file");
      File.Delete(filename);

      Console.WriteLine();
      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}