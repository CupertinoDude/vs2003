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
using System.IO;

/*
You need to create a configuration file (TraceDemo.exe.config) with the
following code to view the trace messages:

<?xml version="1.0" encoding="UTF-8" ?>
<configuration>
	<system.diagnostics>
		<switches>
			<!-- Set value property of the TraceMethods switch to one of the following:
				0 (false) or 1 (true) -->
			<add name="TraceMethods" value="1" />

			<!-- Set value property of the Arithmetic switch to one of the following:
				1(error), 2(warning), 3(info), 4(verbose) -->
			<add name="Arithmetic" value="4" />
		</switches>
	    <trace autoflush="false" indentsize="4" />
    </system.diagnostics>
</configuration>
*/

public class TraceDemo
{
	static BooleanSwitch traceMethods; 
	static TraceSwitch arithmeticSwitch;

	public static void Main(String[] args) 
	{
		Debug.Listeners.Add(new TextWriterTraceListener(Console.Out));
		traceMethods = new BooleanSwitch("TraceMethods", "TraceDemo Method Tracing Switch");
		arithmeticSwitch = new TraceSwitch("Arithmetic","Arithmetic Operations");
			
		for(int a = 0; a <= 4; a++)
			for(int b = 0; b <= 4; b++)
				Console.WriteLine(a+"/"+b+"="+Percent(a,b));
	}

	public static Int64 Divide(Int64 a, Int64 b)
	{
		if(traceMethods.Enabled) Trace.WriteLine("Divide("+a+","+b+") called");
		
		if(b==0)
		{
			Trace.WriteLineIf(arithmeticSwitch.TraceWarning,"!!!!!!!!!!!!!!!!!!Division by 0!!!!!!!!!!!!!!!!");
			b = 1;
		}
		
		Int64 ratio = a / b;
	
		if(traceMethods.Enabled)
			Trace.WriteLine("Divide("+a+","+b+") returns "+ratio);

		return ratio;
	}

	public static Int64 Percent(Int64 a, Int64 b)
	{
		if(traceMethods.Enabled)
			Trace.WriteLine("Percent("+a+","+b+") called");
		
		Int64 percent = Divide(100*a, b);
	
		if(traceMethods.Enabled)
			Trace.WriteLine("Percent("+a+","+b+") returns "+percent);

		return percent;
	}
}