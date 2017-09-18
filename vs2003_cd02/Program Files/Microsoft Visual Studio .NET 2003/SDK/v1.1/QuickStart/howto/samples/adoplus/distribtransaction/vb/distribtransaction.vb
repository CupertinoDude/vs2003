'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.EnterpriseServices
Imports Microsoft.VisualBasic

<assembly: System.Reflection.AssemblyKeyFile("distribtransaction.snk")>

namespace HowTo.Samples.ADONET

<TransactionAttribute(TransactionOption.Required)> public class myServicedComponent : Inherits ServicedComponent

  private m_rConnection as SqlConnection

  public sub myServicedComponent()
  end sub

  public function SqlConn as SqlConnection
    return m_rConnection
  end function

  public function State as ConnectionState
    return m_rConnection.State
  end function

  public sub myServicedComponentConnect(ConnectionString as string)
    m_rConnection = new SqlConnection(ConnectionString)
    m_rConnection.Open()
  end sub

  public sub myServicedComponentClose()
    if not (m_rConnection is nothing) then m_rConnection.Close()
  end sub

  public sub myServicedComponentDispose()
    m_rConnection.Dispose()
  end sub

  public function myServicedComponentCreateCommand() as SqlCommand
    return new SqlCommand(Nothing, m_rConnection)
  end function

  public sub myServicedComponentSetComplete()  ' to commit changes
    Console.WriteLine("Committing connection's transaction.")
    ContextUtil.SetComplete()
    Console.WriteLine("SetComplete")
  end sub

  public sub myServicedComponentSetAbort()     ' to rollback the distributed transaction
    Console.WriteLine("Aborting connection's transaction.")
    ContextUtil.SetAbort()
    Console.WriteLine("SetAbort")
  end sub

end class


public class distribtransaction

  public shared sub Main()
    Dim mydistribtransaction as distribtransaction = new distribtransaction()
    mydistribtransaction.Run()
  end sub

  public sub Run()
    Dim mySqlCommand as SqlCommand
    Dim mySC as myServicedComponent = new myServicedComponent()


    ' The connection string needs "enlist=true", since the sample is using the SqlClient. 
    ' This connection string keyword is only for the SqlClient.
    mySC.myServicedComponentConnect("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind;enlist=true")
    Console.WriteLine("connection state is: {0}", mySC.State)
    mySqlCommand = new SqlCommand(Nothing, mySC.SqlConn)

    try
      ' Clean up the database to restore to its original state.
      mySqlCommand.CommandText = "if exists (select * from sysobjects where name = 'TestTable' and type = 'U') drop table TestTable"
      mySqlCommand.ExecuteNonQuery()

      ' Create table "TestTable".
      Console.WriteLine("Creating table TestTable.")
      mySqlCommand.CommandText = "create table TestTable (c1 int identity, c2 int)"
      mySqlCommand.ExecuteNonQuery()

      ' Create unique index ss on TestTable.
      Console.WriteLine("Creating unique index ss on TestTable.")
      mySqlCommand.CommandText = "create unique index ss on TestTable(c1)"
      mySqlCommand.ExecuteNonQuery()

      ' Insert into TestTable values.
      Console.WriteLine("Inserting into TestTable values.")
      mySqlCommand.CommandText = "insert into TestTable values (11)"
      mySqlCommand.ExecuteNonQuery()

      ' Commit the transaction.
      mySC.myServicedComponentSetComplete()
    catch e as Exception
      Console.Write(e.ToString())

      ' Rollback the transaction.
      mySC.myServicedComponentSetAbort()
    finally
      mySC.myServicedComponentClose()
    end try

  end sub
end class

end namespace




