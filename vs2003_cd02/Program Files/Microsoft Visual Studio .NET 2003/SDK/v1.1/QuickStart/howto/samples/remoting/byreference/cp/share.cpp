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

// share.cpp

#using <mscorlib.dll>
using namespace System;

namespace RemotingSamples 
{
	__gc public class ForwardMe : public MarshalByRefObject
	{
	public:
		void CallMe(String* text)
		{
			Console::WriteLine(text);
		}
	};
	
	__gc public class HelloServer : public MarshalByRefObject
	{
	public:
		HelloServer()
		{
			Console::WriteLine("HelloServer activated");
		}

		String* HelloMethod(String* name, ForwardMe* obj)
		{
			obj->CallMe("Regards from the server");
			Console::WriteLine("Hello.HelloMethod : {0}", name);
			return String::Concat("Hi there ", name);
		}
	};
}