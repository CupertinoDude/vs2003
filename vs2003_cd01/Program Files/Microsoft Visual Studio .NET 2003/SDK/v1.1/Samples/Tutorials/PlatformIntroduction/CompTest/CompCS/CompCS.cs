using System;
namespace CompCS {
	public class StringComponent {
		private string[] StringsSet; 
        
		public StringComponent() {
			StringsSet = new string[] {
				"C# String 0",
				"C# String 1",
				"C# String 2",
				"C# String 3"			
			};
		}
        
		public string GetString(int index) {
			if ((index < 0) || (index >= StringsSet.Length)) {
				throw new IndexOutOfRangeException();
			}			
			return StringsSet[index];
		}

		public int Count {
			get { return StringsSet.Length; }
		}	
	}
}
