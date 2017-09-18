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

#using "parser\parser.dll"
// using namespace Parser;

#using "calcrv6\calcr.dll"
using namespace Calculator;

[assembly:AssemblyVersion("6.0.0.0")];

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
			Calc* c = new Calc();
			
			Console::WriteLine(c->GetResult(Convert::ToInt32(a->Arg1), a->Op, Convert::ToInt32(a->Arg2)));
		} 
		catch (Exception* e) 
		{
			Console::WriteLine("Invalid Formula entered.  Valid formulas consist of");
			Console::WriteLine("two numbers and one operator.  For example, 5 * 5");
			Console::WriteLine(e->Message);
		}
	}
}