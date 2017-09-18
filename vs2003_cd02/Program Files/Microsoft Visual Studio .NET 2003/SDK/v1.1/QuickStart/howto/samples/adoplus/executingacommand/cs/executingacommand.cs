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
using System.Data.Common;

public class executingacommand
{
  public static void Main()
  {
    executingacommand myexecutingacommand = new executingacommand();
    myexecutingacommand.Run();
  }

  public void Run()
  {

    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand myCommand = new SqlCommand();
    SqlTransaction myTrans;

    // Open the connection.
    myConnection.Open();

    // Assign the connection property.
    myCommand.Connection  = myConnection;

    // Begin the transaction.
    myTrans = myConnection.BeginTransaction();

    // Assign transaction object for a pending local transaction
    myCommand.Transaction = myTrans;

    try
    {
      // Restore database to near it's original condition so sample will work correctly.
      myCommand.CommandText = "DELETE FROM Region WHERE (RegionID = 100) OR (RegionID = 101)";
      myCommand.ExecuteNonQuery();

      // Insert the first record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (100, 'MidWestern')";
      myCommand.ExecuteNonQuery();

      // Insert the second record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (101, 'MidEastern')";
      myCommand.ExecuteNonQuery();

      myTrans.Commit();
      Console.WriteLine("Both Records are written to the database!");
    }
    catch(Exception e)
    {
      myTrans.Rollback();
      Console.WriteLine(e.ToString());
      Console.WriteLine("Neither record is written to the database!");
    }
    finally
    {
      myConnection.Close();
    }
  }
}

}
