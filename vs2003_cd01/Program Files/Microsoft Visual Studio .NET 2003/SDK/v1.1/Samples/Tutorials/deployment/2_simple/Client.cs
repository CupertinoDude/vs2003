using System;
using org;

// This class houses the app's entry-point	
class MainApp {
	// Static method "Main" is entry point
	public static void Main() {

		// Iterate over component's strings and dump to console 
		Stringer myStringComp = new Stringer();
		Console.WriteLine("Strings from StringComponent");				
		for (int index = 0; index < myStringComp.Count; index++) {
			Console.WriteLine(myStringComp.GetString(index));				
		}	
	}
}
