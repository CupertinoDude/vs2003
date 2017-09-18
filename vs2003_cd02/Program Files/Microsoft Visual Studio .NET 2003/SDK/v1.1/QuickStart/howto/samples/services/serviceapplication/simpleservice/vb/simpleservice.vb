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
Imports System.ServiceProcess
Imports System.Diagnostics
Imports System.Timers

public class SimpleService: inherits ServiceBase
        protected timer As Timer

        public shared sub Main()
                ServiceBase.Run(new SimpleService())
        end sub

	public sub New()
                MyBase.New()
		CanPauseAndContinue = true
                ServiceName = "Hello-World Service"

                timer = new Timer()
                timer.Interval = 1000
                AddHandler timer.Elapsed, AddressOf OnTimer
	end sub

	protected overrides Sub OnStart(args() As String)
    		EventLog.WriteEntry("Hello-World Service started")
                timer.Enabled = true
	end sub

	protected overrides sub OnStop()
		EventLog.WriteEntry("Hello-World Service stopped")
                timer.Enabled = false
	end sub

	protected overrides sub OnPause()
    		EventLog.WriteEntry("Hello-World Service paused")
                timer.Enabled = false
	end sub

	protected overrides sub OnContinue()
    		EventLog.WriteEntry("Hello-World Service continued")
                timer.Enabled = true
	end sub

        protected sub OnTimer(source as object, e As ElapsedEventArgs)
		EventLog.WriteEntry("Hello World!")
	end sub
end class
