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

// calcr.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Reflection;

[assembly:AssemblyKeyFile("..\\MathKey.snk")];
[assembly:AssemblyVersion("6.0.0.0")];

namespace Calculator 
{
	__gc public class Calc 
	{
	public:
		String* GetResult(Int32 arg1, Char op, Int32 arg2)
		{
			switch(op) 
			{
				case '+':
					return String::Format("Result: {0:####}", (arg1 + arg2).ToString());
				case '-':
					return String::Format("Result: {0:####}", (arg1 - arg2).ToString());
				case '*':
					return String::Format("Result: {0:####}", (arg1 * arg2).ToString());
				case '/':
					return String::Format("Result: {0:####}", (arg1 / arg2).ToString());
				default:
					return String::Concat("Invalid operator: ", op.ToString());
			}
		}
	};
}