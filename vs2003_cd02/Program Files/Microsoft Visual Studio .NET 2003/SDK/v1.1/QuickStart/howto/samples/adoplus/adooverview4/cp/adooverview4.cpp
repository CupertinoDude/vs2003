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
#using <System.Xml.dll>

using namespace System;
using namespace System::Data;
using namespace System::Data::SqlClient;

__gc class adooverview4
{
public:

  void Run()
  {
    String * MsgString;
    DataSet * myDataSet;

    SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection);
    SqlDataAdapter * mySqlDataAdapter1 = new SqlDataAdapter("select * from orders", myConnection);

    // Restore database to it's original condition so sample will work correctly.
    myConnection->Open();
    SqlCommand * CleanupCommand = new SqlCommand("DELETE FROM Customers WHERE CustomerId = 'NewID'", myConnection);
    CleanupCommand->ExecuteNonQuery();
    myConnection->Close();

    try
    {
      myDataSet = new DataSet();
      DataRow * myDataRow;

      // Create command builder
      SqlCommandBuilder * mySqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter);

      mySqlDataAdapter->Fill(myDataSet,"Customers");
			Console::WriteLine("Loaded data from Customers table into dataset.");

      mySqlDataAdapter1->Fill(myDataSet,"Orders");
			Console::WriteLine("Loaded data from Orders  table into dataset.");

      // ADD RELATION
      myDataSet->Relations->Add("CustOrders",myDataSet->Tables->Item["Customers"]->Columns->Item["CustomerId"],myDataSet->Tables->Item["Orders"]->Columns->Item["CustomerId"]);

      // EDIT
      (myDataSet->Tables->Item["Customers"]->Rows->Item[0])->Item["ContactName"]=S"Peach";

      // ADD
      myDataRow = myDataSet->Tables->Item["Customers"]->NewRow();
      myDataRow->Item["CustomerId"] =S"NewID";
      myDataRow->Item["ContactName"] = S"New Name";
      myDataRow->Item["CompanyName"] = S"New Company Name";
      myDataSet->Tables->Item["Customers"]->Rows->Add(myDataRow);
	  Console::WriteLine("Inserted new row into Customers.");

      // Update Database with SqlDataAdapter
      mySqlDataAdapter->Update(myDataSet, "Customers");
	  Console::WriteLine("Sent Update to database.");

      MsgString = "DataSet processing has completed successfully!";
    }
    catch(Exception * e)
    {
      MsgString = e->Message;
    }

		Console::Write(MsgString);
  }
};

void main()
{
    adooverview4 * myadooverview4 = new adooverview4();
    myadooverview4->Run();
}