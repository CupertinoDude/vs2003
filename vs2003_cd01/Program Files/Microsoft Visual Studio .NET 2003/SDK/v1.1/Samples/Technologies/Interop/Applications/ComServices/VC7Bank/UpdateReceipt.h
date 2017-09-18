// ==============================================================================
// Filename: UpdateReceipt.h
//
// Summary:  managed cpp definition of the UpdateReceipt class for the bank sample
// Classes:  UpdateReceipt.cs
//
// This file is part of the Microsoft COM+ Samples
//
// Copyright (C) Microsoft Corporation. All rights reserved
//
// This source code is intended only as a supplement to Microsoft
// Development Tools and/or on-line documentation.  See these other
// materials for detailed information reagrding Microsoft code samples.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//

namespace VC7Bank
{

    [
        Transaction(TransactionOption::Required)
    ]
    public __gc	class UpdateReceipt: public ServicedComponent, public IUpdateReceipt
    {
	public:
        int Update ();
	private:
		int trueUpdate();
    };
}