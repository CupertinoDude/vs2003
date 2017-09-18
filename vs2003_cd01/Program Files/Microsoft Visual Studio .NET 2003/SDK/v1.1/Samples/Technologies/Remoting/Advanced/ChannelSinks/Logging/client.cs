/*=====================================================================

  File:      client.cs

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
using System.Collections;
using System.IO;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using System.Runtime.Remoting.Channels.Tcp;
using System.Runtime.Remoting.Metadata;
using System.Threading;

using Logging;


public class Client
{

    public static void Main(String[] args)
    {
        RemotingConfiguration.Configure("channels.config");
        RemotingConfiguration.Configure("client.exe.config");

        Foo server = new Foo();     
   
        Console.WriteLine(server.PrintString("First string logged to console."));

        // get logging control object
        IDictionary properties = ChannelServices.GetChannelSinkProperties(server);
        ILoggingSink logging = (ILoggingSink)properties[typeof(LoggingSinkKey)];

        // redirect logging to a file
        logging.Out = new StreamWriter(File.OpenWrite("client.log"));
        Console.WriteLine(server.PrintString("Second string logged to client.log."));

        // disable logging
        logging.Enabled = false;
        Console.WriteLine(server.PrintString("Last string not logged."));
    }

}