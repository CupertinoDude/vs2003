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

namespace HowTo.Samples.ADONET
{

using System;
using System.Data.SqlClient;

public class adooverview1
{
  public static void Main()
  {
    adooverview1 myadooverview1 = new adooverview1();
    myadooverview1.Run();
  }

  public void Run()
  {

    SqlConnection mySqlConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");

    try
    {
      mySqlConnection.Open();
      Console.WriteLine("Opened Connection to {0}", mySqlConnection.ConnectionString);

      // Close the connection explicitly
      mySqlConnection.Close();
      Console.WriteLine("Closed Connection.  It is important to close connections explicitly.");
    }
    catch
    {
      Console.WriteLine("Couldn't Open Connection to {0}", mySqlConnection.ConnectionString);
    }
  }
}

}
