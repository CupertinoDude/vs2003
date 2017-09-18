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
#using "TypedData.dll"

using namespace System;
using namespace System::Data;
using namespace System::Xml;
using namespace System::Data::SqlClient;
using namespace customerDataSet;

 __gc class typeddata
{
public:
  void Run()
  {
    custDS * myCustDS = new custDS();
    SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter(S"Select * from customers", S"server=(local)\\NetSDK;Trusted_Connection=yes;database=northwind");
    mySqlDataAdapter->Fill(myCustDS, S"Customers");

	Console::WriteLine(S"CustomerID\n");

	for(int i =0; i< myCustDS->Tables->Item[0]->Rows->Count; i++)
		Console::WriteLine(myCustDS->Tables->Item[0]->Rows->Item[i]->Item[0]->ToString());
  }
};

void main()
{
	typeddata * mytypeddata = new typeddata();
	 
	 mytypeddata->Run();
}
