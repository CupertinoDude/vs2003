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
using customerDataSet;

public class typeddata
{
  public static void Main()
  {
    typeddata mytypeddata = new typeddata();
    mytypeddata.Run();
  }

  public void Run()
  {

    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("Select * from customers", "server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");

    try
    {
      custDS myCustDS = new custDS();
      mySqlDataAdapter.Fill(myCustDS, "Customers");

      Console.WriteLine("CustomerID\n");

      foreach (custDS.customersRow myDataRow in myCustDS.customers)
        Console.WriteLine(myDataRow.CustomerID);
    }
    catch(Exception e)
    {
      Console.Write(e.ToString());
    }
  }
}

}