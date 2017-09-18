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

#using <mscorlib.dll>
#using <system.dll>
#using <system.messaging.dll>

using namespace System;
using namespace System::Messaging;

void main( int argc, char* argv[] ) {

	// Args in main signature must be unmanaged - do the conversion here.
	String* args[] = Environment::GetCommandLineArgs();

	if ( argc != 4 ) {
		Console::WriteLine(S"Usage: ");
		Console::WriteLine(String::Concat( S"\t", args[0], S" <queue> <command> <value>" ));
		Console::WriteLine(S"" );
		Console::WriteLine(S"\t\t<command> =");
		Console::WriteLine(S"\t\t\tl: change label");
		Console::WriteLine(S"\t\t\ts: change queue size");
		Console::WriteLine(S"\t\t\tj: change journal size");
		return;
	}

	String* mqPath = String::Concat( S".\\", args[1] );
	if ( !MessageQueue::Exists(mqPath) ) {
		Console::WriteLine( String::Concat( S"The queue ", mqPath, S" does not exist" ) );
		return;
	}

	MessageQueue* mq = new MessageQueue(mqPath);

	String* command = args[2];

	if ( command->Equals( S"l" ) ) {
		mq->Label = args[3];
	} else if ( command->Equals( S"s" ) ) {
		mq->MaximumQueueSize = UInt32::Parse(args[3]);
	} else if ( command->Equals( S"j" ) ) {
		mq->MaximumJournalSize = UInt32::Parse(args[3]);
	}
    
	return;
}