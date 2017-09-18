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

// adwrite.cpp
//

#using <mscorlib.dll>
using namespace System;

#using <System.dll>

#using <System.DirectoryServices.dll>
using namespace System::DirectoryServices;

void main(int argc, char ** argv)
{
	if (argc != 4) 
	{
		Console::WriteLine(String::Concat(S"Usage: ", Environment::GetCommandLineArgs()[0], S" <ad_path> <property> <value>"));
		Console::WriteLine();
		Console::WriteLine(S"Press any key to continue...");
		Console::ReadLine();
		return;
	}

	DirectoryEntry* objDirEnt = new DirectoryEntry(argv[1]);
	
	Console::WriteLine(String::Concat(S"Name            = ", objDirEnt->Name));
	Console::WriteLine(String::Concat(S"Path            = ", objDirEnt->Path));
	Console::WriteLine(String::Concat(S"SchemaClassName = ", objDirEnt->SchemaClassName));
	Console::WriteLine(String::Concat(argv[2], " = ", (objDirEnt->Properties->get_Item(argv[2]))->get_Item(0)->ToString()));
	Console::WriteLine(S"... changing to ");

	(objDirEnt->Properties->get_Item(argv[2]))->set_Item(0, Environment::GetCommandLineArgs()[3]);
	objDirEnt->CommitChanges();
	
	Console::WriteLine(String::Concat(argv[2], S" = ", (objDirEnt->Properties->get_Item(argv[2]))->ToString()));
}
