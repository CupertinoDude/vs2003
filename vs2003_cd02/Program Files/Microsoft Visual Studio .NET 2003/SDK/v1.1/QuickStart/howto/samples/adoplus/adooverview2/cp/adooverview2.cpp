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

// This is the main project file for VC++ application project 
// generated using an Application Wizard.

#using <mscorlib.dll>
#using <System.dll>
#using <System.Data.dll>

using namespace System;
using namespace System::Data;
using namespace System::Data::SqlClient;

__gc class adooverview2
{
public:
	void Run()
  {
    String * Message;

    SqlConnection *myConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand *mySqlCommand = new SqlCommand(S"INSERT INTO Customers (CustomerId, CompanyName, Contactname, ContactTitle, Address) Values ('fd','FatDaddy', 'Penelope Smith', 'Princess','One My Way')", myConnection);
    SqlCommand *mySqlCleanup = new SqlCommand(S"DELETE FROM Customers WHERE CustomerId = 'fd'", myConnection);

    try
    {
      myConnection->Open();
      mySqlCleanup->ExecuteNonQuery();  // remove record that may have been entered previously.
      mySqlCommand->ExecuteNonQuery();
      Message = "FatDaddy Record inserted into Customers table in northwind.";
    }
    catch(Exception * e)
    {
		Message= String::Concat("Couldn't insert record: ", e->ToString());
    }

	myConnection->Close();

	Console::Write(Message);
  }
};

// This is the entry point for this application
#ifdef _UNICODE
int wmain(void)
#else
int main(void)
#endif
{
    // TODO: Please replace the sample code below with your own.
    adooverview2 * myadooverview2 = new adooverview2();
    myadooverview2->Run();
    return 0;
}