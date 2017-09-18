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
using System.Messaging;
using System.IO;
using System.Runtime.Serialization;

public class MQReceive {
    public static void Main(String[] args)
    {
        string appName = Environment.GetCommandLineArgs()[0];

        if ( args.Length != 1 ) {
            Console.WriteLine("Usage: {0} <queue>", appName);
        } else {
            string mqPath = ".\\" + args[0];

            if ( !MessageQueue.Exists(mqPath) ) {
                Console.WriteLine("The queue '{0}' does not exist!", mqPath);
                return;
            }

            MessageQueue mq = new MessageQueue(mqPath);
            ((XmlMessageFormatter)mq.Formatter).TargetTypeNames = new string[]{"System.String,mscorlib"};

            try {
                Message m = mq.Receive(new TimeSpan(0,0,3));
                Console.WriteLine("Message: {0}", (string)m.Body);
            }
            catch ( MessageQueueException ) {
                Console.WriteLine("There are no messages in the queue");
                return;
            }
            catch ( InvalidOperationException ) {
                Console.WriteLine("The message removed from the queue is not a string");
                return;
            }
        }

        Console.WriteLine();
        Console.WriteLine("Press Enter to continue...");
        Console.ReadLine();
    }
}