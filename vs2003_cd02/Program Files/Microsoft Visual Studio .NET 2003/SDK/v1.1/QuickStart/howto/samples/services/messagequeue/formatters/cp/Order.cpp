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

[Serializable]
public __gc class Order {
protected:

    Int64 orderId;
    String* itemDescription;

public:
	__property Int64 get_OrderId() {
		return orderId;
	}

	__property void set_OrderId( Int64 value ) {
		orderId = value;
	}
    
    __property String* get_ItemDescription() {
		return itemDescription;
	}

	__property void set_ItemDescription( String* value ) {
		itemDescription = value;
    }
};


  