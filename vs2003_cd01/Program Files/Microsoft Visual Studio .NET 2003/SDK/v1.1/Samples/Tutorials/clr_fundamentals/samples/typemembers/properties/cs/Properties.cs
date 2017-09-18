using System;

class Employee {
   private String _name;
   private Int32 _age;

   public String Name {
      get { return _name; }
      set { _name = value; }
   }

   public Int32 Age {
      get { return _age; }
      set { 
         if (value < 0) 
            throw new ArgumentOutOfRangeException("Age must be >= 0");
         _age = value;
      }
   }
}


class App {
   static void Main() {
      Employee employee = new Employee();
      employee.Name = "Fred Flintstone";
      employee.Age = 30;
      try {
         employee.Age = -5;
      }
      catch (Exception e) {
         Console.WriteLine("Failed to set age: " + e.Message + ".");
      }

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}
