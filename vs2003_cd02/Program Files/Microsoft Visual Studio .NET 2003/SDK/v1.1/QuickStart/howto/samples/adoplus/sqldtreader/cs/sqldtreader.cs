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

public class sqldtreader
{
  public static void Main()
  {
    sqldtreader mysqldtreader = new sqldtreader();
    mysqldtreader.Run();
  }

  public void Run()
  {
    SqlDataReader myDataReader = null;

    SqlConnection mySqlConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand mySqlCommand = new SqlCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", mySqlConnection);

    try
    {
      mySqlConnection.Open();
      myDataReader = mySqlCommand.ExecuteReader(CommandBehavior.CloseConnection);

      Console.Write("EmployeeID" + "\t");
      Console.Write("Name" + "\t");
      Console.Write("Title" + "\t");
      Console.Write("ReportsTo" + "\n");

      // Always call Read before accessing data.
      while (myDataReader.Read())
      {
        Console.Write(myDataReader.GetInt32(0) + "\t");
        Console.Write(myDataReader.GetString(2) + " " + myDataReader.GetString(1) + "\t");
        Console.Write(myDataReader.GetString(3) + "\t");
        if (myDataReader.IsDBNull(4))
          Console.Write("N/A\n");
        else
          Console.Write(myDataReader.GetInt32(4) + "\n");
      }
    }
    catch(Exception e)
    {
      Console.Write(e.ToString());
    }
    finally
    {
      // Always call Close when done reading.
      if (myDataReader != null)
        myDataReader.Close();

      // Close the connection when done with it.
      if (mySqlConnection.State == ConnectionState.Open)
        mySqlConnection.Close();
    }
  }
}

}
