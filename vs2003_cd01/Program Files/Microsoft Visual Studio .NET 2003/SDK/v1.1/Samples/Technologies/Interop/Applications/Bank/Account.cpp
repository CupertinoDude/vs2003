
/*+==========================================================================
  File:      Account.cpp

  Summary:   This file implements Account methods

  Classes:   Account

  Functions: Account, Credit, Debit, GetBalance, SetBalance

----------------------------------------------------------------------------
  This file is part of the Microsoft .NET Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.
==========================================================================+*/


#using <mscorlib.dll>

using namespace System;
using namespace System::IO;
using namespace System::Reflection;
using namespace System::Runtime::InteropServices;

[assembly:AssemblyKeyFile("bank.snk")];
[assembly:ClassInterface(ClassInterfaceType::AutoDual)];

#define NULL    0

namespace BankSample
{
	__gc public class Account
	{
	private:
		double Balance;
  
		
	public:
		Account ();
		short Credit(double b);
		short Debit (double b);
		double GetBalance();
		void SetBalance(double bal);
	};

	Account ::Account ()
	{
		Balance = 0;
	}
		

	short Account :: Credit(double b)
	{
		Balance += b;
		return 1;
	}

	short Account :: Debit(double b)
	{
		Balance -= b;
		return 1;
	}

	double Account ::GetBalance()
	{
		return Balance;
	}

	void Account ::SetBalance(double bal)
	{
		Balance = bal;
	}

}


