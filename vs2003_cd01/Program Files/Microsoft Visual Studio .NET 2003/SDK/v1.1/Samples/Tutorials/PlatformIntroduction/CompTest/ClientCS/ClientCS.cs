using System;

using CompVC;
using CompCS;
using CompVB;

// This "class" exists only to house the application's entry-point function
class MainApp {
    // Static method called "Main" is application's entry point function
    public static void Main() {

        // Iterate over component's strings and dump them to the console 
		CompCS.StringComponent myCSStringComp = new CompCS.StringComponent();
		Console.WriteLine("Strings from C# StringComponent");				
		for (int index = 0; index < myCSStringComp.Count; index++) {
			Console.WriteLine(myCSStringComp.GetString(index));				
        }	
		
        // Iterate over component's strings and dump them to the console 
		CompVC.StringComponent myVCStringComp = new CompVC.StringComponent();
		Console.WriteLine("\nStrings from Visual C++ StringComponent");				
		for (int index = 0; index < myVCStringComp.Count; index++) {
			Console.WriteLine(myVCStringComp.GetString(index));				
        }	

        // Iterate over component's strings and dump them to the console 
		CompVB.StringComponent myVBStringComp = new CompVB.StringComponent();
		Console.WriteLine("\nStrings from Visual Basic StringComponent");				
		for (int index = 0; index < myVBStringComp.Count; index++) {
			Console.WriteLine(myVBStringComp.GetString(index));				
        }	
    }
}
