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
using namespace System::Threading;

#using <System.Runtime.Remoting.dll>
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Messaging;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;

#using "object.dll"
using namespace RemotingSamples;

__gc public class Client 
{
public:
	static ManualResetEvent* e;
    __delegate String* MyDelegate(String* name);

public:
	Client()
	{
		e = new ManualResetEvent(false);

		TcpChannel* chan = new TcpChannel();
		ChannelServices::RegisterChannel(chan);
		HelloServer* obj = __try_cast<HelloServer *>(Activator::GetObject(__typeof(RemotingSamples::HelloServer), S"tcp://localhost:8085/SayHello"));
		if (obj)
		{
			AsyncCallback* cb = new AsyncCallback(this, &(Client::MyCallBack));
			MyDelegate* d = new MyDelegate(obj, &(HelloServer::HelloMethod));
			IAsyncResult* ar = d->BeginInvoke(S"Caveman", cb, 0);
		}
		else 
			Console::WriteLine(S"Could not locate server");

		e->WaitOne();
	}

	static void MyCallBack(IAsyncResult* ar)
	{
		MyDelegate* d = __try_cast<MyDelegate *>(__try_cast<AsyncResult *>(ar)->AsyncDelegate);
		Console::WriteLine(d->EndInvoke(ar));
		e->Set();
	}
};

void main()
{
	Client* cl = new Client();
}
