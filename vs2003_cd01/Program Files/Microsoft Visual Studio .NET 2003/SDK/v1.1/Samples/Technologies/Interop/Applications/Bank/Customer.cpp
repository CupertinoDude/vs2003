
/*+==========================================================================
  File:      Customer.cpp

  Summary:   This file implements getting and setting the Customer
			 information

  Classes:   None

  Functions: Customer, GetId, SetId, GetFirst,
		     SetFirst, GetLast, SetLast, GetAddress, SetAddress
			 GetCity, SetCity, GetState, SetState, GetZip, SetZip,
			 GetChkAcct, GetSavAcct, GetLoan, GetMinLoanRate, GetNetWorth,
			 Load, Save

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

#using "Account.dll"
#using "Loan.dll"
#using "RateSvr.dll"

#define NULL    0

namespace BankSample
{

	__gc public class Customer
	{
	private:
		String* 	m_Id;
		String*		m_First;
		String*		m_Last;
		String*		m_Address;
		String*		m_City;
		String*		m_State;
		String*		m_Zip;

		Account*	m_ChkAcct;
		Account*	m_SavAcct;
		BankLoan*	m_Loan;

	public:
		Customer();

		String *  GetId() {return m_Id;};
		void SetId(String* Id) {m_Id = Id;};

		String * GetFirst() {return m_First;};
		void SetFirst(String* First) {m_First = First;};

		String * GetLast() {return m_Last;};
		void SetLast(String* Last) {m_Last = Last;};

		String * GetAddress() {return m_Address;};
		void SetAddress(String * Address) {m_Address = Address;};

		String * GetCity() {return m_City;};
		void SetCity(String *  City) {m_City = City;};

		String * GetState() {return m_State;};
		void SetState(String *  State) {m_State = State;};

		String * GetZip() {return m_Zip;};
		void SetZip(String* Zip) {m_Zip = Zip;};

		Account* GetChkAcct();
		Account*  GetSavAcct();
		BankLoan * GetLoan();

		double GetMinLoanRate(double Amount, double Term);
		double GetNetWorth();

		short Load(String * Id);
		short Save(void);
	};



	Customer::Customer()
	{
		m_Id = new String(L"");
		m_First = new String(L"");
		m_Last = new String(L"");
		m_Address = new String(L"");
		m_City = new String(L"");
		m_State = new String(L"");
		m_Zip = new String(L"");

		m_ChkAcct = NULL;
		m_SavAcct = NULL;
		m_Loan = NULL;
	}



	Account *  Customer::GetChkAcct()
	{
		if (m_ChkAcct == NULL)
			m_ChkAcct = new Account();

		return m_ChkAcct;
	}

	Account *  Customer::GetSavAcct()
	{
		if (m_SavAcct == NULL)
			m_SavAcct = new Account();

		return m_SavAcct;
	}

	BankLoan* Customer::GetLoan()
	{
		if (m_Loan == NULL)
			m_Loan = new BankLoan();

		return m_Loan;
	}

	double Customer::GetMinLoanRate(double Amount, double Term)
	{
		double MinRate = 0.0;

		RateSvr::RateLookup *rl;
		rl = new RateSvr::RateLookupClass;
		MinRate = rl->GetLoanRate(Amount, Term);

		return MinRate;
	}

	double Customer::GetNetWorth()
	{
		double nw = 0.0;

		if (m_ChkAcct != NULL)
			nw = nw + m_ChkAcct->GetBalance();

		if (m_SavAcct != NULL)
			nw = nw + m_SavAcct->GetBalance();

		if (m_Loan != NULL)
			nw = nw - m_Loan->GetBalance();

		return nw;
	}

	short Customer::Load(String *  Id)
	{
		String *  filename = String::Concat( Id, L".txt");

		try
		{
			StreamReader * tis = new StreamReader (filename);

			m_Id = Id;
			m_First = tis->ReadLine();
			m_Last = tis->ReadLine();
			m_Address = tis->ReadLine();
			m_City = tis->ReadLine();
			m_State = tis->ReadLine();
			m_Zip = tis->ReadLine();

			String *  buf;

			buf = tis->ReadLine();
			m_ChkAcct->SetBalance(Double :: Parse (buf));

			buf = tis->ReadLine();
			m_SavAcct->SetBalance(Double :: Parse (buf));

			buf = tis->ReadLine();
			m_Loan->SetBalance(Double :: Parse (buf));

			buf = tis->ReadLine();
			m_Loan->SetPrincipal(Double :: Parse (buf));

			buf = tis->ReadLine();
			m_Loan->SetRate(Double :: Parse (buf) / 100);

			buf = tis->ReadLine();
			m_Loan->SetTerm(Double :: Parse (buf));

			buf = tis->ReadLine();
			m_Loan->SetPayment(Double :: Parse (buf));

			tis->Close();
		}
		catch (Exception * e) {
			return false;
		}
		return true;
	}

	short Customer::Save()
	{
		String * filename  = String::Concat(m_Id, L".txt");

		StreamWriter *  tos = new StreamWriter(filename, false);

		tos->WriteLine(m_First);
		tos->WriteLine(m_Last);
		tos->WriteLine(m_Address);
		tos->WriteLine(m_City);
		tos->WriteLine(m_State);
		tos->WriteLine(m_Zip);

		tos->WriteLine(m_ChkAcct->GetBalance());
		tos->WriteLine(m_SavAcct->GetBalance());

		tos->WriteLine(m_Loan->GetBalance());
		tos->WriteLine(m_Loan->GetPrincipal());
		tos->WriteLine(m_Loan->GetRate()*100);
		tos->WriteLine(m_Loan->GetTerm());
		tos->WriteLine(m_Loan->GetPayment());

		tos->Close();

		return true;
	}
}