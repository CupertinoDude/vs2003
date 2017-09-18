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

__gc public class Customer {
protected:
	String* lastName;
	String* firstName;

public:
	__property String* get_LastName() {
		return lastName;
	}

	__property void set_LastName( String* value ) {
		lastName = value;
	}
	
	__property String* get_FirstName() {
		return firstName;
	}
	
	__property void set_FirstName( String* value ) {
		firstName = value;
	}
	
	__property String* get_FullName() {
		return String::Concat( firstName, lastName );
	}
};
