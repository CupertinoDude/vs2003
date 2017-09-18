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

public class filterdatatable
{
  public static void Main()
  {
    filterdatatable myfilterdatatable = new filterdatatable();
    myfilterdatatable.Run();
  }

  public void Run()
  {
    // Create a new Connection and SqlDataAdapter

    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection);

    try
    {
      // Create the new instance of the DataSet
      DataSet myDataSet = new DataSet();

      // Load the customer table from the database into a table called Customers in the dataset
      mySqlDataAdapter.Fill(myDataSet,"Customers");

      // Create a new dataview instance on the Customers table that was just created
      DataView myDataView = new DataView(myDataSet.Tables["Customers"]);

      // Sort the view based on the FirstName column
      myDataView.Sort = "CustomerID";

      // Filter the dataview to only show customers with the CustomerID of ALFKI
      myDataView.RowFilter = "CustomerID='ALFKI'";

      for (int i = 0; i < myDataView.Count; i++)
      {
        Console.Write(myDataView[i]["CustomerID"].ToString() + " - " + myDataView[i]["CompanyName"].ToString());
      }
    }
    catch(Exception e)
    {
      Console.WriteLine(e.ToString());
    }
    finally {
      myConnection.Close();
    }
  }
}

}
