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
using namespace System::Collections;

#using <System.Runtime.Remoting.dll>
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;
using namespace System::Runtime::Serialization::Formatters::Binary;
using namespace System::Runtime::Serialization::Formatters;

#ifndef NULL
#define NULL 0
#endif

void main()
{
	// creating a custom formatter for your TcpChannel sink chain.
	BinaryServerFormatterSinkProvider* provider = new BinaryServerFormatterSinkProvider();
	provider->TypeFilterLevel = TypeFilterLevel::Full;

	// creating the dictionary to set the port on the channel instance.
	Hashtable* props = new Hashtable();
	props->set_Item(S"port", __box(8085));

	// pass the props for the port setting and the server provider in the server chain argument. (Client remains null here.)
	TcpChannel* chan = new TcpChannel(props, NULL, provider);
	ChannelServices::RegisterChannel(chan);
	RemotingConfiguration::RegisterWellKnownServiceType(Type::GetType(S"RemotingSamples.HelloServer,Share"), S"SayHello", WellKnownObjectMode::SingleCall);

	Console::WriteLine(S"Hit <enter> to exit...");
	Console::ReadLine();
}
