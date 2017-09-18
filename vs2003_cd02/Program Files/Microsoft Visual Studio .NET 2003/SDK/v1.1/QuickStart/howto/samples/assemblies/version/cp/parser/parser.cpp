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

// parser.cpp

#using <mscorlib.dll>
using namespace System;

namespace Parser
{
	__gc public class Arguments
	{
	private:
		String* m_arg1;
		Char   m_op;
		String* m_arg2;

	public:
		__property String* get_Arg1()
		{
			return m_arg1;
		}
		__property void set_Arg1(String* value)
		{
			m_arg1 = value;
		}

		__property Char get_Op()
		{
			return m_op;
		}
		__property void set_Op(Char value)
		{
			m_op = value;
		}

		__property String* get_Arg2()
		{
			return m_arg2;
		}
		__property void set_Arg2(String* value)
		{
			m_arg2 = value;
		}
	};

	__gc public class Parser 
	{
	public:
		Arguments* Parse(String* formula) 
		{
			Arguments* args = new Arguments();

			// get the first arg
			Char opsAndSpace[] = {' ','+','-','*','/'};

			int pos = formula->IndexOfAny(opsAndSpace);
			args->Arg1 = formula->Substring(0, pos);
			args->Arg2 = args->Arg1;

			// skip whitespace to get to the operator
			while (formula->get_Chars(pos) == ' ') 
			{
				pos++;
			}

			// get the operator
			args->Op = Convert::ToChar(formula->Substring(pos, 1));

			// skip whitespace to get to the second arg
			pos++;
			while (formula->get_Chars(pos) == ' ') 
			{
				pos++;
			}

			// get the second arg
			args->Arg2 = formula->Substring(pos);

			return args;
		}
	};
}