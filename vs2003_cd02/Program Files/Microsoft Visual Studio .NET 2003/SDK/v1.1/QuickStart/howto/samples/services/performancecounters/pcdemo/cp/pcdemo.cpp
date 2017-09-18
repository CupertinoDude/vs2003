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

// pcdemo.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Threading;

#using <System.dll>
using namespace System::Diagnostics;
using namespace System::Timers;

__gc public class PCDemo
{
private:
	PerformanceCounter* m_theCounter;
	static String* objectName = S"ACounterDemo";
	static String* counterName = S"CountPerSecond";
	static String* instanceName = S"_Total";

public:
	PCDemo()
	{
        	if ( (Environment::GetCommandLineArgs()->Length > 1) ) {
	    		if ((Environment::GetCommandLineArgs()[1]->StartsWith("/inst"))){
                		if ( true == InstallCounters() )
                    			return;
                		else
                   		   Console::WriteLine("Continuing with sample...\r\n");
	    		}
	    		else if ((Environment::GetCommandLineArgs()[1]->StartsWith("/del"))){
				PCDemo::DeleteCounters();
				return;
	    		}
	    		else {
				PCDemo::ShowUsage();
				return;
	    		}
		}
		try 
		{
		    m_theCounter = new PerformanceCounter(objectName, counterName, instanceName, false);
		    m_theCounter->RawValue = 0;
		}
		catch(Exception* e) 
		{
		    Console::WriteLine(S"Unable to create Performance Counters.");
		    Console::WriteLine(S"Please ensure that you have administrator privelages");
		    Console::WriteLine(S"on this machine before running this sample.");
		    return;
		}

		System::Timers::Timer* aTimer = new System::Timers::Timer();
		aTimer->Elapsed += new ElapsedEventHandler(this, &PCDemo::OnTimer);

		aTimer->Interval = 100;
		aTimer->Enabled = true;
		aTimer->AutoReset = false;

		Console::WriteLine(S"Press \'+\' to increase the interval");
		Console::WriteLine(S"Press \'-\' to decrease the interval");
		Console::WriteLine(S"Press \'q\' to quit the sample");
		Console::WriteLine(S"Started");

		int command;
		do 
		{
			command = Console::Read();

			if (command == '+')
				aTimer->Interval = Math::Max(1, Convert::ToInt32(aTimer->Interval/2));

			if(command == '-')
				aTimer->Interval *= 2;

			Thread::Sleep(500);
		}
		while(command != 'q');

		
	}

	void OnTimer(Object* source, ElapsedEventArgs* e) 
	{
		try 
		{
			m_theCounter->Increment();

			System::Timers::Timer* theTimer = __try_cast<System::Timers::Timer *>(source);
			theTimer->Enabled = true;
		} 
		catch(Exception* e) 
		{
			Console::WriteLine(S"You must have Administrator privelages to run this sample.");
		}
	}
	
	bool InstallCounters()
	{
	   if(!PerformanceCounterCategory::Exists(objectName)) {
		CounterCreationData* ccd = new CounterCreationData();
		ccd->CounterName = counterName;
		ccd->CounterType = PerformanceCounterType::RateOfCountsPerSecond32;
				
		CounterCreationDataCollection* ccds = new CounterCreationDataCollection();
		ccds->Add(ccd);
				
		PerformanceCounterCategory::Create(objectName, S"Sample Object", ccds);
		Console::WriteLine(S"Performance Counter Successfully installed.");
		return true;
	    }
            else {
            	Console::WriteLine(S"Category already installed!  ");
            	return false;
            }	
	}
	void DeleteCounters()
	{
           try{
    	      if(PerformanceCounterCategory::Exists(objectName)) {
	         PerformanceCounterCategory::Delete(objectName);
		 Console::WriteLine(S"Category has been successfully deleted!  ");
	      }
           } catch(Exception* e)  {
              Console::WriteLine(S"You must have Administrator privelages to run this sample.");
           }
	}
	void ShowUsage()
	{
	    Console::WriteLine(S"Usage");
	    Console::WriteLine(S"-----");
            Console::WriteLine(S"To install perf counter AcounterDemo: pcdemo /inst");
	    Console::WriteLine(S"To apply changes to perf counter AcounterDemo: pcdemo");
	    Console::WriteLine(S"To delete perf counter AcounterDemo: pcdemo /del");
	}
};

void main(int argc, char ** argv)
{
	PCDemo* pcdemo = new PCDemo();
}




