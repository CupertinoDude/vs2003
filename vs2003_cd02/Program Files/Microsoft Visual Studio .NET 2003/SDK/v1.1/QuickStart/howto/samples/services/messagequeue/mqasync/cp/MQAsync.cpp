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
#using <system.dll>
#using <system.messaging.dll>

using namespace System;
using namespace System::Messaging;


public __gc class MyEventHandler {
public:
	static void OnReceiveCompleted( Object* source, ReceiveCompletedEventArgs* asyncResult ){
		String* strTypeNames[] = { S"System.String, mscorlib" };

		MessageQueue* mq = __try_cast<MessageQueue*>( source );
		Message* m = mq->EndReceive( asyncResult->AsyncResult );
		m->Formatter = new XmlMessageFormatter( strTypeNames );
		Console::WriteLine( String::Concat( S"Message: ", __try_cast<String*>( m->Body ) ) );
		mq->BeginReceive();
	}
};


int main( int argc, char* argv[] ) {
	
	// Args in main signature must be unmanaged - do the conversion here.
	String* args[] = Environment::GetCommandLineArgs();

	if ( argc != 2 ) {
		Console::WriteLine( String::Concat( S"Usage: ", args[0], S" <queue>" ) );
		return -1;
	}

	String* mqPath = String::Concat( S".\\", args[1] );

	if ( !MessageQueue::Exists(mqPath) ) {
		Console::WriteLine( String::Concat( S"The queue '", mqPath, S"' does not exist!" ) );
		return -1;
	}
	else {
		String* strTypeNames[] = { S"System.String, mscorlib" };
		MessageQueue* mq = new MessageQueue(mqPath);

		try {
			__try_cast<XmlMessageFormatter*>( mq->Formatter )->TargetTypeNames = strTypeNames;

			mq->ReceiveCompleted += new ReceiveCompletedEventHandler( mq, MyEventHandler::OnReceiveCompleted );
			mq->BeginReceive();
		}
		catch( InvalidCastException* e ) {
			Console::WriteLine( S"Error: Cast failed." );
			Console::WriteLine( e->Message );
			return -1;
		}
	}

	Console::WriteLine( S"Press Enter to quit the sample" );
	Console::ReadLine();

	return 0;
}