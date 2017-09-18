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

// CustomReader: Implement the interface IResourceReader.
// CustomManager: Sub-class ResourceManager and create
// ResourceSets using the CustomReader class.
//

#using <mscorlib.dll>

using namespace System;
using namespace System::Collections;
using namespace System::Globalization;
using namespace System::Resources;


public __gc class CustomReader : public IResourceReader
{
public:

	void IResourceReader::Close()
    {
    // Close any open files, DB connections, etc here.
    }

	IEnumerator* IEnumerable::GetEnumerator() {
		return __try_cast<IEnumerator*>( __try_cast<IResourceReader*>( this )->GetEnumerator() );
	}

	IDictionaryEnumerator* IResourceReader::GetEnumerator()
    {
		Hashtable* dict = new Hashtable;

		dict->Add( S"key1", S"value 1" );
		dict->Add( S"key2", S"value 2" );
		dict->Add( S"key3", S"value 3" );

		return dict->GetEnumerator();
    }

	void IDisposable::Dispose()
    {
    }

};

public __gc class CustomManager : public ResourceManager
{
protected:

	ResourceSet* InternalGetResourceSet( CultureInfo* culture,
										__value bool createIfNotExists,
										__value bool tryParents )
    {
		return new ResourceSet( new CustomReader );
    }
};

void main( void )
{
	ResourceManager* resourceManager = new CustomManager;
	Console::WriteLine( String::Concat( S"Lookup for key1 yields: ", resourceManager->GetString( S"key1" ) ) );
	Console::WriteLine( S"\r\nPress Return to exit." );
	Console::Read();
}
