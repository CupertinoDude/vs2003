using System;
using System.Collections;
using System.Resources;

class MainApp {
	public static void Main() {
		// First create the resource file and add strings
		IResourceWriter rw = new ResourceWriter("sample.resources");
		rw.AddResource("test1", "one");
		rw.AddResource("test2", "two");
		rw.AddResource("test3", "three");
		rw.AddResource("test4", "four");
		rw.AddResource("test5", 512341234);
		rw.Close();

		// Iterate through the resources
		IResourceReader rr = new ResourceReader("sample.resources");
		IDictionaryEnumerator de = rr.GetEnumerator();
		while (de.MoveNext()) {
			Console.WriteLine(de.Key + " " + de.Value);
		}
		rr.Close();

		// Use a ResourceManager to access specific resources
		ResourceManager rm = ResourceManager.CreateFileBasedResourceManager("sample", ".", null);
		Console.WriteLine(rm.GetString("test1"));
		Console.WriteLine(rm.GetString("test2"));
		Console.WriteLine(rm.GetString("test3"));
		Console.WriteLine(rm.GetString("test4"));
		Console.WriteLine(rm.GetObject("test5").ToString());

	}
}