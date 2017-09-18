#using <mscorlib.dll>
using namespace System;

#using "..\Bin\CompCS.dll"
#using "..\Bin\CompVC.dll"
#using "..\Bin\CompVB.dll"

// method called "Main" is application's entry point function
void main() {

    // Iterate over component's strings and dump them to the console 
	CompCS::StringComponent* myCSStringComp = new CompCS::StringComponent();
	Console::WriteLine(L"Strings from C# StringComponent");				
	for (int index = 0; index < myCSStringComp->Count; index++) {
		Console::WriteLine(myCSStringComp->GetString(index));				
    }	
	
    // Iterate over component's strings and dump them to the console 
	CompVC::StringComponent* myVCStringComp = new CompVC::StringComponent();
	Console::WriteLine(L"\nStrings from Visual C++ StringComponent");				
	for (int index = 0; index < myVCStringComp->Count; index++) {
		Console::WriteLine(myVCStringComp->GetString(index));				
    }	

    // Iterate over component's strings and dump them to the console 
	CompVB::StringComponent* myVBStringComp = new CompVB::StringComponent();
	Console::WriteLine(L"\nStrings from Visual Basic StringComponent");				
	for (int index = 0; index < myVBStringComp->Count; index++) {
		Console::WriteLine(myVBStringComp->GetString(index));				
    }
}
