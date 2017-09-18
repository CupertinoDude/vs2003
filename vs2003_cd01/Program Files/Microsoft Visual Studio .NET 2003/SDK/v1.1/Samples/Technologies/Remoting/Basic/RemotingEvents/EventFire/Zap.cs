/*=====================================================================

  File:      Zap.cs

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
using System.Collections;

namespace Zap
{
    // Define the event arguments
    [Serializable]
    public class GreetingEventArgs : EventArgs
    {
        public GreetingEventArgs(string greeting)
        {
            this.greeting = greeting;
        }

        public string greeting;
    }

    // Define the event
    public delegate void GreetingEvent (object sender, GreetingEventArgs e);

    // Define the Service
    public class Waz : MarshalByRefObject
    {
        // The client will subscribe and 
        // unsubscribe to this event
        public event GreetingEvent Greeting;

        // Method called remotely by client
        public void HelloMethod(string greeting)
        {
            Console.WriteLine("Received String {0}", greeting);

            // Package String in GreetingEventArgs
            GreetingEventArgs e = new GreetingEventArgs(greeting);

            // Fire Event
            if (Greeting != null)
            {
                Console.WriteLine("Firing Event");
                Greeting(this, e);
            }
        }
    }
}
