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

// pcwrite.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Threading;

#using <System.dll>
using namespace System::Diagnostics;

__gc public class PCWrite
{
private:
    static String* objectName = S"Orders";
    static String* counterName = S"Milk Orders";
    static String* instanceName = S"International";

public:
    PCWrite() {
        if ( (Environment::GetCommandLineArgs()->Length > 1) ) {
	    if ((Environment::GetCommandLineArgs()[1]->StartsWith("/inst"))){
                if ( true == InstallCounters() )
                    	return;
                else
                   	Console::WriteLine("Continuing with sample...\r\n");
	    }
	    else if ((Environment::GetCommandLineArgs()[1]->StartsWith("/del"))){
		PCWrite::DeleteCounters();
		return;
	    }
	    else {
		PCWrite::ShowUsage();
		return;
	    }
	}

	if(PerformanceCounterCategory::Exists(objectName)) {
	    if(!PerformanceCounterCategory::CounterExists(counterName, objectName))
    	    {
    		Console::WriteLine(S"The counter does not exists!");
		return;
	    }

	    PerformanceCounter* aCounter = new PerformanceCounter(objectName, counterName, instanceName, false);
	    aCounter->RawValue = 50;

	    Console::WriteLine(S"Press \'q\' to quit the sample");
	    Console::WriteLine(S"Press \'+\' to increment the counter");
	    Console::WriteLine(S"Press \'-\' to decrement the counter");

	    Console::WriteLine(S"Started");
	
	    int command;
	    do
	    {
		command = Console::Read();
		if (command == '-') 
			aCounter->IncrementBy(-5);
		if (command == '+')
			aCounter->IncrementBy(5);

		Thread::Sleep(500);
	    }
	    while(command!='q');
        }
	else
	{
	    Console::WriteLine(S"Category has to be installed first by running: pcwrite /inst");
	}
    }

	bool InstallCounters()
	{
	   if(!PerformanceCounterCategory::Exists(objectName)) {
		PerformanceCounterCategory::Create(objectName, S"Simple Counter Object", counterName, S"Simple Counter");
		Console::WriteLine(S"Category has been created");
		return true;
	    }
            else {
            	Console::WriteLine(S"Category already installed!  ");
            	return false;
            }	
	}

	void DeleteCounters()
	{
    	      if(PerformanceCounterCategory::Exists(objectName)) {
	         PerformanceCounterCategory::Delete(objectName);
		 Console::WriteLine(S"Category has been successfully deleted!  ");
	      }
	      else {
		 Console::WriteLine(S"Category has not been installed!  ");
	      }
	}
	void ShowUsage()
	{
	    Console::WriteLine(S"Usage");
	    Console::WriteLine(S"-----");
            Console::WriteLine(S"To install perf counter: pcwrite /inst");
	    Console::WriteLine(S"To apply changes to perf counter: pcwrite");
	    Console::WriteLine(S"To delete perf counter: pcwrite /del");
	}

};

void main(int argc, char ** argv)
{
    PCWrite* pcwrite = new PCWrite();
}















