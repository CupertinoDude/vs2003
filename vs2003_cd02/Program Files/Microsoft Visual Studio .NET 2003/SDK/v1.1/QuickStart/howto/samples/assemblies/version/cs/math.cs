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
using System.Reflection;
using Samples.Math.Calculator;
using Samples.Math.Parser;

[assembly:AssemblyVersion("5.0.0.0")]
public class Math {
    public static void Main(string[] args) {

        while (true) {
            Console.WriteLine("Enter Formula: (or q to quit)");
            String formula = Console.ReadLine();

            if (formula == "q" || formula == "Q") break;

            // parse the formula and get the arguments
            Parser p = new Parser();

            try {
                Arguments a = p.Parse(formula);
                Int32 arg1 = Convert.ToInt32(a.Arg1);
                Int32 arg2 = Convert.ToInt32(a.Arg2);

                // do the calc and print the results
                Calc c = new Calc();
                Console.WriteLine(c.GetResult(arg1, a.Op, arg2));
            } catch(Exception) {
                Console.WriteLine("Invalid Formula entered.  Valid formulas consist of");
                Console.WriteLine("two numbers and one operator.  For example, 5 * 5");
            }
        }
    }
}