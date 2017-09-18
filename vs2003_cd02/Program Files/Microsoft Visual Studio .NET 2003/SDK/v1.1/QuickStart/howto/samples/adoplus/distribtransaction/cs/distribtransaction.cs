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

[assembly: System.Reflection.AssemblyKeyFile("distribtransaction.snk")]
namespace HowTo.Samples.ADONET
{

using System;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;

[TransactionAttribute(TransactionOption.Required)]
public class myServicedComponent:ServicedComponent
{
  private SqlConnection m_rConnection;

  public myServicedComponent()
  {
  }

  public SqlConnection SqlConn
  {
    get { return m_rConnection; }
  }

  public ConnectionState State
  {
    get { return m_rConnection.State; }
  }

  public void myServicedComponentConnect(string ConnectionString)
  {
    m_rConnection = new SqlConnection(ConnectionString);
    m_rConnection.Open();
  }

  public void myServicedComponentClose()
  {
    if (m_rConnection != null)
        m_rConnection.Close();
  }

  public void myServicedComponentDispose()
  {
      if (m_rConnection != null)
          m_rConnection.Dispose();
  }

  public SqlCommand myServicedComponentCreateCommand()
  {
    return new SqlCommand(null, m_rConnection);
  }

  public void myServicedComponentSetComplete()  // to commit changes
  {
    Console.WriteLine("Committing connection's transaction.");
    ContextUtil.SetComplete();
    Console.WriteLine("SetComplete");
  }

  public void myServicedComponentSetAbort()     // to rollback the distributed transaction
  {
    Console.WriteLine("Aborting connection's transaction.");
    ContextUtil.SetAbort();
    Console.WriteLine("SetAbort");
  }
}

public class distribtransaction
{
  public static void Main()
  {
    distribtransaction mydistribtransaction = new distribtransaction();
    mydistribtransaction.Run();
  }

  public void Run()
  {
    SqlCommand mySqlCommand;
    myServicedComponent mySC = new myServicedComponent();


    // The connection string needs "enlist=true", since the sample is using the SqlClient. 
    // This connection string keyword is only for the SqlClient.
    mySC.myServicedComponentConnect("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind;enlist=true");
    Console.WriteLine("connection state is: " + mySC.State);
    mySqlCommand = new SqlCommand(null, mySC.SqlConn);

    try
    {
      // Clean up the database to restore to its original state.
      mySqlCommand.CommandText = "if exists (select * from sysobjects where name = 'TestTable' and type = 'U') drop table TestTable";
      mySqlCommand.ExecuteNonQuery();

      // Create table "TestTable".
      Console.WriteLine("Creating table TestTable.");
      mySqlCommand.CommandText = "create table TestTable (c1 int identity, c2 int)";
      mySqlCommand.ExecuteNonQuery();

      // Create unique index ss on TestTable.
      Console.WriteLine("Creating unique index ss on TestTable.");
      mySqlCommand.CommandText = "create unique index ss on TestTable(c1)";
      mySqlCommand.ExecuteNonQuery();

      // Insert into TestTable values.
      Console.WriteLine("Inserting into TestTable values.");
      mySqlCommand.CommandText = "insert into TestTable values (11)";
      mySqlCommand.ExecuteNonQuery();

      // Commit the transaction.
      mySC.myServicedComponentSetComplete();
    }
    catch (Exception e)
    {
      Console.Write(e.ToString());

      // Rollback the transaction.
      mySC.myServicedComponentSetAbort();
    }
    finally
    {
      mySC.myServicedComponentClose();
    }
  }
}

}
