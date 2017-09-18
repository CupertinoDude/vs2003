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

public class gettingdata
{
  public static void Main()
  {
    gettingdata mygettingdata = new gettingdata();
    mygettingdata.Run();
  }

  public void Run()
  {

    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection);

    try
    {
      DataSet myDataSet = new DataSet();

      mySqlDataAdapter.Fill(myDataSet,"Customers");

      foreach (DataRow myDataRow in myDataSet.Tables["Customers"].Rows)
      {
        Console.WriteLine(myDataRow["CustomerId"].ToString());
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
