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

// prinfo.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Threading;

#using <System.dll>
using namespace System::Diagnostics;

void main(int argc, char** argv)
{
	String* appName = Environment::GetCommandLineArgs()[0];

	String* command = S"";
	if (argc >= 2)
		command = argv[1];

	if(argc != 3 && (argc != 2 || !command->Equals("e")))
	{
		Console::WriteLine(S"Usage: ");
		Console::WriteLine(String::Concat(S"\t", appName, S" e: Enumerate processes"));
		Console::WriteLine(String::Concat(S"\t", appName, S" <command> <process_id>"));
		Console::WriteLine(S"");
		Console::WriteLine(S"\t\t<command> =");
		Console::WriteLine(S"\t\t\ti: Show process info");
		Console::WriteLine(S"\t\t\tc: Close");
		Console::WriteLine(S"\t\t\tk: Kill");
		Console::WriteLine(S"\t\t\tp: show curent priority");
		return;
	}

	if (command->Equals(S"e"))
	{
		Process* processes[] = Process::GetProcesses();

		int nCount = processes->Count;
		if (nCount > 0)
		{
			for (int i = 0; i < nCount; i++)
			{
				Console::WriteLine(String::Concat(processes[i]->Id.ToString(), S"\t: ", processes[i]->ProcessName));
			}
		}
	}
	else
	{
		Int32 processid = Int32::Parse(argv[2]);
		Process* process = Process::GetProcessById(processid);

		Char cmd = command->Chars[0];
		switch (cmd)
		{
		case 'c':
			process->CloseMainWindow();
			break;
		case 'k':
			process->Kill();
			break;
		case 'p':
			Console::WriteLine(String::Concat(S"Priority: ", __box(process->PriorityClass)->ToString(S"G")));
			break;
		case 'i':
			Console::WriteLine(S"Priority Class         :{0}", __box(process->PriorityClass)->ToString(S"G"));
			Console::WriteLine(S"Handle Count           :{0}", process->HandleCount.ToString());
			Console::WriteLine(S"Main Window Title      :{0}", process->MainWindowTitle);
			Console::WriteLine(S"Min Working Set        :{0}", process->MinWorkingSet.ToString());
			Console::WriteLine(S"Max Working Set        :{0}", process->MaxWorkingSet.ToString());
			Console::WriteLine(S"Paged Memory Size      :{0}", process->PagedMemorySize.ToString());
			Console::WriteLine(S"Peak Paged Memory Size :{0}", process->PeakPagedMemorySize.ToString());
			break;
		}
	}
}













