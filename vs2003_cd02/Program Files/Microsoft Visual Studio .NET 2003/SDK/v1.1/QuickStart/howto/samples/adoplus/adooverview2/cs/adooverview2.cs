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

public class adooverview2
{
  public static void Main()
  {
    adooverview2 myadooverview2 = new adooverview2();
    myadooverview2.Run();
  }

  public void Run()
  {
    string Message = null;


    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand mySqlCommand = new SqlCommand("INSERT INTO Customers (CustomerId, CompanyName, ContactName, ContactTitle, Address) Values ('ABC','ABC Company', 'John Smith', 'Owner','One My Way')", myConnection);
    SqlCommand mySqlCleanup = new SqlCommand("DELETE FROM Customers WHERE CustomerId = 'ABC'", myConnection);

    try
    {
      myConnection.Open();
      mySqlCleanup.ExecuteNonQuery();  // remove record that may have been entered previously.
      mySqlCommand.ExecuteNonQuery();
      Message = "New Record inserted into Customers table in northwind.";
    }
    catch(Exception e)
    {
      Message= "Couldn't insert record: " + e.ToString();
    }
    finally
    {
      myConnection.Close();
    }

    Console.Write(Message);
  }
}

}
