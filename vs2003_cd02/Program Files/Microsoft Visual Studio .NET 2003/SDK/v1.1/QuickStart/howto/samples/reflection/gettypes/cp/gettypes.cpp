//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

// don't forget your using statements
#using <mscorlib.dll>

using namespace System;
using namespace System::Reflection;

// Getting an Assembly, method 1. Get the mscorlib assembly
// Note that other types such as String, or Int32 would have worked just as well,
// since they reside in the same assembly
//    Assembly *a = __typeof(Object)->Module->Assembly;

// Getting an Assembly, method 2. Load a particular assembly, using a reference to a
// module that is within that assembly. Note that this requires a compiled module for
// the reference, and when running in an aspx page, will require a fully qualifed path
// to the file, to ensure it is correctly identified
//    Assembly *b = Assembly::LoadFrom ("GetTypes.exe");

// note that either of the above methods is viable, depending on the information
// you have. Since we know the name of the file which houses all of the base system
// objects, we could do the following to replace the first example, just as effectively
// (the absolute path may change on your machine)
//    Assembly *a = Assembly::LoadFrom
//			("c:/winserv/microsoft.net/framework/v1.0.2230/mscorlib.dll");



void main (void)
{
	//Get the mscorlib assembly, it's the one Object is defined in
	Assembly *a = __typeof(Object)->Module->Assembly;

	//Get all the types in this assembly
	Type * types[] = a->GetTypes();

	//let's take a look at them, and gather a little bit of data as we do it.
	int numValueTypes = 0;
	int numInterfaces = 0;
	int numClasses = 0;
	int numArrays = 0;
	int i;	

	Console::WriteLine (S"Get all the types from the assembly: '{0}'", a->GetName());
	Console::WriteLine (S"Only the Interface Types will be listed.");
	Console::WriteLine (S"----------------------------------");
	
	for (i=0; i<types->Length; i++)
	{
		if (types[i]->IsClass) numClasses++;
		if (types[i]->IsValueType) numValueTypes++;
		if (types[i]->IsArray) numArrays++;

		if (types[i]->IsInterface) 
		{
			Console::WriteLine (types[i]->Name); //only print out the names of the Interfaces
			numInterfaces++;
		}
	}
	
	//write out the totals
	Console::WriteLine(S"-----------------------------------");
	Console::WriteLine(S"Out of {0} types in the {1} library:", types->Length.ToString(), __typeof(Object)->Module->ToString());
	Console::WriteLine(S"{0} are interfaces (listed)", numInterfaces.ToString());
	Console::WriteLine(S"{0} are value types", numValueTypes.ToString());
	Console::WriteLine(S"{0} are Classes", numClasses.ToString());
	Console::WriteLine(S"{0} are Arrays", numArrays.ToString());

	Console::WriteLine(S"-----------------------------------");
	Console::WriteLine();

	//Load THIS assembly using its file name
	try 
	{
		Assembly *b = Assembly::GetExecutingAssembly();
		Console::WriteLine (S"Get all the types from the assembly: '{0}'", b->GetName());
		Console::WriteLine(S"-----------------------------------");

		//Get the types of this assembly
		Type *types2[] = b->GetTypes ();
		for (i=0; i<types2->Length; i++)
			Console::WriteLine (types2[i]->FullName); //not many types, so we can print them all
	}
	catch (Exception *) 
	{
		// just in case the file cannot be found at the specified directory
		Console::WriteLine(S"Could not find the reference to the file which holds the assembly information");
		Console::WriteLine(S"for this application.");
		Console::WriteLine(S"Please alter the source file for this page to look in a different directory");
	}

	Console::WriteLine(S"-----------------------------------");

	Console::WriteLine();
	Console::WriteLine (S"Press Enter to continue...");
	Console::Read ();
}

//some other arbitrary classes, so that the assembly this module is a part of will have some types
public __gc class TestClass1
{
};

public __gc class TestClass2
{
};
