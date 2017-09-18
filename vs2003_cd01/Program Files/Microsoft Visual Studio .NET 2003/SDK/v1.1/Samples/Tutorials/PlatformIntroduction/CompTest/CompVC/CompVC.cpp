#using <mscorlib.dll>
using namespace System;

namespace CompVC {
	__gc public class StringComponent {
    private:
		String* StringsSet[];
    
    public:
		StringComponent() {
			StringsSet = new String*[4]; 
			StringsSet[0] = new String(L"Visual C++ String 0");
			StringsSet[1] = new String(L"Visual C++ String 1");
			StringsSet[2] = new String(L"Visual C++ String 2");
			StringsSet[3] = new String(L"Visual C++ String 3");
		}
    
		String* GetString(int index) {
			if ((index < 0) || (index >= StringsSet->Length)) {
				throw new IndexOutOfRangeException();
			}			
			return StringsSet[index];
		}

		__property int get_Count() { return StringsSet->Length; }
	};

};
