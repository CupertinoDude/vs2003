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

__gc class readandwritexml
{

public:
  void Run()
  {
    try
    {
      SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
      SqlDataAdapter * mySqlDataAdapter1 = new SqlDataAdapter("select * from customers", myConnection);
      SqlDataAdapter * mySqlDataAdapter2 = new SqlDataAdapter("select * from orders", myConnection);

      DataSet * myDataSet = new DataSet();

      mySqlDataAdapter1->Fill(myDataSet,"Customers");
      mySqlDataAdapter2->Fill(myDataSet,"Orders");

      String * strXMLData = myDataSet->GetXml();
      String * strXMLSchema = myDataSet->GetXmlSchema();

      Console::WriteLine("Select View Source to see XMLSchema");
      Console::WriteLine(strXMLSchema);
      Console::WriteLine("");
      Console::WriteLine("Data");
      Console::WriteLine(strXMLData);

      myConnection->Close();
    }
    catch(Exception * e)
    {
      Console::WriteLine(e->ToString());
    }
  }
};

void main()
{
	readandwritexml * myreadandwritexml = new readandwritexml();
	myreadandwritexml->Run();
}
