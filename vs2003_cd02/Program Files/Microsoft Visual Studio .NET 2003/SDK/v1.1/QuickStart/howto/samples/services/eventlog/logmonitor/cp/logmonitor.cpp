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

// logmonitor.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Threading;

#using <System.dll>
using namespace System::Diagnostics;

__gc class LogMonitor
{
public:
	LogMonitor(String* log, String* machine)
	{
		EventLog* aLog = new EventLog();
		aLog->Log = log;
		aLog->MachineName = machine;

		aLog->EntryWritten += new EntryWrittenEventHandler(this, LogMonitor::OnEntryWritten);
		aLog->EnableRaisingEvents = true;

		Console::WriteLine(S"Press \'q\' to quit the sample");
		while(Console::Read() != 'q')
		{
			Thread::Sleep(500);
		}
	}

	void OnEntryWritten(Object* source, EntryWrittenEventArgs* e) 
	{
		Console::WriteLine(String::Concat(S"Written: ", e->Entry->Message));
	}
};

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

	LogMonitor* monitor = new LogMonitor(log, machine);
}








