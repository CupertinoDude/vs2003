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
using System.ServiceProcess;
using System.Diagnostics;
using System.Timers;

public class SimpleService: ServiceBase {
    protected Timer timer;

    public static void Main() {
        ServiceBase.Run(new SimpleService());
    }

    public SimpleService()
    {
        CanPauseAndContinue = true;
        ServiceName = "Hello-World Service";

        timer = new Timer();
        timer.Interval = 1000;
        timer.Elapsed += new ElapsedEventHandler(OnTimer);
    }

    protected override void OnStart(string[] args)
    {
        EventLog.WriteEntry("Hello-World Service started");
        timer.Enabled = true;
    }

    protected override void OnStop()
    {
        EventLog.WriteEntry("Hello-World Service stopped");
        timer.Enabled = false;
    }

    protected override void OnPause()
    {
        EventLog.WriteEntry("Hello-World Service paused");
        timer.Enabled = false;
    }

    protected override void OnContinue()
    {
        EventLog.WriteEntry("Hello-World Service continued");
        timer.Enabled = true;
    }

    protected void OnTimer(Object source, ElapsedEventArgs e)
    {
        EventLog.WriteEntry("Hello World!");
    }
}

