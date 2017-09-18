/*=====================================================================

  File:      AsynceDelegate2.cs

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
using System.Threading;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Contexts;
using System.Runtime.Remoting.Messaging;

//
// Context-Bound type with Synchronization Context Attribute
//
[Synchronization()]
public class Wak : ContextBoundObject
{
    //
    // A method that does some work
    //
    public int Pat(int i)
    {
        Console.WriteLine("Hash: {0} Wak Pat", Thread.CurrentThread.GetHashCode());
        return i*2;
    }
};

//
// Async delegate
//
public delegate  int WakPatDelegate(int i);

public class Simple 
{
    //
    // Asynchronous Callback method
    //
    public static void SomeMethod(IAsyncResult ar)
    {
        // Obtain value from AsyncState object
        int value = Convert.ToInt32(ar.AsyncState);

        // Obtain results via EndInvoke
        int result = ((WakPatDelegate)((AsyncResult)ar).AsyncDelegate ).EndInvoke(ar);

        Console.WriteLine("Simple.SomeMethod (AsyncCallback): Result of {0} in Wak.Pak is {1} ",value, result);
    }

    public static void Main(String[] args)
    {
        Console.WriteLine("Thread Simple Context Sample");
        Console.WriteLine("");

        Console.WriteLine("Make an instance of a context-bound type Wak");
        Wak oWak = new Wak();

        if (RemotingServices.IsTransparentProxy(oWak))
            Console.WriteLine("oWak Is a Proxy");
        else
            Console.WriteLine("oWak Is NOT a Proxy");

        int value=0;
        int result=0;

        Console.WriteLine("Make a sync call on the object");
        value = 10;
        result = oWak.Pat(value);
        Console.WriteLine("Result of {0} in Wak.Pak is {1} ",value, result);

        Console.WriteLine("Make single Async call on Context-bound object");
        WakPatDelegate wpD1 = new WakPatDelegate(oWak.Pat);
        value = 20;
        IAsyncResult ar1 = wpD1.BeginInvoke(value,null,null);

        //
        //Wait for the call to complete
        //
        ar1.AsyncWaitHandle.WaitOne();
        result = wpD1.EndInvoke(ar1);
        Console.WriteLine("Result of {0} in Wak.Pak is {1} ",value, result);

        Console.WriteLine("Make single Async call on Context-bound object - use AsyncCallback and StateObject");
        WakPatDelegate wpD2 = new WakPatDelegate(oWak.Pat);
        value = 30;
        IAsyncResult ar2 = wpD2.BeginInvoke(
                                           value,
                                           new AsyncCallback(Simple.SomeMethod),
                                           value
                                           );

        Console.WriteLine("Make multiple Async calls on Context-bound object");
        int asyncCalls = 5;
        IAsyncResult[] ars = new IAsyncResult[asyncCalls];
        WaitHandle[] whs = new WaitHandle[asyncCalls];
        int[] values = new int[asyncCalls];
        WakPatDelegate wpD3 = new WakPatDelegate(oWak.Pat);

        for (int i=0; i < asyncCalls; i++)
        {
            values[i] = i;
            ars[i] = wpD3.BeginInvoke(values[i],null,null);
            whs[i] = ars[i].AsyncWaitHandle;
        }

        // Give them 1000ms to complete
        WaitHandle.WaitAll(whs,1000, false);

        for (int i=0; i < asyncCalls; i++)
        {
            result = wpD3.EndInvoke(ars[i]);
            Console.WriteLine("Result of {0} in Wak.Pak is {1} ",values[i], result);
        }

        Console.WriteLine("");
        Console.WriteLine("Done");
    }
}




