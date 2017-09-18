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
using System.Globalization;

public class WriteLog {
    public static void Main(String[] args) {
        string appName = Environment.GetCommandLineArgs()[0];

        if ( args.Length != 3 ) {
            Console.WriteLine("Usage: " + appName +" <log> <message> <source>");
            Console.WriteLine ();
            Console.WriteLine ("Press Enter to continue...");
            Console.ReadLine();
            return;
        }

        string log = args[0];
        string source = args[2];

        if ( !EventLog.SourceExists(source) ) {
            EventLog.CreateEventSource(source,log);
        }

        EventLog aLog = new EventLog();
        aLog.Source = source;

        if ( String.Compare(aLog.Log, log, true, CultureInfo.InvariantCulture) != 0 ) {
            Console.WriteLine("Some other application is using the source!");
            return;
        }

        aLog.WriteEntry(args[1],EventLogEntryType.Information);
        Console.WriteLine("Entry written successfuly!");
    }
}

