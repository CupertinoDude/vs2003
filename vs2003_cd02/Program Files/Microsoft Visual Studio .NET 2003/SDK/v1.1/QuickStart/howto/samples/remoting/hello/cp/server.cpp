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

void main()
{
	TcpChannel* chan = new TcpChannel(8085);
	ChannelServices::RegisterChannel(chan);
	RemotingConfiguration::RegisterWellKnownServiceType(Type::GetType(S"RemotingSamples.HelloServer,Object"), S"SayHello", WellKnownObjectMode::SingleCall);
	Console::WriteLine(S"Hit <enter> to exit...");
	Console::ReadLine();
}
