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

// logwrite.cpp

#using <mscorlib.dll>
using namespace System;

#using <System.dll>
using namespace System::Diagnostics;

void main(int argc, char ** argv)
{
	String* appName = Environment::GetCommandLineArgs()[0];

	if ( argc != 4 ) 
	{
		Console::WriteLine(String::Concat(S"Usage: ", appName, S" <log> <message> <source>"));
		Console::WriteLine();
		Console::WriteLine(S"Press any key to continue...");
		Console::ReadLine();
		return;
	}

	String* log = argv[1];
	String* source = argv[3];

	if ( !EventLog::SourceExists(source) )
	{
		EventLog::CreateEventSource(source, log);
	}

	EventLog* aLog = new EventLog();
	aLog->Source = source;
	aLog->WriteEntry(argv[1], EventLogEntryType::Information);

	Console::WriteLine(S"Entry written successfuly!");
}
