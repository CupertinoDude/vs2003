using System;

#if STRONG
[assembly: System.Reflection.AssemblyVersion("1.0.0.0")]
[assembly: System.Reflection.AssemblyKeyFile("orgKey.snk")]
#endif

namespace org.Test {
	public class Reverser {
		public Reverser() {}
        
		public string[] Invert(string[] myString) {
			System.Array.Reverse(myString);
			return myString;
		}

	}
}
