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
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;
using namespace System::Runtime::Remoting::Channels::Http;

#using "object.dll"
using namespace RemotingSamples;

namespace RemotingSamples 
{
	__gc public class Client
	{
	public:
		Thread* thread1;
		Thread* thread2;

	public:
		Client()
		{
			thread1 = new Thread(new ThreadStart(this, &Client::RunMe));
			thread2 = new Thread(new ThreadStart(this, &Client::RunMe));

			thread1->Start();
			thread2->Start();
		}

		void RunMe()
		{
			if (Thread::CurrentThread == thread1)
			{
				HttpChannel* chan = new HttpChannel();
				ChannelServices::RegisterChannel(chan);
				Console::WriteLine(S"I am thread one");
				HelloServer* obj = __try_cast<HelloServer *>(Activator::GetObject(__typeof(HelloServer), S"http://localhost:8086/SayHello"));
				for (int i = 0; i < 1000; i++)
				{
					Console::WriteLine(String::Concat((obj->CountMe()).ToString(), S" - from thread 1 "));
					Thread::Sleep(0);
				}
			}
			else 
				if (Thread::CurrentThread == thread2) 
				{
					TcpChannel* chan = new TcpChannel();
					ChannelServices::RegisterChannel(chan);
					Console::WriteLine(S"I am thread two");
					HelloServer* obj = __try_cast<HelloServer *>(Activator::GetObject(__typeof(HelloServer), S"tcp://localhost:8085/SayHello"));
					for (int i = 0; i < 1000; i++) 
					{
						Console::WriteLine(String::Concat((obj->CountMe()).ToString(), S" - from thread 2 "));
						Thread::Sleep(0);
					}
				}
		}
	};
}

void main(void)
{
	Client* cl = new Client();
}











