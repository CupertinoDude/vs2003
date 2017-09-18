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
using System.Threading;
using System.Timers;

public class PCRead {

    static string objectName;
    static string counterName;
    static string instanceName;
    static PerformanceCounter theCounter;


    public static void Main(string[] args){

        string appName = Environment.GetCommandLineArgs()[0];

        if ( args.Length != 3 && args.Length != 2 ) {
            Console.WriteLine("Usage: {0} <object> <counter> [<instance>]", appName);
            return;
        }

        objectName  = args[0];
        counterName  = args[1];
        instanceName = "";
        if ( args.Length == 3 )
            instanceName = args[2];

        if ( !PerformanceCounterCategory.Exists(objectName) ) {
            Console.WriteLine("Object {0} does not exists!",objectName);
            return;
        }

        if ( !PerformanceCounterCategory.CounterExists(counterName, objectName) ) {
            Console.WriteLine("Counter {0} does not exists!", counterName);
            return;
        }

        theCounter = new PerformanceCounter(objectName, counterName ,instanceName);

        System.Timers.Timer aTimer = new System.Timers.Timer();
        aTimer.Elapsed += new ElapsedEventHandler(OnTimer);

        aTimer.Interval = 500;
        aTimer.Enabled = true;
        aTimer.AutoReset = false;

        Console.WriteLine("Press \'q\' to quit the sample");
        while ( Console.Read()!='q' ) {
            Thread.Sleep(500);
        }
    }

    public static void OnTimer(Object source, ElapsedEventArgs e)
    {
        try {
            Console.WriteLine("Current value =  " + theCounter.NextValue().ToString());
        } catch {
            Console.WriteLine("Instance {0} does not exist!", instanceName);
            return;
        }

        System.Timers.Timer theTimer = (System.Timers.Timer)source;
        theTimer.Enabled = true;
    }
}