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

// object.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Threading;

namespace RemotingSamples 
{
	__gc public class HelloServer : public MarshalByRefObject
	{
	private:
		static int mCounter = 0;

	public:
		HelloServer()
		{
			Console::WriteLine("HelloServer activated");
		}

		String* HelloMethod(String* name)
		{
			Console::WriteLine("Hello.HelloMethod : {0}", name);
			return String::Format("Hi there {0}", name);
		}

		int CountMe()
		{
			Monitor::Enter(this);
			mCounter++;
			Monitor::Exit(this);

			return mCounter;
		}
	};
}