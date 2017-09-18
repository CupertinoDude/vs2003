// ==============================================================================
// Filename: MoveMoney.h
//
// Summary:  managed cpp definition of the MoveMoney class for the bank sample
// Classes:  MoveMoney
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
    public __gc class MoveMoney : public ServicedComponent, public IMoveMoney
    {
	public:
        String* Perform (int lngPrimeAccount, int lngSecondAccount, int lngAmount, int tranType);

    private:
        String* truePerform (int lngPrimeAccount, int lngSecondAccount, int lngAmount, int tranType);
	};
}