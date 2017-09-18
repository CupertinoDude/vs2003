/*=====================================================================

  File:      AsynceDelegate.cs

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
using System.Runtime.Remoting.Messaging;

// Async delegate
public delegate bool FactorizingCallback(
                                        int factorizableNum, 
                                        ref int primefactor1,
                                        ref int primefactor2);

// Class the factorizers the number
public class PrimeFactorizer
{
    public bool Factorize(
                         int factorizableNum,  
                         ref int primefactor1,
                         ref int primefactor2)
    {
        primefactor1 = 1;
        primefactor2 = factorizableNum;

        // Factorize using a low tech approach
        for (int i=2;i<factorizableNum;i++)
        {
            if (0 == (factorizableNum % i))
            {
                primefactor1 = i;
                primefactor2 = factorizableNum / i;
                break;
            }
        }

        if (1 == primefactor1 )
            return false;
        else
            return true ;
    }
}

// Class that receives a callback when the the results are available
public class ProcessFactorizedNumber
{
    private int _ulNumber;

    public ProcessFactorizedNumber(int number)
    {
        _ulNumber = number;
    }

    // Note the qualifier one-way.
    [OneWayAttribute()]
    public void FactorizedResults(IAsyncResult ar)
    {
        ManualResetEvent mre = (ManualResetEvent )ar.AsyncState;

        int factor1=0, factor2=0; 

        // Extract the delegate from the AsyncResult  
        FactorizingCallback fd = (FactorizingCallback)((AsyncResult)ar).AsyncDelegate;

        // Obtain the result
        fd.EndInvoke(ref factor1, ref factor2, ar);

        // Output results
        Console.WriteLine("On CallBack: Factors of {0} : {1} {2}", 
                          _ulNumber, factor1, factor2);

       mre.Set();
    }
}

// Class that shows variations of using async
public class Simple 
{
    // Async Variation 1
    // The ProcessFactorizedNumber.FactorizedResults callback 
    // is called when the call completes.
    public void FactorizeNumber1()
    {
        // Client code
        PrimeFactorizer pf = new PrimeFactorizer();
        FactorizingCallback fd = new FactorizingCallback(pf.Factorize);

        // Async Variation 1
        int factorizableNum = 1000589023, temp=0; 

        // Create an instance of the class which is going 
        // to called when the call completes
        ProcessFactorizedNumber fc = new ProcessFactorizedNumber(factorizableNum);

        // Define the AsyncCallback delegate
        AsyncCallback cb = new AsyncCallback(fc.FactorizedResults);

        // Can stuff any object as the state object

        ManualResetEvent mre = new ManualResetEvent(false);
        Object someState = mre;

        // Asynchronously invoke the Factorize method on pf
        IAsyncResult ar = fd.BeginInvoke(
                                        factorizableNum, 
                                        ref temp, 
                                        ref temp, 
                                        cb, 
                                        someState); 

        //
        // Do some other useful work
        //. . .

        //
        // Optionally wait until the async callback has completed
        //. . .
        mre.WaitOne(10000, false);
    }

    // Async Variation 2
    // Waits for the result
    public void FactorizeNumber2()
    {
        // Client code
        PrimeFactorizer pf = new PrimeFactorizer();
        FactorizingCallback fd = new FactorizingCallback(pf.Factorize);

        // Async Variation 1
        int factorizableNum = 1000589023, temp=0; 

        // Create an instance of the class which is going 
        // to called when the call completes
        ProcessFactorizedNumber fc = new ProcessFactorizedNumber(factorizableNum);

        // Define the AsyncCallback delegate
        AsyncCallback cb = 
        new AsyncCallback(fc.FactorizedResults);

        // Can stuff any object as the state object
        Object state = new Object();

        // Asynchronously invoke the Factorize method on pf
        IAsyncResult ar = fd.BeginInvoke(
                                        factorizableNum, 
                                        ref temp, 
                                        ref temp, 
                                        null, 
                                        null); 

        ar.AsyncWaitHandle.WaitOne(10000, false);

        if (ar.IsCompleted)
        {
            int factor1=0, factor2=0; 

            // Obtain the result
            fd.EndInvoke(ref factor1, ref factor2, ar);

            // Output results

            Console.WriteLine("Sequential : Factors of {0} : {1} {2}", 
                              factorizableNum, factor1, factor2);

        }
    }


    public static void Main(String[] args)
    {
        Simple simple = new Simple();
        simple.FactorizeNumber1();
        simple.FactorizeNumber2();
    }
}



