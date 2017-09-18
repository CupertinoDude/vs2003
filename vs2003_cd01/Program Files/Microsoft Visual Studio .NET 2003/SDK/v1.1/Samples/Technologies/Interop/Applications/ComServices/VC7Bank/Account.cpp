// ==============================================================================
// Filename: Account.cpp
//
// Summary:  managed cpp implememtation of the account class for the bank sample
// Classes:  Account.cpp
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

// import mscorlib definitions

#using "mscorlib.dll"
using namespace System;
using namespace System::Runtime::InteropServices;
using namespace System::Reflection;

// import definitions for EnterpriseServices support
#using "System.EnterpriseServices.dll"
using namespace System::EnterpriseServices;

//import definitions for ADO
#using "adodb.dll"
using namespace ADODB;

// import definition for account typelibrary
#using "AccountComLib.dll"
using namespace AccountComLib;

#define null 0

#include "createtable.h"
#include "account.h"

[assembly:AssemblyKeyFile("../common/testkey.snk")];
[assembly:Description("CLR Com Services ServicedComponent sample")];
[assembly:ApplicationName("ServicedComponentApp")];
[assembly:ApplicationActivation(ActivationOption::Library)];

namespace VC7Bank
{

    String* Account::Post (int lngAccountNo, int lngAmount)
    {
        String* result;
        bool bSuccess = false;

        try
        {
            // Check for security
            if ((lngAmount > 500 || lngAmount < -500) && !ContextUtil::IsCallerInRole ("Managers"))
                throw new Exception ("Need 'Managers' role for amounts over $500");

            result = truePost (lngAccountNo, lngAmount);

            bSuccess = true;
            return result;
        }

        // Upon exit, always call SetComplete if happy, or SetAbort if unhappy.
        // We do this because we never save state across method calls.
        __finally
        {
			if (bSuccess)
				ContextUtil::SetComplete();
			else
				ContextUtil::SetAbort();
        }
    }

    // F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
    //
    // Function: TruePost
    //
    // TruePost() is the function that performs the actual work for the Account class.
    // If an error occurs during execution, it will throw a ComFailException for Post() to
    // handle.
    //
    // Args:     lngAccountNo -    Account to be posted
    //           lngAmount -     Amount to be posted
    // Returns:  String -        Account Balance
    //
    // F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---

	String* Account::truePost (int lngAccountNo, int lngAmount)
    {
        _Recordset* adoRsBalance  = null;
        _Connection* adoConn = null;
        Field* pField = null;
        Fields* pFields = null;
        String* result;

        try
        {
            // Create ADOConnection object and initialize the connection

            adoConn = dynamic_cast<_Connection __gc *>(new ConnectionClass());
            String* vDSN = "FILEDSN=BankSample";

			adoConn->Open (vDSN, null, null, (int)CommandTypeEnum::adCmdUnspecified);

            // Obtain the desired recordset with an SQL query
            Object*  vRowCount = new Object();
            String* strSQL = String::Concat(S"UPDATE Account SET Balance = Balance +",
											lngAmount.ToString(),
											S"WHERE AccountNo =",
											lngAccountNo.ToString());

	TryAgain:
			try
			{
				adoConn->Execute (strSQL, &vRowCount, (int)ExecuteOptionEnum::adExecuteNoRecords);
			}
			catch(Exception*)
			{

					ICreateTable* ct = dynamic_cast<ICreateTable __gc*>(new CreateTable());
					ct->CreateAccount();
					goto TryAgain;
			}

            // See whether the record is present.
            if (*dynamic_cast<Int32*>(vRowCount) == 0)
			{
				String* msg = String::Concat(S"%s %s %s",
											 S"Error. Account",
											 lngAccountNo.ToString(),
											 S"not on file.");
				throw new Exception(msg);
			}

            strSQL = String::Concat(S"SELECT Balance FROM Account WHERE AccountNo = ",
									lngAccountNo.ToString());
            adoRsBalance = adoConn->Execute (strSQL, &vRowCount, - 1);

            // Get the appropriate fields
            pFields = adoRsBalance->Fields;
            pField = pFields->get_Item(S"Balance");
            int lngBalance  = *dynamic_cast<Int32*>(pField->Value);

            // Check if account is overdrawn, then prepare return string
            if ((lngBalance) < 0)
			{
				Int32 remaining = (int)lngBalance - (int)lngAmount;
				String* msg = String::Concat(S"Error. Account",
											 lngAccountNo.ToString(),
											 S"would be overdrawn by",
											 lngBalance.ToString(),
											 S". Balance is still ",
											 remaining.ToString(),
											 S".");
				throw new Exception(msg);
			}
            if (lngAmount > 0)
                result = S"Credit to";
            else
                result = S"Debit from";
			return String::Concat(result,
										   S" account ",
										   lngAccountNo.ToString(),
										   S", balance is $",
										   lngBalance.ToString(),
										   S". (VC7)");
        }
        __finally
        {
        }
    }
}
