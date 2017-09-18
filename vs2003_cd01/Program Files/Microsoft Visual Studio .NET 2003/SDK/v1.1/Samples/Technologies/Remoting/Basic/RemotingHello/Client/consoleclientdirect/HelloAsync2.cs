/*=====================================================================

  File:      HelloAsync2.cs

---------------------------------------------------------------------
This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.
 
THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Messaging;
using System.Threading;

using Hello;

public class HelloAsync2
{
    public static void Main(String[] args)
    {
        Console.WriteLine(".NET Remoting Sample - HelloAsync2");
        Console.WriteLine("----------------------------------\n");

        HelloAsync2 helloAsync = new HelloAsync2();
        helloAsync.Run();
    }

    public void Run()
    {
        String name = "Bill";
        String configFilename = "HelloAsync2.exe.config";

        Console.WriteLine("Configuring Remoting from {0}", configFilename);
        RemotingConfiguration.Configure(configFilename);

        Console.WriteLine("Obtaining Proxy for HelloService, using new");
        HelloService helloService = new HelloService();

        Console.WriteLine("Creating ReturnGreetingDelegate to HelloService.ReturnGreeting");
        ReturnGreetingDelegate returnGreetingDelegate = new ReturnGreetingDelegate(helloService.ReturnGreeting);

        Console.WriteLine("Creating AsyncCallback to HelloAsync.greettingCallback");
        AsyncCallback asyncCallback = new AsyncCallback(this.greetingCallBack);

        Console.WriteLine("Creating ManualResetEvent, will be fired when greetingCallBack is complete");
        ManualResetEvent evt = new ManualResetEvent(false);

        Console.WriteLine("ManualResetEvent is passed in async state object, greetingCallBack will use it");
        Object stateObject = evt;

        Console.WriteLine("Calling returnGreetingDelegate.BeginInvokeInvoke");
        IAsyncResult ar = returnGreetingDelegate.BeginInvoke(name, asyncCallback, stateObject);

        Console.WriteLine("Waiting for greetingCallback to completed");
        evt.WaitOne();
        Console.WriteLine("Event fired");
    }

    public delegate String ReturnGreetingDelegate(String name);

    public void greetingCallBack(IAsyncResult ar)
    {
        ReturnGreetingDelegate returnGreetingDelegate = (ReturnGreetingDelegate)((AsyncResult)ar).AsyncDelegate;

        Console.WriteLine("Calling returnGreetingDelegate.EndInvoke");
        String greeting = returnGreetingDelegate.EndInvoke(ar);

        Console.WriteLine("returnGreetingDelegate.EndInvoke returned: {0}", greeting);

        Console.WriteLine("Fire event that greetingCallBack is complete");
        ManualResetEvent stateObjectEvt = (ManualResetEvent)ar.AsyncState;
        stateObjectEvt.Set();
    }
}




