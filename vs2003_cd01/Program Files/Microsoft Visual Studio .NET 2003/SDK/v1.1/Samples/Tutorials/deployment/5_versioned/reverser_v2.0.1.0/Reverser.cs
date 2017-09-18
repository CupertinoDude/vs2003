using System;

[assembly: System.Reflection.AssemblyVersion("2.0.1.0")]
[assembly: System.Reflection.AssemblyKeyFile("orgVerKey.snk")]

namespace org.Test {
	public class Reverser {
		public Reverser() {}
        
		public string[] Invert(string[] myString, int myCount) {
			System.Array.Reverse(myString);
			return myString;
		}

	}
}
