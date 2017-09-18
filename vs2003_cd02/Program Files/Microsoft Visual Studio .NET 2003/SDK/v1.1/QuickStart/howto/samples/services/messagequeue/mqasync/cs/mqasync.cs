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
using System.Threading;

public class MQReceive {
    public static void Main(String[] args)
    {
        string appName = Environment.GetCommandLineArgs()[0];

        if ( args.Length != 1 ) {
            Console.WriteLine("Usage: {0} <queue>", appName);
            return;
        }

        string mqPath = ".\\" + args[0];

        if ( !MessageQueue.Exists(mqPath) ) {
            Console.WriteLine("The queue '{0}' does not exist!", mqPath);
        }
        else {
            MessageQueue mq = new MessageQueue(mqPath);
            ((XmlMessageFormatter)mq.Formatter).TargetTypeNames = new string[]{"System.String,mscorlib"};

            mq.ReceiveCompleted += new ReceiveCompletedEventHandler(OnReceiveCompleted);
            mq.BeginReceive();
        }

        Console.WriteLine("Press Enter to quit the sample");
        Console.ReadLine();
    }

    public static void OnReceiveCompleted(Object source, ReceiveCompletedEventArgs asyncResult){
        MessageQueue mq = (MessageQueue)source;
        Message m = mq.EndReceive(asyncResult.AsyncResult);
        m.Formatter = new XmlMessageFormatter(new string[]{"System.String, mscorlib"});
        Console.WriteLine("Message: {0}", (string)m.Body);
        mq.BeginReceive();
    }
}