// ==============================================================================
// Filename: GetReceipt.cs
//
// Summary:  C# implememtation of the GetReceipt class for the bank sample
// Classes:  GetReceipt.cs
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
	// import definitions for ComServices support
	[
        Transaction(TransactionOption::Supported)
    ]
    public __gc class GetReceipt: public ServicedComponent, public IGetReceipt
    {
    public:
        int GetNextReceipt ();

    private:
        int trueGetNextReceipt ();
    };
}
