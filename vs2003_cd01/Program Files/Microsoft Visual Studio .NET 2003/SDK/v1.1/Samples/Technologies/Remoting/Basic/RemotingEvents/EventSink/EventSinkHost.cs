/*=====================================================================

  File:      EventSinkHost.cs

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

using Zap;
using Wak;

public class Client
{
    public static void Main(String[] args)
    {
        // Register the wellknown server type. 
        RemotingConfiguration.Configure("eventsinkhost.exe.config");		

        // We are done, wait until the user wants to exit
        Console.WriteLine("Host is ready to process remote messages.");
        Console.WriteLine("Press ENTER to exit");
        String keyState = Console.ReadLine();
    
    }
}
