using System;

using org;

// This "class" exists only to house the application's entry-point function
class MainApp {
    // Static method called "Main" is application's entry point function
    public static void Main() {

        // Iterate over component's strings and dump them to the console 
		Stringer myStringComp = new Stringer();
		Console.WriteLine("Strings from StringComponent");				
		for (int index = 0; index < myStringComp.Count; index++) {
			Console.WriteLine(myStringComp.GetString(index));				
        }	
		
    }
}
