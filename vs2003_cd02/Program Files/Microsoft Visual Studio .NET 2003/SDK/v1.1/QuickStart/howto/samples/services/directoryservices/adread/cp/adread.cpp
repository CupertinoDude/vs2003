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

// adread.cpp
//

#using <mscorlib.dll>
using namespace System;
using namespace System::Collections;

#using <System.dll>

#using <System.DirectoryServices.dll>
using namespace System::DirectoryServices;

void main(int argc, char ** argv)
{
	if (argc != 2) 
	{
		Console::WriteLine(String::Concat(S"Usage: ", Environment::GetCommandLineArgs()[0], S" <ad_path>"));
		Console::WriteLine();
		Console::WriteLine(S"Press any key to continue...");
		Console::ReadLine();
		return;
	}

	DirectoryEntry* objDirEnt = new DirectoryEntry(argv[1]);
	Console::WriteLine(String::Concat(S"Name            = ", objDirEnt->Name));
	Console::WriteLine(String::Concat(S"Path            = ", objDirEnt->Path));
	Console::WriteLine(String::Concat(S"SchemaClassName = ", objDirEnt->SchemaClassName));
	Console::WriteLine(S"");
	Console::WriteLine(S"Properties:");

	String *Key;
	Object* objValue;

	ICollection* PropCol = objDirEnt->Properties->PropertyNames;
	if (PropCol->Count > 0)
	{
		IEnumerator* Enum1 = PropCol->GetEnumerator();
		while (Enum1->MoveNext())
		{
			Key = Enum1->Current->ToString();
			Console::Write(S"\t{0} = ", Key);
			Console::WriteLine(S"");

			ICollection* ValCol = objDirEnt->Properties->get_Item(Key);
			if (ValCol->Count > 0)
			{
				IEnumerator* Enum2 = ValCol->GetEnumerator();
				while (Enum2->MoveNext())
				{
					objValue = Enum2->Current;
					Console::WriteLine(S"\t\t{0}", objValue);
				}
			}
		}
	}
}


