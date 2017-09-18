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

__gc class gettingdata
{
public:
  void Run()
  {
    DataSet * myDataSet = new DataSet();
    SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection);

    mySqlDataAdapter->Fill(myDataSet,"Customers");

    for(int i =0;i< myDataSet->Tables->Item["Customers"]->Rows->Count; i++)
    {
		DataRow * row = myDataSet->Tables->Item["Customers"]->Rows->Item[i];
		Console::WriteLine(row->Item["CustomerID"]->ToString());
    }
    myConnection->Close();
  }
};

void main()
{
	gettingdata * mygettingdata = new gettingdata();
	mygettingdata->Run();
}

