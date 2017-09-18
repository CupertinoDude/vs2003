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

__gc class sqldtreader
{
public:

  void Run()
  {
    SqlDataReader * myDataReader = 0;
    SqlConnection * mySqlConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand * mySqlCommand = new SqlCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", mySqlConnection);

    try
    {
      mySqlConnection->Open();
      myDataReader = mySqlCommand->ExecuteReader();

      Console::Write("EmployeeID\t");
      Console::Write("Name\t\t");
      Console::Write("Title\t\t\t");
      Console::WriteLine("ReportsTo");

      // Always call Read before accessing data.
      while (myDataReader->Read())
      {
        Console::Write(myDataReader->GetInt32(0));
		Console::Write("\t\t");
        Console::Write(myDataReader->GetString(2));
		Console::Write(" ");
		Console::Write(myDataReader->GetString(1));
		Console::Write("\t");
        Console::Write(myDataReader->GetString(3));
		Console::Write("\t");
        if (myDataReader->IsDBNull(4))
          Console::Write("N/A\n");
        else
          Console::WriteLine(myDataReader->GetInt32(4));
      }
    }
    catch(Exception * e)
    {
      Console::Write(e->ToString());
    }
    __finally
    {
      // Always call Close when done reading.
      myDataReader->Close();

      // Close the connection when done with it.
      mySqlConnection->Close();
    }
  }
};

void main()
{
	sqldtreader * mysqldtreader = new sqldtreader();
	mysqldtreader->Run();
}

