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
using System.Threading;
using System.Timers;

public class WaitableTimerSample
{
    public static void Main(String[] args)
	{
		System.Timers.Timer aTimer = new System.Timers.Timer();

		aTimer.Elapsed += new ElapsedEventHandler(OnTimer);

		aTimer.Interval = 1000;
		aTimer.Enabled = true;

		Console.WriteLine("Press \'q\' to quit the sample");
		while(Console.Read()!='q');
    }

	public static void OnTimer(Object source, ElapsedEventArgs e)
	{
		Console.WriteLine("Hello World!");
	}
}