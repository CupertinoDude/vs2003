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
using System.Text.RegularExpressions;

namespace Samples {
    public class RegExMatcherMulti {
        public static void Main(String[] args){
            Regex digitregex = new Regex("(?<number>\\d+)");
            String s = "abc 123 def 456 ghi 789";

            if ( args.Length > 0 ) {
                s = String.Join(" ", args);
            }

            MatchCollection mc = digitregex.Matches(s);

            if ( mc.Count > 0 ) {
                System.Console.WriteLine("Digits:");
                foreach (Match m in mc) {
                    System.Console.WriteLine("  " + m.Value);
                }
            } else {
                System.Console.WriteLine("[" + s + "] contains no numbers.");
            }

            System.Console.WriteLine();
            System.Console.WriteLine("Press Enter to Continue...");
            System.Console.ReadLine();
        }
    }
}