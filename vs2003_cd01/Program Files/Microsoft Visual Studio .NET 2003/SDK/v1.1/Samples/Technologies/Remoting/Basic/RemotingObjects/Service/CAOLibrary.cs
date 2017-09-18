/*=====================================================================

  File:      CAOLibrary.cs

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

namespace CAOLibrary
{
    // Counter is a Client Activated Object that:
    // * Is exported in the remoting configuration file
    // * Has a Constructor with parameters
    // * Has a public Property that can set and get
    // * has fields in which state is stored between calls
    // * Has methods that can be called to change the state
    // * Has overloaded methods
    // * The above elements of the CAO are remoted over SOAP

    public class Counter : MarshalByRefObject
    {
        public String name = "";
        private int totalNumber = 0;

        public Counter(String _name)
        {
            Console.WriteLine("Zap({0})", _name);
            name = _name;
        }

        // public property
        public int TotalNumber
        {
            get 
            {
                Console.WriteLine("TotalNumber: {0}", totalNumber);
                return totalNumber;
            }

            set
            {
                lock(this)
                {
                    totalNumber = value;
                    Console.WriteLine("TotalNumber: {0}", totalNumber);
                }
            }
        }

     	// Changes the in memory state
        public bool DoWorkWithNumber(int number)
        {
            lock(this)
            {
                Console.WriteLine("Change: {0}", number);
                totalNumber += number;
                Console.WriteLine("Total:  {0}", totalNumber);
            }

            return true;
        }

        public bool DoWorkWithNumbers(int[] numbers)
        {
          foreach(int num in numbers)
          {
            DoWorkWithNumber(num);
          }

          return true;
        }

        public bool DoWorkWithNumbers(String[] numbers)
        {
          foreach(String str in numbers)
          {
            int num = Convert.ToInt32(str);
            DoWorkWithNumber(num);
          }

          return true;
        }

    }
}
