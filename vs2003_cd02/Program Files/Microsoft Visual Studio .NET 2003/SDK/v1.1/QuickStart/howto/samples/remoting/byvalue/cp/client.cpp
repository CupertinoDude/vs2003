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

// client.cpp

#using <mscorlib.dll>
using namespace System;

#using <System.Runtime.Remoting.dll>
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;

#using "share.dll"
using namespace RemotingSamples;

void main()
{
	TcpChannel* chan = new TcpChannel();
	ChannelServices::RegisterChannel(chan);
	ForwardMe* param = new ForwardMe();
	HelloServer* obj = __try_cast<HelloServer *>(Activator::GetObject(__typeof(RemotingSamples::HelloServer), S"tcp://localhost:8085/SayHello"));
	if (obj)
	{
		Console::WriteLine(String::Concat(S"The value is ", (param->getValue()).ToString()));
        ForwardMe* after = obj->HelloMethod(param);
		Console::WriteLine(String::Concat(S"The value after the call is ", (after->getValue()).ToString()));
	}
	else 
		Console::WriteLine(S"Could not locate server");
}
