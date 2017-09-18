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

public class connectionpooling
{
  public static void Main()
  {
    connectionpooling myconnectionpooling = new connectionpooling();
    myconnectionpooling.Run();
  }

  public void Run()
  {
    try
    {
      String connString;

      // Specification in the connection string:
      // Please note: Pooling is implicit, you automatically get it unless you disable it. 
      //              Therefore, "true" is the default for the pooling keyword (pooling=true).   
      // Connection Reset:    False
      // Connection Lifetime: 5
      // Enlist:              true
      // Min Pool Size:       1
      // Max Pool Size:       50
      connString = "server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind;" +
                   "connection reset=false;" +
                   "connection lifetime=5;" +
                   "min pool size=1;" +
                   "max pool size=50";

      SqlConnection myConnection1 = new SqlConnection(connString);
      SqlConnection myConnection2 = new SqlConnection(connString);
      SqlConnection myConnection3 = new SqlConnection(connString);

      // Open two connections.
      Console.WriteLine ("Open two connections.");
      myConnection1.Open();
      myConnection2.Open();

      // Now there are two connections in the pool that matches the connection string.
      // Return the both connections to the pool. 
      Console.WriteLine ("Return both of the connections to the pool.");
      myConnection1.Close();
      myConnection2.Close();

      // Get a connection out of the pool.
      Console.WriteLine ("Open a connection from the pool.");
      myConnection1.Open();

      // Get a second connection out of the pool.
      Console.WriteLine ("Open a second connection from the pool.");
      myConnection2.Open();

      // Open a third connection.
      Console.WriteLine ("Open a third connection.");
      myConnection3.Open();

      // Return the all connections to the pool.  
      Console.WriteLine ("Return all three connections to the pool.");
      myConnection1.Close();
      myConnection2.Close();
      myConnection3.Close();
    }
    catch (Exception e)
    {
      // Display the error.
      Console.WriteLine(e.ToString());
    }
  }
}

}
