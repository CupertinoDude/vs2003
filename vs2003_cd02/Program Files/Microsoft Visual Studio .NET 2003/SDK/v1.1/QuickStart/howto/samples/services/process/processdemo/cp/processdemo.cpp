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

// processdemo.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Threading;

#using <System.dll>
using namespace System::Diagnostics;

void main(int argc, char** argv)
{
	String* appName = Environment::GetCommandLineArgs()[0];

	if(argc != 2)
	{
		Console::WriteLine(String::Concat(S"Usage: ", appName, S" <executable>"));
		return;
	}

	String* executableFilename = argv[1];

	Process* process = new Process();
	process->StartInfo->FileName = executableFilename;
	process->Start();

	process->WaitForInputIdle();

	Thread::Sleep(1000);
	if(!process->CloseMainWindow())
	{
		process->Kill();
	}
}
