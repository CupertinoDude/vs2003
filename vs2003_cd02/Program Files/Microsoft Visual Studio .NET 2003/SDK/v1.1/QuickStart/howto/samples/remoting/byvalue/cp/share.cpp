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
using namespace System::Runtime::Remoting;

namespace RemotingSamples
{
	[Serializable]
	__gc public class ForwardMe
	{
	private:
		int mValue;

	public:
		ForwardMe()
		{
			mValue = 1;
		}

		void CallMe()
		{
			mValue++;
		}

		int getValue()
		{
			return mValue;
		}
	};
	
	__gc public class HelloServer : public MarshalByRefObject
	{
	public:
		HelloServer()
		{
			Console::WriteLine("HelloServer activated");
		}

		ForwardMe* HelloMethod(ForwardMe* obj)
		{
			for (int i=0; i < 5; i++)
				obj->CallMe();
		
			return obj;
		}
	};
}