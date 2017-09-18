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

__gc class adooverview1
{
public:

  void Run()
  {
    SqlConnection * mySqlConnection = new SqlConnection(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");

    try
    {
      mySqlConnection->Open();
	  Console::WriteLine(String::Concat(S"Opened Connection to ", mySqlConnection->ConnectionString));

      // Close the connection explicitly
      mySqlConnection->Close();
	  Console::WriteLine("Closed Connection.  It is important to close connections explicitly.");
    }
    catch(Exception * e)
    {
		Console::WriteLine(String::Concat("Couldn't Open Connection to ",mySqlConnection->ConnectionString));
    }
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
    adooverview1 *myadooverview1 = new adooverview1();
    myadooverview1->Run();
    return 0;
}



