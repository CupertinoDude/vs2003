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

#using<mscorlib.dll>
#using<system.dll>
using namespace System;
using namespace System::IO;
using namespace System::Collections;

void main()
{
	//declare the StreamReader, for accessing the file
	try {
		String * textFile="..\\words.txt";
		StreamReader * din = File::OpenText(textFile);
		String* str;
		ArrayList* al = new ArrayList();

		Console::WriteLine("Reading data and insterting into an ArrayList...");
		Console::WriteLine();

		while ((str=din->ReadLine()) != 0) {
			al->Add(str);
		}

		Console::WriteLine("Printing out the ArrayList.");
		Console::WriteLine("---------------------------");
		IEnumerator* ie=al->GetEnumerator();
		while (ie->MoveNext())
		{      String* s= __try_cast<String*> (ie->Current);
			   Console::WriteLine (s);
		}
	}
	catch (Exception*) {
		Console::WriteLine("There was an error reading the file words.txt. Please ensure it is in the right directory");
	}

}

