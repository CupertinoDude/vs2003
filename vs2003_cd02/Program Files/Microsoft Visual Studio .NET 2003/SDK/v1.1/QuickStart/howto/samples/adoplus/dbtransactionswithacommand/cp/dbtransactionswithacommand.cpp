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
#using <System.dll>
#using <System.Data.dll>

using namespace System;
using namespace System::Data;
using namespace System::Data::SqlClient;

__gc class dbtransactionswithacommand
{
public:

  void Run()
  {
    SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand * mySqlCommand;
    SqlTransaction * myTransaction;

    // Restore database to near it's original condifition so sample will work correctly.
    myConnection->Open();
    mySqlCommand = new SqlCommand(S"DELETE FROM Region WHERE (RegionID = 100) OR (RegionID = 101)", myConnection);
    mySqlCommand->ExecuteNonQuery();

    myTransaction = myConnection->BeginTransaction();

    // Assign transaction object for a pending local transaction
    mySqlCommand->Transaction = myTransaction;

    try
    {
      mySqlCommand->CommandText = S"Insert into Region (RegionID, RegionDescription) VALUES (100, 'Description')";
      mySqlCommand->ExecuteNonQuery();
      mySqlCommand->CommandText = S"Insert into Region (RegionID, RegionDescription) VALUES (101, 'Description')";
      mySqlCommand->ExecuteNonQuery();
      myTransaction->Commit();
	  Console::WriteLine(S"Both Records written to database");
    }
    catch(Exception * e)
    {
      myTransaction->Rollback();
	  Console::WriteLine(e->ToString());
	  Console::WriteLine(S"Neither record written to database.");
    }
    __finally
    {
      myConnection->Close();
    }
  }
};

void main()
{
  dbtransactionswithacommand * mydbtransactionswithacommand = new dbtransactionswithacommand();
  mydbtransactionswithacommand->Run();
}
