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

// projectinstaller.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Collections;

#using <System.dll>
using namespace System::ComponentModel;
using namespace System::Diagnostics;
using namespace System::Timers;

#using <System.ServiceProcess.dll>
using namespace System::ServiceProcess;

__gc public class SimpleService : public ServiceBase 
{
private:
	Timer* timer;

public:
	SimpleService()
	{
		CanPauseAndContinue = true;
		ServiceName = S"Hello-World Service";

		timer = new Timer();
		timer->Interval = 1000;
		timer->Elapsed += new ElapsedEventHandler(this, &SimpleService::OnTimer);
	}

protected:
	void OnStart(String* args[])
	{
		EventLog::WriteEntry(S"Simple Service", S"Hello-World Service started");
		timer->Enabled = true;
	}

	void OnStop()
	{
		EventLog::WriteEntry(S"Simple Service", S"Hello-World Service stopped");
		timer->Enabled = false;
	}

	void OnPause()
	{
		EventLog::WriteEntry(S"Simple Service", S"Hello-World Service paused");
		timer->Enabled = false;
	}

	void OnContinue()
	{
		EventLog::WriteEntry(S"Simple Service", S"Hello-World Service continued");
		timer->Enabled = true;
	}

	void OnTimer(Object* source, ElapsedEventArgs *e)
	{
		EventLog::WriteEntry(S"Simple Service", S"Hello World!");
	}
	static void Main()
	{
		ServiceBase::Run(new SimpleService());
	}
};

void main()
{
	ServiceBase::Run(new SimpleService());
}