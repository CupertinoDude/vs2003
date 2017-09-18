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

// pcread.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Threading;

#using <System.dll>
using namespace System::Diagnostics;
using namespace System::Timers;

__gc public class PCRead
{
private:
	String* m_instanceName;
	PerformanceCounter* m_theCounter;

public:
	PCRead(String* objectName, String* counterName, String* instanceName)
	{
		m_instanceName = instanceName;

		if ( !PerformanceCounterCategory::Exists(objectName) )
		{
			Console::WriteLine(String::Concat(S"Object ", objectName, S" does not exists!"));
			return;
		}

		if ( !PerformanceCounterCategory::CounterExists(counterName, objectName) )
		{
			Console::WriteLine(String::Concat(S"Counter ", counterName, S" does not exists!"));
			return;
		}

		m_theCounter = new PerformanceCounter(objectName, counterName, m_instanceName);

		System::Timers::Timer* aTimer = new System::Timers::Timer();
		aTimer->Elapsed += new ElapsedEventHandler(this, &PCRead::OnTimer);

		aTimer->Interval = 500;
		aTimer->Enabled = true;
		aTimer->AutoReset = false;

		Console::WriteLine(S"Press \'q\' to quit the sample");
		while ( Console::Read() != 'q' ) 
		{
			Thread::Sleep(500);
		}
	}

	void OnTimer(Object* source, ElapsedEventArgs* e)
	{
		try 
		{
			Console::WriteLine(String::Concat(S"Current value =  ", m_theCounter->NextValue().ToString()));
		} 
		catch(Exception* e)
		{
			Console::WriteLine(String::Concat(S"Instance ", m_instanceName, S" does not exist!"));
			return;
		}

		System::Timers::Timer* theTimer = __try_cast<System::Timers::Timer *>(source);
		theTimer->Enabled = true;
	}
};

void main(int argc, char ** argv)
{
	String* appName = Environment::GetCommandLineArgs()[0];

	if ( argc != 4 && argc != 3 )
	{
		Console::WriteLine(String::Concat(S"Usage: ", appName, S" <object> <counter> [<instance>]"));
		return;
	}

	String* objectName = argv[1];
	String* counterName = argv[2];
	String* instanceName = "";
	if ( argc == 4 )
		instanceName = argv[3];

	PCRead* pcread = new PCRead(objectName, counterName, instanceName);
}







