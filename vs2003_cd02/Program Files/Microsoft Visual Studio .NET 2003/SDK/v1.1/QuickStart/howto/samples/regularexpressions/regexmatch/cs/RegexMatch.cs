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
            Regex emailregex = new Regex("(?<user>[^@]+)@(?<host>.+)");
            String s = "johndoe@tempuri.org";

            if ( args.Length > 0 ) {
                s = args[0];
            }

            Match m = emailregex.Match(s);

            if ( m.Success ) {
                System.Console.WriteLine("User: " + m.Groups["user"].Value);
                System.Console.WriteLine("Host: " + m.Groups["host"].Value);
            } else {
                System.Console.WriteLine(s + " is not a valid email address");
            }

            System.Console.WriteLine();
            System.Console.WriteLine("Press Enter to Continue...");
            System.Console.ReadLine();
        }
    }
}