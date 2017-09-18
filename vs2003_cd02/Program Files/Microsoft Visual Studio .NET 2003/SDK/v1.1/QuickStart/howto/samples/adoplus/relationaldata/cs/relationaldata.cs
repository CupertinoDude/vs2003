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

public class relationaldata
{
  public static void Main()
  {
    relationaldata myrelationaldata = new relationaldata();
    myrelationaldata.Run();
  }

  public void Run()
  {
    DataSet myDataSet = new DataSet();


    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter mySqlDataAdapter1 = new SqlDataAdapter("select * from customers", myConnection);
    SqlDataAdapter mySqlDataAdapter2 = new SqlDataAdapter("select * from orders", myConnection);

    try
    {
      mySqlDataAdapter1.Fill(myDataSet,"Customers");
      mySqlDataAdapter2.Fill(myDataSet,"Orders");

      // ADD RELATION
      myDataSet.Relations.Add("CustOrders",myDataSet.Tables["Customers"].Columns["CustomerId"],myDataSet.Tables["Orders"].Columns["CustomerId"]);

      // Iterate over data of Customers and their orders
      foreach (DataRow myDataRow1 in myDataSet.Tables["Customers"].Rows)
      {
        Console.WriteLine("Customer: " + myDataRow1["ContactName"].ToString());

        // Iterate over orders data.
        foreach (DataRow myDataRow2 in myDataRow1.GetChildRows(myDataSet.Relations["CustOrders"]))
        {
          Console.WriteLine("Order # " + myDataRow2["OrderId"].ToString());
        }

        Console.WriteLine();
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