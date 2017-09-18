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

__gc class relationaldata
{
public:
  void Run()
  {
    DataSet * myDataSet = new DataSet();

    SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter * mySqlDataAdapter1 = new SqlDataAdapter("select * from customers", myConnection);
    SqlDataAdapter * mySqlDataAdapter2 = new SqlDataAdapter("select * from orders", myConnection);

    mySqlDataAdapter1->Fill(myDataSet,"Customers");
    mySqlDataAdapter2->Fill(myDataSet,"Orders");

    // ADD RELATION
    myDataSet->Relations->Add("CustOrders",myDataSet->Tables->Item["Customers"]->Columns->Item["CustomerId"],myDataSet->Tables->Item["Orders"]->Columns->Item["CustomerId"]);

    // Iterate over data of Customers and their orders
    for(int i = 0; i< myDataSet->Tables->Item["Customers"]->Rows->Count; i++)
    {
	  DataRow * myDataRow1 = myDataSet->Tables->Item["Customers"]->Rows->Item[i];
      Console::Write("Customer: ");
	  Console::WriteLine(myDataRow1->Item["ContactName"]->ToString());

      // Iterate over orders data.
	  DataRow * rows[] = myDataRow1->GetChildRows(myDataSet->Relations->Item["CustOrders"]);
      for(int j = 0; j< rows->Count; j++)
      {
        Console::Write("Order #");
		Console::WriteLine(rows[j]->Item["OrderId"]->ToString());
      }

      Console::WriteLine();
    }
    myConnection->Close();
  }
};
void main()
{
	relationaldata * myrelationaldata = new relationaldata();
	myrelationaldata->Run();
}
