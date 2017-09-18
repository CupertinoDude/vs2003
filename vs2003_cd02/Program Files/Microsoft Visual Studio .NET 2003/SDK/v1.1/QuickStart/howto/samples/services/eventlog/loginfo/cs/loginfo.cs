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

public class LogInfo
{
       	public static void Main(String[] args)
	{
		string appName = Environment.GetCommandLineArgs()[0];

		if(args.Length != 1 && args.Length != 2)
		{
			Console.WriteLine("Usage: {0} <log> [<machine>]", appName);
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

		Console.WriteLine("There are {0} entr[y|ies] in the log:", aLog.Entries.Count);
		foreach (EventLogEntry entry in aLog.Entries)
		{
			Console.WriteLine("\tEntry: {0}", entry.Message);
		}

       	}
}

