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
using System.IO;
using System.Text;
using System.Runtime.Remoting;
using System.Security.Policy;
using System.Threading;

using CAOLibrary;

public class Client
{
    public static int Main(string[] args)
    {
        bool result = true;
        int totalNumber = 0;

        // Load the Http Channel from the config file
        RemotingConfiguration.Configure("Client.exe.config");

        Counter counterPiet = new Counter("Piet");

        // Retrieve the name from the activated object
        Console.WriteLine("Count.name: " + counterPiet.name);

        // Perform a series of calls on the object
        for (int i=0; i < 3; i++)
        {
            Console.WriteLine("counterPiet.DoWorkWithNumber (100)");
            result = counterPiet.DoWorkWithNumber(100);
            totalNumber = counterPiet.TotalNumber;
            Console.WriteLine("After DoWorkWithNumber Total Number is {0}\n", totalNumber);
        }

        Counter counterJohn = new Counter("John");

        // Retrieve the name from the activated object
        Console.WriteLine("Counter.name: " + counterJohn.name);

        // Perform a series of calls on the object
        for (int i=0; i < 3; i++)
        {
            Console.WriteLine("counterJohn.DoWorkWithNumber (50)");
            result = counterJohn.DoWorkWithNumber(50);
            totalNumber = counterJohn.TotalNumber;
            Console.WriteLine("After DoWorkWithNumber Total Number is {0}\n", totalNumber);
        }

        Counter counterBill = new Counter("Bill");

        // Retrieve the name from the activated object
        Console.WriteLine("Counter.name: " + counterBill.name);

        counterBill.TotalNumber = 1000;

        int[] numbers = {50, 25, 100};	

        Console.WriteLine("counterBill.DoWorkWithNumbers ({0})", numbers);
        result = counterBill.DoWorkWithNumbers(numbers);
        totalNumber = counterBill.TotalNumber;
        Console.WriteLine("After DoWorkWithNumbers Total Number is {0}\n", totalNumber);

        String[] strNumbers = {"15", "45", "5"};

        Console.WriteLine("counterBill.DoWorkWithNumbers ({0})", strNumbers);
        result = counterBill.DoWorkWithNumbers(strNumbers);
        totalNumber = counterBill.TotalNumber;
        Console.WriteLine("After DoWorkWithNumbers Total Number is {0}\n", totalNumber);

        return 0;
    }
}

