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

' You need to create a configuration file (TraceDemo.exe.config) with the
' following code to view the trace messages:
'
' <?xml version="1.0" encoding="UTF-8" ?>
' <configuration>
'     <system.diagnostics>
'         <switches>
'             <!-- Set value property of the TraceMethods switch to one of the following:
'                  0 (false) or 1 (true) -->
'             <add name="TraceMethods" value="1" />
' 
'             <!-- Set value property of the Arithmetic switch to one of the following:
'                  1(error), 2(warning), 3(info), 4(verbose) -->
'             <add name="Arithmetic" value="4" />
'         </switches>
'         <trace autoflush="false" indentsize="4" />
'     </system.diagnostics>
' </configuration>

public class TraceDemo
	shared traceMethods As BooleanSwitch 
	shared arithmeticSwitch As TraceSwitch

	public shared sub Main() 
		Debug.Listeners.Add(new TextWriterTraceListener(Console.Out))
		traceMethods = new BooleanSwitch("TraceMethods", "TraceDemo Method Tracing Switch")
		arithmeticSwitch = new TraceSwitch("Arithmetic","Arithmetic Operations")
		
		Dim a As Integer
		Dim b As Integer	
		for a = 0 to  4
			for b = 0 to 4
				Console.WriteLine(CStr(a)+"/"+CStr(b)+"="+CStr(Percent(a,b)))
			next b
		next a
	end sub

	public shared function Divide(a as Int64, b as Int64) As Int64
		if(traceMethods.Enabled) then 
			Trace.WriteLine("Divide("+CStr(a)+","+CStr(b)+") called") 
		end if
		
		if(b=0) then
			Trace.WriteLineIf(arithmeticSwitch.TraceWarning,"!!!!!!!!!!!!!!!!!!Division by 0!!!!!!!!!!!!!!!!")
			b = 1
		end if
		
		Dim ratio As Int64 = CType(a / b,Int64)
	
		if(traceMethods.Enabled) then 
			Trace.WriteLine("Divide("+CStr(a)+","+CStr(b)+") returns "+CStr(ratio))
		end if
		Divide = ratio
	end function

	public shared function Percent(a as Int64, b as Int64) as Int64
		if(traceMethods.Enabled) then 
			Trace.WriteLine("Percent("+CStr(a)+","+CStr(b)+") called")
		end if
		
		Dim percentResult As Int64 = CType(Divide(100*a, b),Int64)

		if(traceMethods.Enabled) then 
			Trace.WriteLine("Percent("+CStr(a)+","+CStr(b)+") returns "+CStr(percentResult))
		end if
		Percent = percentResult
	end function
end class