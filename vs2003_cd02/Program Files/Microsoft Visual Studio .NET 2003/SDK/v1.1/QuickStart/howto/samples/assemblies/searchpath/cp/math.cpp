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

// math.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Reflection;

#using "bin\parser.dll"

[assembly:AssemblyVersionAttribute("1.0.0.0")];

namespace Parser
{
	__gc public class Math
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

void main()
{
	while (true) 
	{
		Console::WriteLine("Enter a simple formula. Ex: 4+4: (or q to quit)");
		String* formula = Console::ReadLine();

		if (formula->Equals("q") == true)
			break;

		// parse the formula and get the arguments
		Parser::Parser* p = new Parser::Parser();
		try 
		{
			Parser::Arguments* a = p->Parse(formula);
			
			// do the calc and print the results
			Parser::Math* m = new Parser::Math();
			
			Console::WriteLine(m->GetResult(Convert::ToInt32(a->Arg1), a->Op, Convert::ToInt32(a->Arg2)));
		} 
		catch (Exception* e) 
		{
			Console::WriteLine(e->Message);
		}
	}
}