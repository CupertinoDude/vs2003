/*=====================================================================

  File:      Wak.cs

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

using Zap;

namespace Wak
{
    // Marshal by Ref Object onto which the event will be fired
    public class Baz : MarshalByRefObject
    {
        [OneWay]
        public void GreetingHandler(object sender, GreetingEventArgs e)
        {
            Console.WriteLine("GreetingHandler callback : Greeting : {0}\n", e.greeting);
        }
    }
}
