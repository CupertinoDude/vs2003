/*=====================================================================

  File:      HelloGetObject2.cs

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
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;

using Hello;

public class HelloNew
{
    public static void Main(String[] args)
    {
        Console.WriteLine(".NET Remoting Sample - HelloGetObject2");
        Console.WriteLine("--------------------------------------\n");

        String name = "Bill";    
        Type type = typeof(HelloService);
        String url = "http://localhost:8000/RemotingHello/HelloService.soap";

        Console.WriteLine("Loading HttpChannel");
        ChannelServices.RegisterChannel(new HttpChannel());

        Console.WriteLine("Obtaining Proxy for HelloService, using Activator.GetObject");
        HelloService helloService = (HelloService)Activator.GetObject(type, url);

        Console.WriteLine("Checking if helloservice is really a proxy");
        if (RemotingServices.IsTransparentProxy(helloService) == true)
            Console.WriteLine("helloService is a proxy!");
        else
            throw new Exception("helloService is not a proxy");

        Console.WriteLine("Calling HelloService.ReturnGreeting({0})", name);
        String greeting = helloService.ReturnGreeting(name);

        Console.WriteLine("HelloService.ReturnGreeting returned: {0}", greeting);
    }
}


