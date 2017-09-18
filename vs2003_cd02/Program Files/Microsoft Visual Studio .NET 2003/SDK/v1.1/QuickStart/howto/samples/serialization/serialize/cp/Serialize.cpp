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

using namespace System;
using namespace System::IO;
using namespace System::Collections;
using namespace System::Runtime::Serialization;
using namespace System::Runtime::Serialization::Formatters::Binary;

int main( void ) {

	Console::WriteLine( S"Create object graph" );

	ArrayList* l = new ArrayList;
	for( int x = 0; x < 10; x++ ) {
		Console::WriteLine( x );
		l->Add( __box(x) );
	} // end for

	Console::Write( S"Serializing object graph to disk.." );

	Stream* s = File::Open( S"foo.bin", FileMode::Create, FileAccess::Write );
	BinaryFormatter* b = new BinaryFormatter;
	b->Serialize( s, l );
	s->Close();

	Console::WriteLine( S"Complete." );
	Console::Write ("Deserializing object graph from disk..");

	Stream* r = File::Open( S"foo.bin", FileMode::Open, FileAccess::Read );
	BinaryFormatter* c = new BinaryFormatter;
	ArrayList* p;
	try {
		p = __try_cast<ArrayList*>( c->Deserialize( r ) );
	}
	catch( InvalidCastException* ) {
		Console::WriteLine( S"Error: Cast failed." );
		return -1;
	}

	Console::WriteLine( S"Complete." );
	for( int x = 0; x < p->Count; x++ ) {
		Console::WriteLine( p->Item[x] );
	} // end for

	r->Close();

	Console::WriteLine( S"\r\nPress Return to exit." );
	Console::Read();

    return 0;
} // end main