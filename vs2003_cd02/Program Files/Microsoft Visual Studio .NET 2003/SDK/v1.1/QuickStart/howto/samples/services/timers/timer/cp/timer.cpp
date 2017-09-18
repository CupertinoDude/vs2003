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

// Timer.cpp
//

#using <mscorlib.dll>
using namespace System;

#using <System.dll>
using namespace System::Timers;

__gc public class WaitableTimerSample
{
public:
	WaitableTimerSample()
	{
		System::Timers::Timer *aTimer = new System::Timers::Timer();

		aTimer->Elapsed += new ElapsedEventHandler(this, OnTimer);

		aTimer->Interval = 1000;
		aTimer->Enabled = true;

		Console::WriteLine(S"Press \'q\' to quit the sample");
		while(Console::Read()!='q');
	}

	void OnTimer(Object* source, ElapsedEventArgs* e)
	{
		Console::WriteLine(S"Hello World!");
	}
};

void main()
{
	WaitableTimerSample *pSample = new WaitableTimerSample();
}
