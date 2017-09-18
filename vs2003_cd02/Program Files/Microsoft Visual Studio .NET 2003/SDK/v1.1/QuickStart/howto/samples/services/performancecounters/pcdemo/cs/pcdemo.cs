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

using System;
using System.Diagnostics;
using System.Timers;
using System.Threading;

public class PCDemo{

    static PerformanceCounter theCounter;

    const string objectName   = "ACounterDemo";
    const string counterName  = "CountPerSecond";
    const string instanceName = "_Total";

    public static void Main(string[] args){

        // Get the category/counters installed...
        if ( (args.Length > 0) ) {
	    if ((args[0].StartsWith("/inst"))){
                if ( InstallCounters() )
                    return;
                else
                    Console.WriteLine("Continuing with sample...\r\n");
	    }
	    else if ((args[0].StartsWith("/del"))){
		DeleteCounters();
		return;
	    }
	    else {
		ShowUsage();
		return;
	    }
        }

        try {
            theCounter = new PerformanceCounter(objectName, counterName, instanceName, false);
	    theCounter.RawValue = 0;
        } catch(Exception) {
            Console.WriteLine("Unable to create Performance Counters.");
            Console.WriteLine("Please ensure that you have administrator privileges");
            Console.WriteLine("on this machine before running this sample.");
            return;
        }

        System.Timers.Timer aTimer = new System.Timers.Timer();
        aTimer.Elapsed += new ElapsedEventHandler(OnTimer);

        aTimer.Interval  = 100;
        aTimer.Enabled   = true;
        aTimer.AutoReset = false;

        Console.WriteLine("Press \'+\' to increase the interval");
        Console.WriteLine("Press \'-\' to decrease the interval");
        Console.WriteLine("Press \'q\' to quit the sample");
        Console.WriteLine("Started");

        int command;
        do {
            command = Console.Read();
            if (command == '+')
                aTimer.Interval = Math.Max(1, aTimer.Interval / 2);
            if (command == '-')
                aTimer.Interval *= 2;

            Thread.Sleep(500);
        }
        while (command != 'q');
        
    }

    public static void OnTimer(Object source, ElapsedEventArgs e) {
        try {
            theCounter.Increment();
            System.Timers.Timer theTimer = (System.Timers.Timer)source;
            theTimer.Enabled = true;
        } catch(Exception) {
            Console.WriteLine("You must have Administrator privelages to run this sample.");
        }
    }

    // Returns true if we install the counters...
    private static bool InstallCounters()
    {
        if (!PerformanceCounterCategory.Exists(objectName)) {
            Console.WriteLine("Installing category - " + objectName);
            CounterCreationData ccd = new CounterCreationData();
            ccd.CounterName = counterName;
            ccd.CounterType = PerformanceCounterType.RateOfCountsPerSecond32;
            CounterCreationDataCollection ccds = new CounterCreationDataCollection();
            ccds.Add(ccd);
            PerformanceCounterCategory.Create(objectName, "Sample Object", ccds);
	    Console.Write("Category has been successfully installed.");
            return(true);
        }
        else {
            Console.Write("Category already installed!  ");
            return(false);
        }
    }
	
    private static void DeleteCounters(){
        try{
    	    if(PerformanceCounterCategory.Exists(objectName)) {
	        PerformanceCounterCategory.Delete(objectName);
		Console.Write("Category has been successfully deleted!  ");

	    }
     	    else{
	       Console.Write("Category not installed!  ");
	    }
        } catch(Exception) {
            Console.WriteLine("You must have Administrator privelages to run this sample.");
        }
    }
    
    private static void ShowUsage(){

	Console.WriteLine("Usage");
	Console.WriteLine("-----");
        Console.WriteLine("To install perf counter AcounterDemo: pcdemo /inst");
	Console.WriteLine("To apply changes to perf counter AcounterDemo: pcdemo");
	Console.WriteLine("To delete perf counter AcounterDemo: pcdemo /del");
	
    }
}
