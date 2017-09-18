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

// switches.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::IO;

#using <System.dll>
using namespace System::Diagnostics;

// Set DWORD value of HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\COMPlus\Switches\ABooleanSwitch to 0 (false) or 1 (true)
// Set DWORD value of HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\COMPlus\Switches\ATraceSwitch to 0 (off), 1(error), 2 (warning), 3(info), 4(verbose)

void SetupListeners()
{
	Debug::Listeners->Add(new TextWriterTraceListener(Console::Out));
	Debug::Listeners->Add(new TextWriterTraceListener(File::Create(S"output.txt")));

	if(!EventLog::SourceExists(S"SwitchesDemo"))
	{
		EventLog::CreateEventSource(S"SwitchesDemo", S"SwitchesDemo");
	}

	Debug::Listeners->Add(new EventLogTraceListener(S"SwitchesDemo"));
}

void main()
{
	// setup listeners
	SetupListeners();

	// setup switches
	BooleanSwitch* boolSwitch = new BooleanSwitch(S"ABooleanSwitch", S"Demo bool switch");
	TraceSwitch* traceSwitch = new TraceSwitch(S"ATraceSwitch", S"Demo trace switch");

	Debug::WriteLine(S"The app was compiled with DEBUG directive!");
	Trace::WriteLine(S"The app was compiled with TRACE directive!");

	Trace::WriteLineIf(boolSwitch->Enabled, S"This is controlled by boolSwitch!");

	Trace::WriteLineIf(traceSwitch->TraceError, S"This is controlled by traceSwitch.Error!");
	Trace::WriteLineIf(traceSwitch->TraceWarning, S"This is controlled by traceSwitch.Warning!");
	Trace::WriteLineIf(traceSwitch->TraceInfo, S"This is controlled by traceSwitch.Info!");
	Trace::WriteLineIf(traceSwitch->TraceVerbose, S"This is controlled by traceSwitch.Verbose!");
}
