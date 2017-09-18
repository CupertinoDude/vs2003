using System;
namespace org {
	public class Stringer {
		private string[] StringsSet; 
        
		public Stringer() {
			StringsSet = new string[] {
				"String 0",
				"String 1",
				"String 2",
				"String 3"			
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
