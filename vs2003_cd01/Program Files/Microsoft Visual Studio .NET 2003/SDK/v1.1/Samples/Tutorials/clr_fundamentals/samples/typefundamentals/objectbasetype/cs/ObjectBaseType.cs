using System;

// This type is implicitly derived from System.Object
class SimpleType {
}

class App {
    public static void Main() {
        SimpleType st = new SimpleType();
        Console.WriteLine("Equals object: "  + st.Equals(new Object()));
        Console.WriteLine("GetHashCode: "    + st.GetHashCode());
        Console.WriteLine("ToString: "       + st.ToString());
        Console.WriteLine("GetType: "        + st.GetType());

	Console.WriteLine();
	Console.Write("Press Enter to close window.");
	Console.Read();
    }	
}
