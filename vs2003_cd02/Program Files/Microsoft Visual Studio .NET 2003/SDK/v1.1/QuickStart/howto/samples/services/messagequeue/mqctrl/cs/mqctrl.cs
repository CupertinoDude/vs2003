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

public class MQCtrl {
    public static void Main(String[] args)
    {
        string appName = Environment.GetCommandLineArgs()[0];

        if ( args.Length != 3 ) {
            Console.WriteLine("Usage: ");
            Console.WriteLine("\t{0} <queue> <command> <value>", appName);
            Console.WriteLine("");
            Console.WriteLine("\t\t<command> =");
            Console.WriteLine("\t\t\tl: change label");
            Console.WriteLine("\t\t\ts: change queue size");
            Console.WriteLine("\t\t\tj: change journal size");
            return;
        }

        string mqPath = ".\\" + args[0];
        if ( !MessageQueue.Exists(mqPath) ) {
            Console.WriteLine("The queue {0} does not exist", mqPath);
            return;
        }

        MessageQueue mq = new MessageQueue(mqPath);

        string command = args[1];

        if ( command == "l" ) {
            mq.Label = args[2];
        } else if ( command == "s" ) {
            mq.MaximumQueueSize = UInt32.Parse(args[2]);
        } else if ( command == "j" ) {
            mq.MaximumJournalSize = UInt32.Parse(args[2]);
        }
    }
}