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
using namespace System::Data::OleDb;
__gc class adodtreader
{

public:
  void Run()
  {
	  OleDbDataReader * myDataReader;
    OleDbConnection * myOleDbConnection = new OleDbConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind;provider=sqloledb");
    OleDbCommand * myOleDbCommand = new OleDbCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", myOleDbConnection);

    try
    {
      myOleDbConnection->Open();
      myDataReader = myOleDbCommand->ExecuteReader();

	  Console::Write("EmployeeID\t");
	  Console::Write("Name\t");
	  Console::Write("Title\t");
	  Console::Write("ReportsTo\n");

      // Always call Read before accessing data.
      while (myDataReader->Read())
      {
        Console::Write(myDataReader->GetInt32(0) + "\t");
		Console::Write(String::Concat(myDataReader->GetString(2)," ",myDataReader->GetString(1),"\t"));
        Console::Write(String::Concat(myDataReader->GetString(3),"\t"));
        if (myDataReader->IsDBNull(4))
          Console::Write("N/A\n");
        else
          Console::Write(String::Concat(myDataReader->GetInt32(4).ToString(),"\n"));
      }
    }
    catch(Exception * e)
    {
      Console::Write(e->ToString());
    }
      // Always call Close when done reading.
      myDataReader->Close();

      // Close the connection when done with it.
      myOleDbConnection->Close();
    
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
    adodtreader * myadodtreader = new adodtreader();
    myadodtreader->Run();
    
    return 0;
}




