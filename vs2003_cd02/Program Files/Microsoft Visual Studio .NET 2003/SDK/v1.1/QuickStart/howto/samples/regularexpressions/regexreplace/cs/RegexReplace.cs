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
    public class RegExMatcher {
        public static void Main(String[] args){
            Regex digitregex = new Regex("(?<digit>[0-9])");
            String before = "Here is so4848me te88xt with emb4493edded numbers.";
            
            if ( args.Length > 0 ) {
                before = String.Join(" ", args);
            }
            
            String after = digitregex.Replace(before, "");            

            System.Console.WriteLine("Before: " + before);
            System.Console.WriteLine("After : " + after);

            System.Console.WriteLine();
            System.Console.WriteLine("Press Enter to Continue...");
            System.Console.ReadLine();
        }
    }
}