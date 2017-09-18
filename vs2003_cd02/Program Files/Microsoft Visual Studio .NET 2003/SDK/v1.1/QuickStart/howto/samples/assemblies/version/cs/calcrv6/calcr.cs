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

[assembly:AssemblyKeyFile("..\\MathKey.snk")]
[assembly:AssemblyVersion("6.0.0.0")]

namespace Samples.Math.Calculator {
    public class Calc {
        public String GetResult(int arg1, Char op, int arg2) {
            switch(op) {
                case '+':
                    return String.Format("Result: {0:G}", arg1 + arg2);
                case '-':
                    return String.Format("Result: {0:G}", arg1 - arg2);
                case '*':
                    return String.Format("Result: {0:G}", arg1 * arg2);
                case '/':
                    return String.Format("Result: {0:G}", arg1 / arg2);
                default:
                    return "Invalid operator: "+ op;
            }
        }
    }
}