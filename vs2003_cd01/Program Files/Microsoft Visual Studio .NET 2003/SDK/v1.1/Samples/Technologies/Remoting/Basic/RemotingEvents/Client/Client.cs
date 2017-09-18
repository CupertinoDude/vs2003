/*=====================================================================

  File:      Client.cs

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

public class Client
{
    public static void Main(String[] args)
    {
        // This could also be done with a Remoting configuration file

        // Register the HTTP Channel
        ChannelServices.RegisterChannel(new HttpChannel());

        // Obtain a Proxy to the SOAP URL
        Waz waz = (Waz)Activator.GetObject(
                                          typeof(Waz),
                                          "http://localhost:999/EventFireHost/Waz.soap"
                                          );

        for (int i = 0; i < 5; i++)
        {
            // Occurs over SOAP to waz)
            waz.HelloMethod("Bill" + " " + i);
        }

    }
}