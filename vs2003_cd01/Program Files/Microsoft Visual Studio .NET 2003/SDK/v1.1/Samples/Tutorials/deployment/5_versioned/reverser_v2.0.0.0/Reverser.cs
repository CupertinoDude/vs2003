using System;

[assembly: System.Reflection.AssemblyVersion("2.0.0.0")]
[assembly: System.Reflection.AssemblyKeyFile("orgVerKey.snk")]

namespace org.Test {
	public class Reverser {
		public Reverser() {}
        
		public string[] Invert(string[] myString) {
			System.Array.Reverse(myString);
			return myString;
		}

	}
}
