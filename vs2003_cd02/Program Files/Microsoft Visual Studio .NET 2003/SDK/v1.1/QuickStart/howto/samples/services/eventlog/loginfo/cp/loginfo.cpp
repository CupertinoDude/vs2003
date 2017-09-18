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

// loginfo.cpp

#using <mscorlib.dll>
using namespace System;

#using <System.dll>
using namespace System::Diagnostics;

void main(int argc, char ** argv)
{
	String* appName = Environment::GetCommandLineArgs()[0];

	if(argc != 2 && argc != 3)
	{
		Console::WriteLine(String::Concat(S"Usage: ", appName, S" <log> [<machine>]"));
		Console::WriteLine ();
		Console::WriteLine (S"Press any key to continue...");
		Console::ReadLine();
		return;
	}

	String* log = argv[1];

	String* machine;
	if(argc == 3)
	{
		machine= argv[2];
	}
	else
	{
		machine = S"."; // local machine
	}

	if(!EventLog::Exists(log, machine))
	{
		Console::WriteLine(S"The log does not exist!");
		return;
	}

	EventLog* aLog = new EventLog();
	aLog->Log = log;
	aLog->MachineName = machine;

	Console::WriteLine(String::Concat(S"There are ", aLog->Entries->Count.ToString(), S" entr[y|ies] in the log:"));

	EventLogEntryCollection* entries = aLog->get_Entries();
	if (entries->Count > 0)
	{
		EventLogEntry* entry;
		for (int i = 0; i < entries->Count; i++)
		{
			entry = entries->get_Item(i);
			Console::WriteLine(String::Concat(S"\tEntry: ", entry->Message));
		}
	}
}
