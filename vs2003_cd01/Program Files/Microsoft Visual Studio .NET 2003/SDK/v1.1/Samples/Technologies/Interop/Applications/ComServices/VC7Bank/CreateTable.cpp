// ==============================================================================
// Filename: CreateTable.cpp
//
// Summary:  managed cpp implememtation of the CreateTable class for the bank sample
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

// import mscorlib definitions
#using "mscorlib.dll"
using namespace System;
using namespace System::Runtime::InteropServices;

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
#include "CreateTable.h"

namespace VC7Bank
{

	// F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
	//
	// Function: CreateAccount
	//
	// This function creates the Account table
	//
	// Args:     None
	// Returns:  None
	//
	// F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---
    void	CreateTable::CreateAccount()
	{
		try
		{
			_Connection* adoConn = null;
			String* vDSN = "FILEDSN=BankSample";
			String* vbCrLf = "\n";
			Object*  vRowCount = new Object();

            adoConn = dynamic_cast<_Connection __gc *>(new ConnectionClass());
            adoConn->Open (vDSN, null, null, CommandTypeEnum::adCmdUnspecified);

		    String* strSQL = String::Concat(S"If not exists (Select name from sysobjects where name = 'Account')", vbCrLf,
									     S"BEGIN", vbCrLf,
										 S"CREATE TABLE dbo.Account (", vbCrLf,
										 S"AccountNo int NOT NULL ,", vbCrLf,
									     S"Balance int NULL ,", vbCrLf,
										 S"CONSTRAINT PK___1__10 PRIMARY KEY  CLUSTERED", vbCrLf,
									     S"(", vbCrLf,
										 S"AccountNo", vbCrLf,
										 S")", vbCrLf,
										 S")", vbCrLf,
										 S"INSERT INTO Account VALUES (1,1000)", vbCrLf,
										 S"INSERT INTO Account VALUES (2,1000)", vbCrLf,
										 S"END", vbCrLf);


			adoConn->Execute(strSQL,  &vRowCount, ExecuteOptionEnum::adExecuteNoRecords);
            ContextUtil::SetComplete();
		}
		catch(Exception* e)
		{

            ContextUtil::SetAbort();
            String* msg = String::Concat(S"Error. Unable to create account table", e->ToString());
			throw new Exception (msg);
		}
	}

	// F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
	//
	// Function: CreateReceipt
	//
	// This function creates the Receipt Table
	//
	// Args:     None
	// Returns:  None
	//
	// F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---
    void	CreateTable::CreateReceipt()
	{
		try
		{
			_Connection* adoConn = null;
			String* vDSN = "FILEDSN=BankSample";
			String* vbCrLf = "\n";
			Object*  vRowCount = new Object();

            adoConn = dynamic_cast<_Connection __gc *>(new ConnectionClass());
            adoConn->Open(vDSN, null, null, (int)CommandTypeEnum::adCmdUnspecified);

		    String* strSQL = String::Concat(S"If not exists (Select name from sysobjects where name = 'Receipt')", vbCrLf,
									     S"BEGIN", vbCrLf,
										 S"CREATE TABLE Receipt (NextReceipt int)", vbCrLf,
										 S"INSERT INTO Receipt VALUES (1000)", vbCrLf,
										 S"END");
            adoConn->Execute(strSQL, &vRowCount, (int)ExecuteOptionEnum::adExecuteNoRecords);
            ContextUtil::SetComplete();
		}
		catch(Exception* e)
		{
            ContextUtil::SetAbort();
            String* msg = String::Concat(S"Error. Unable to create account table\n", e->ToString());
			throw new Exception (msg);
		}
	}
}