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
using System.Data.OleDb;

public class adodtreader
{
  public static void Main()
  {
    adodtreader myadodtreader = new adodtreader();
    myadodtreader.Run();
  }

  public void Run()
  {
    OleDbDataReader myDataReader = null;

    OleDbConnection myOleDbConnection = new OleDbConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind;provider=sqloledb");
    OleDbCommand myOleDbCommand = new OleDbCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", myOleDbConnection);

    try
    {
      myOleDbConnection.Open();
      myDataReader = myOleDbCommand.ExecuteReader();

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
      if (myOleDbConnection.State == ConnectionState.Open)
        myOleDbConnection.Close();
    }
  }
}

}
