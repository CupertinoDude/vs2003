'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Diagnostics
Imports System.IO

Public class Switches
    public shared sub Main()
		' setup listeners
		SetupListeners()

		' setup switches
		Dim boolSwitch as BooleanSwitch = new BooleanSwitch("ABooleanSwitch", "Demo bool switch")
		Dim traceSwitch as TraceSwitch = new TraceSwitch("ATraceSwitch","Demo trace switch")

		Debug.WriteLine("The app was compiled with DEBUG directive!")
		Trace.WriteLine("The app was compiled with TRACE directive!")

		Trace.WriteLineIf(boolSwitch.Enabled, "This is controlled by boolSwitch!")

		Trace.WriteLineIf(traceSwitch.TraceError, "This is controlled by traceSwitch.Error!")
		Trace.WriteLineIf(traceSwitch.TraceWarning, "This is controlled by traceSwitch.Warning!")
		Trace.WriteLineIf(traceSwitch.TraceInfo, "This is controlled by traceSwitch.Info!")
		Trace.WriteLineIf(traceSwitch.TraceVerbose, "This is controlled by traceSwitch.Verbose!")
		Trace.Close()
    end sub

	public shared sub SetupListeners()
		Debug.Listeners.Add(new TextWriterTraceListener(Console.Out))
		Debug.Listeners.Add(new TextWriterTraceListener(File.Create("output.txt")))
		if(not EventLog.SourceExists("SwitchesDemo")) then
			EventLog.CreateEventSource("SwitchesDemo","SwitchesDemo")
                end if

		Debug.Listeners.Add(new EventLogTraceListener("SwitchesDemo"))
	end sub
end class
