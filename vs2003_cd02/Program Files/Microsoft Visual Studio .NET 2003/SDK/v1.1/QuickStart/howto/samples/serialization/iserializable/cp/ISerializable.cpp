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
#using <System.Runtime.Serialization.Formatters.Soap.dll>

using namespace System;
using namespace System::IO;
using namespace System::Diagnostics;
using namespace System::Reflection;
using namespace System::Runtime::Serialization;
using namespace System::Runtime::Serialization::Formatters::Binary;
using namespace System::Runtime::Serialization::Formatters::Soap;
using namespace System::Text;
using namespace System::Collections;

#ifndef NULL
#define NULL 0
#endif

// TreeNode class
[Serializable] public __gc class TreeNode : public ISerializable {
private:
	Object* value;
	ArrayList* children;

private:
	TreeNode( SerializationInfo* info, StreamingContext c ) {
		value = info->GetValue( S"value", __typeof(Object) );
		children = new ArrayList;
		Object* o;

		for( int i = 1; i < info->MemberCount; i++ ) {
			o = info->GetValue( i.ToString(), __typeof(Object) );
			children->Add(o);
        }
    }

	void PrintTree( TextWriter* output, int offset ) {
		StringBuilder* sb1 = new StringBuilder;
		StringBuilder* sb2 = new StringBuilder;
		for( int i = 0; i < offset-1; i++ ) {
			sb1->Append(S" ");
			sb1->Append(S"|");
			sb2->Append(S" ");
			sb2->Append(S"|");
		}
		if( offset >=1 ) {
			sb1->Append(S" ");
			sb1->Append(S"+-");
			sb2->Append(S" ");
			sb2->Append(S"|");
		}
		output->WriteLine( S"{0}", sb2 );
		output->WriteLine( S"{0}{1}", sb1, value );
		for( int i = 0; i < children->Count; i++ ) {
			try {
				__try_cast<TreeNode*>( children->Item[i] )->PrintTree( output, offset+1 );
			}
			catch( InvalidCastException* e ) {
				e = new InvalidCastException( S"Error: Cast failed in TreeNode::PrintTree." );
				throw e;
			}
		}
	}

public:
	TreeNode( Object* val ) {
		if( val == NULL ) throw new Exception( "val must not be null" );
		value = val;
		children = new ArrayList();
	}

	__property Object* get_Value() {
		return value;
	}

    void AddChild( TreeNode* child ) {
        if( !children->Contains(child) )
            children->Add(child);
    }

	// Override ISerializable::GetObjectData
	void GetObjectData( SerializationInfo* info, StreamingContext context ) {
        if( value == NULL ) info->AddValue( S"value", S"NULL" );
		else info->AddValue( S"value", String::Concat( value->ToString(), S"(SAVED)" ) );

		Object* o;
		for( int n = 0; n < children->Count; n++ ) {
			o = children->Item[n];
			if( o == NULL ) continue;
            info->AddValue( (n+1).ToString(), o);
        }
    }

    TreeNode* Find( Object* val ) {
		if( val == NULL ) throw new Exception( S"val must not be null" );
		if( value->Equals(val) ) return this;

		TreeNode* w;
		for( int n = 0; n < children->Count; n++ ) {
			try {
				w = __try_cast<TreeNode*>( children->Item[n] )->Find( val );
			}
			catch( InvalidCastException* e ) {
				e = new InvalidCastException( S"Error: Cast failed." );
				throw e;
			}

			if( w != NULL ) return w;
		}
		return NULL;
	}

	// Override Object::Equals()
	bool Equals( Object* obj ) {
		if( obj->GetType() != __typeof( TreeNode ) ) return false;
		TreeNode* t = dynamic_cast<TreeNode*>( obj );
		return( t->value->Equals( this->value ) );
    }

	// Override Object::ToString()
    String* ToString() {
        return value->ToString();
    }

	void PrintTree( TextWriter* output ) {
		PrintTree( output, 0 );
	}

};

// main helper function
void FillTree( TreeNode* node ) {
	Type* types[] = __typeof( Object )->Module->Assembly->GetTypes();
	node->AddChild( new TreeNode( __typeof( Object )->FullName ) );

	for( int i = 0; i < types->Length; i++ ) {
		if( types[i]->BaseType == NULL ) continue;
		if( !types[i]->IsPublic ) continue;
		TreeNode* n = node->Find( types[i]->BaseType->FullName );
		if( n != NULL ) n->AddChild( new TreeNode( types[i] ) );
	}
}

int main( void ) {

	Console::WriteLine( S"Create object graph" );
	TreeNode* node = new TreeNode( S"" );
	FillTree( node );
	try {
		node->PrintTree( Console::Out );
	}
	catch( InvalidCastException* e ) {
		Console::WriteLine( e->Message );
		return -1;
	}

	Console::Write( S"Serializing object graph to disk.." );
	Stream* s = File::Open( S"foo.xml", FileMode::Create, FileAccess::Write );
	SoapFormatter* b = new SoapFormatter;
	b->Serialize( s, node );
	s->Close();
	Console::WriteLine( S"Complete." );

	Console::Write( S"Deserializing object graph from disk.." );
	Stream* r = File::Open( S"foo.xml", FileMode::Open, FileAccess::Read );
	SoapFormatter* c = new SoapFormatter;

	TreeNode* n;
	try {
		n = __try_cast<TreeNode*>( c->Deserialize(r) );
	}
	catch( InvalidCastException* e ) {
		Console::WriteLine( e->Message );
		return -1;
	}

	Console::WriteLine( S"Complete." );
	r->Close();

	try {
		n->PrintTree( Console::Out );
	}
	catch( InvalidCastException* e ) {
		Console::WriteLine( e->Message );
		return -1;
	}

	Console::WriteLine( S"\r\nPress Return to exit." );
	Console::Read();

    return 0;
}