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
using System.Data;
using System.Data.SqlClient;

public class adooverview3
{
  public static void Main()
  {
    adooverview3 myadooverview3 = new adooverview3();
    myadooverview3.Run();
  }

  public void Run()
  {
    SqlDataReader myReader = null;


    SqlConnection mySqlConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand mySqlCommand = new SqlCommand("select * from customers", mySqlConnection);

    try
    {
      mySqlConnection.Open();
      myReader = mySqlCommand.ExecuteReader();

      Console.Write("Customer ID    ");
      Console.WriteLine("Company Name");

      while (myReader.Read())
      {
        Console.Write(myReader["CustomerID"].ToString() + "    ");
        Console.WriteLine(myReader["CompanyName"].ToString());
      }
    }
    catch(Exception e)
    {
      Console.WriteLine(e.ToString());
    }
    finally
    {
      if (myReader != null)
        myReader.Close();

      if (mySqlConnection.State == ConnectionState.Open)
        mySqlConnection.Close();
    }
  }
}

}