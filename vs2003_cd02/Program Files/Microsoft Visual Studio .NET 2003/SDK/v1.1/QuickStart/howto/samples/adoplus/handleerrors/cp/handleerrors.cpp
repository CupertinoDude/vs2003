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
#using <System.Xml.dll>

using namespace System;
using namespace System::Data;
using namespace System::Xml;
using namespace System::Data::SqlClient;

__gc class handleerrors
{
public:
  void Run()
  {
    // Create a new Connection and SqlDataAdapter
    SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection);

    // Create the new instance of the DataSet
    DataSet * myDataSet = new DataSet();

    // Load the customer table from the database into a table called Customers in the dataset
    mySqlDataAdapter->Fill(myDataSet,"Customers");

    // Create a new dataview instance on the Customers table that was just created
    DataView * myDataView = new DataView(myDataSet->Tables->Item["Customers"]);

    // Sort the view based on the CustomerID column
    myDataView->Sort = "CustomerID";

    myDataSet->Tables->Item["Customers"]->Rows->Item[0]->RowError = "An Error was added";
    myDataSet->Tables->Item["Customers"]->Rows->Item[1]->RowError = "This is another error message";

    if ( myDataSet->Tables->Item["Customers"]->HasErrors )
    {
      DataRow * ErrDataRows[] = myDataSet->Tables->Item["Customers"]->GetErrors();
      Console::Write("DataTable ");
	  Console::Write(myDataSet->Tables->Item["Customers"]->TableName); 
	  Console::Write(" has ");
	  Console::Write(ErrDataRows->Count.ToString());
	  Console::WriteLine(" Error(s)!");

      for (int i = 0; i <= ErrDataRows->Length -1; i++)
      {
        Console::Write("Row Error for row ");
		Console::Write(ErrDataRows[i]->Item["CustomerID"]->ToString());
		Console::Write(" --  Error Msg=");
		Console::WriteLine(ErrDataRows[i]->RowError);
      }
    }
    else
    {
      Console::WriteLine("=================");
      Console::Write("DataTable ");
	  Console::Write(myDataSet->Tables->Item["Customers"]->TableName);
	  Console::Write(" Has no errors");
    }
    myConnection->Close();
  }
};

void main()
{
	handleerrors * myhandleerrors = new handleerrors();
	myhandleerrors->Run();
}
