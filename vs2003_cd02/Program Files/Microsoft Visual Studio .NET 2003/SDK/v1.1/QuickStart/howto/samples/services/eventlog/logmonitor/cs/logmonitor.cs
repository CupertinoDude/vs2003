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

public class LogMonitor
{
        public static void Main(String[] args)
  {
    string appName = Environment.GetCommandLineArgs()[0];

    if(args.Length != 1 && args.Length != 2) {
        Console.WriteLine("Usage: " + appName + " <log> [<machine>]");
        Console.WriteLine ();
        Console.WriteLine ("Press Enter to continue...");
        Console.ReadLine();
        return;
    }
    string log = args[0];
    string machine;
    if(args.Length == 2)
    {
      machine= args[1];
    }
    else
    {
      machine = "."; // local machine
    }

    if(!EventLog.Exists(log,machine))
    {
      Console.WriteLine("The log does not exist!");
      return;
    }

    EventLog aLog = new EventLog();
    aLog.Log = log;
    aLog.MachineName = machine;

    aLog.EntryWritten += new EntryWrittenEventHandler(OnEntryWritten);
    aLog.EnableRaisingEvents = true;

    Console.WriteLine("Press \'q\' to quit the sample");
    while(Console.Read()!='q')
    {
      Thread.Sleep(500);
    }
        }

    public static void OnEntryWritten(Object source, EntryWrittenEventArgs e) {
        Console.WriteLine("Written: " + e.Entry.Message);
    }
}