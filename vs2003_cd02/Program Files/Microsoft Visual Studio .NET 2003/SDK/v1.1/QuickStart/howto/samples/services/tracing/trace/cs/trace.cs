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

public class TraceSample
{
       	public static void Main(String[] args) 
	{
		Debug.Listeners.Add(new TextWriterTraceListener(Console.Out));
	
		Debug.WriteLine("The app was compiled with DEBUG directive!");
		Trace.WriteLine("The app was compiled with TRACE directive!");
		
		bool doTrace;

		doTrace = false;
		Trace.WriteLineIf(doTrace, "This should not show up!");
		Debug.WriteLineIf(doTrace, "This should not show up!");
	
		doTrace = true;
		Trace.WriteLineIf(doTrace, "The app was indeed compiled with TRACE directive!");
		Debug.WriteLineIf(doTrace, "The app was indded compiled with DEBUG directive!");			
       	}
}