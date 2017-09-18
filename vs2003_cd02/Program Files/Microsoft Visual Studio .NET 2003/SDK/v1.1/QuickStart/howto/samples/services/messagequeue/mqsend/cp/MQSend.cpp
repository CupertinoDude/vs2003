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

// This is the main project file for VC++ application project 
// generated using an Application Wizard.

#using <mscorlib.dll>
#using <system.messaging.dll>
#using <system.dll>

using namespace System;
using namespace System::Messaging;

int main(int argc, char* argv[])
{

	// Args in main signature must be unmanaged - do the conversion here.
	String* args[] = Environment::GetCommandLineArgs();

	if(argc != 3) {
		Console::WriteLine( String::Concat( S"Usage: ", args[0], S" <queue> <message>" ) );
	} else {
		String* mqPath = String::Concat( S".\\", args[1] );
		if(!MessageQueue::Exists(mqPath)) {
			MessageQueue::Create(mqPath);
		}

		MessageQueue* mq = new MessageQueue(mqPath);
		mq->Send(args[2]);
	}

	Console::WriteLine();
	Console::WriteLine("Press Enter to continue...");
	Console::ReadLine();

	return 0;
}