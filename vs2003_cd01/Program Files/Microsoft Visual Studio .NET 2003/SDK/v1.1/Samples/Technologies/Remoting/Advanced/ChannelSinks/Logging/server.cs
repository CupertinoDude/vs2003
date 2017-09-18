/*=====================================================================

  File:      Server.cs

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
using System.Globalization;
using System.IO;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using System.Threading;

using Logging;


public class Server
{
    public static void Main(String[] args)
    {
        RemotingConfiguration.Configure("channels.config");
        RemotingConfiguration.Configure("server.exe.config");               

        Console.WriteLine("Listening...");
        
        String keyState = "";
        while (String.Compare(keyState,"0", true,CultureInfo.InvariantCulture) != 0)
        {
            Console.WriteLine("***** Press 0 to exit this service *****");
            keyState = Console.ReadLine();
        }
    }
}

