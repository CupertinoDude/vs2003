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

namespace HowTo.Samples.ADONET

public class updatingdata
  public shared sub Main()
    Dim myupdatingdata as updatingdata
    myupdatingdata = new updatingdata()
    myupdatingdata.Run()
  end sub

  public sub Run()
    Dim myConnection as SqlConnection
    Dim mySqlDataAdapter as SqlDataAdapter
    Dim mySqlDataAdapter1 as SqlDataAdapter


    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection)
    mySqlDataAdapter1 = new SqlDataAdapter("select * from orders", myConnection)

    ' Restore database to it's original condition so sample will work correctly.
    Cleanup()

    try
      Dim myDataSet as DataSet = new DataSet()
      Dim myDataRow as DataRow

      ' Create command builder. This line automatically generates the update commands for you, so you don't 
      ' have to provide or create your own.
      Dim myDataRowsCommandBuilder as SqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter)

      ' Set the MissingSchemaAction property to AddWithKey because Fill will not cause primary
      ' key & unique key information to be retrieved unless AddWithKey is specified.
      mySqlDataAdapter.MissingSchemaAction = MissingSchemaAction.AddWithKey
      mySqlDataAdapter1.MissingSchemaAction = MissingSchemaAction.AddWithKey

      mySqlDataAdapter.Fill(myDataSet,"Customers")
      Console.WriteLine("Loaded data from Customers table into dataset.")

      mySqlDataAdapter1.Fill(myDataSet,"Orders")
      Console.WriteLine("Loaded data from Orders  table into dataset.")

      ' ADD RELATION
      myDataSet.Relations.Add("CustOrders",myDataSet.Tables("Customers").Columns("CustomerId"),myDataSet.Tables("Orders").Columns("CustomerId"))

      ' EDIT
      myDataSet.Tables("Customers").Rows(0)("ContactName")="Peach"

      ' ADD
      myDataRow = myDataSet.Tables("Customers").NewRow()
      myDataRow("CustomerId") ="NewID"
      myDataRow("ContactName") = "New Name"
      myDataRow("CompanyName") = "New Company Name"
      myDataSet.Tables("Customers").Rows.Add(myDataRow)
      Console.WriteLine("Inserted new row into Customers.")

      ' Update Database with SqlDataAdapter
      mySqlDataAdapter.Update(myDataSet, "Customers")
      Console.WriteLine("Sent Update to database.")

      Console.WriteLine("DataSet processing has completed successfully!")

    catch e as Exception
      Console.WriteLine(e.ToString())
    end try
  end sub

  public sub Cleanup()
    Dim myConnection as SqlConnection
    Dim CleanupCommand as SqlCommand

    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")

    try
      ' Restore database to it's original condition so sample will work correctly.
      myConnection.Open()
      CleanupCommand = new SqlCommand("DELETE FROM Customers WHERE CustomerId = 'NewID'", myConnection)
      CleanupCommand.ExecuteNonQuery()
    catch e as Exception
      Console.WriteLine(e.ToString())
    finally
      myConnection.Close()
    end try
  end sub

end class

end namespace
