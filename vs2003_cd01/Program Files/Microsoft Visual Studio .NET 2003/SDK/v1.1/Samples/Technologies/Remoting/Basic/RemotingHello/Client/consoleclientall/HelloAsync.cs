/*=====================================================================

  File:      HelloAsync.cs

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

public class HelloAsync
{
    public static void Main(String[] args)
    {
        Console.WriteLine(".NET Remoting Sample - HelloAsync");
        Console.WriteLine("---------------------------------\n");

        HelloAsync helloAsync = new HelloAsync();
        helloAsync.Run();
    }

    public void Run()
    {
        String name = "Bill";    
        String configFilename = "HelloAsync.exe.config";

        Console.WriteLine("Configuring Remoting from {0}", configFilename);
        RemotingConfiguration.Configure(configFilename);

        Console.WriteLine("Obtaining Proxy for HelloService, using new");
        HelloService helloService = new HelloService();

        Console.WriteLine("Creating ReturnGreetingDelegate to HelloService.ReturnGreeting");
        ReturnGreetingDelegate returnGreetingDelegate = new ReturnGreetingDelegate(helloService.ReturnGreeting);

        Console.WriteLine("Calling returnGreetingDelegate.BeginInvokeInvoke");
        IAsyncResult ar = returnGreetingDelegate.BeginInvoke(name, null, null);

        Console.WriteLine("Calling returnGreetingDelegate.EndInvoke");
        String greeting = returnGreetingDelegate.EndInvoke(ar);

        Console.WriteLine("returnGreetingDelegate.EndInvoke returned: {0}", greeting);
    }

    public delegate String ReturnGreetingDelegate(String name);

}

