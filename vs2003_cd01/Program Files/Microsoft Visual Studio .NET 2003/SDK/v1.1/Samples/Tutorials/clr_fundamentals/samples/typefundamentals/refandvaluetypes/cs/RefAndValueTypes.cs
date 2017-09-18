using System;

// Reference Type (because of ‘class’)
class  RefType { public int x; }

// Value type (because of ‘struct’)
struct ValType { public int x; }

class App {
   static void Main() {
      RefType rt1 = new RefType();  // Allocated in heap & ctor called
      ValType vt1 = new ValType();  // Allocated on stack & fields set to 0
      rt1.x = 10;	            // Pointer dereference
      vt1.x = 10;                   // Changed on stack

      RefType rt2 = rt1;             // Copies pointer only
      ValType vt2 = vt1;             // Allocate on stack & copies members
      rt1.x = 20;                     // Changes pr1 and pr2
      vt1.x = 20;                     // Changes pv1, not pv2
      Console.WriteLine("rt1.x = {0}, rt2.x = {1}", rt1.x, rt2.x);
      Console.WriteLine("vt1.x = {0}, vt2.x = {1}", vt1.x, vt2.x);

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}
