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

// server.cpp

#using <mscorlib.dll>
using namespace System;

#using <System.Runtime.Remoting.dll>
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;
using namespace System::Runtime::Remoting::Channels::Http;

#using "object.dll"
using namespace RemotingSamples;

void main()
{
	TcpChannel* chan1 = new TcpChannel(8085);
	HttpChannel* chan2 = new HttpChannel(8086);
	ChannelServices::RegisterChannel(chan1);
	ChannelServices::RegisterChannel(chan2);
	RemotingConfiguration::RegisterWellKnownServiceType(__typeof(HelloServer), S"SayHello", WellKnownObjectMode::Singleton);
	Console::WriteLine(S"Hit <enter> to exit...");
	Console::ReadLine();
}
