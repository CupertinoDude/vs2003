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

public class relationaldata
  public shared sub Main()
    Dim myrelationaldata as relationaldata
    myrelationaldata = new relationaldata()
    myrelationaldata.Run()
  end sub

  public sub Run()
    Dim myDataSet as DataSet
    Dim myConnection as SqlConnection
    Dim mySqlDataAdapter1 as SqlDataAdapter
    Dim mySqlDataAdapter2 as SqlDataAdapter

    myDataSet = new DataSet()


    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlDataAdapter1 = new SqlDataAdapter("select * from customers", myConnection)
    mySqlDataAdapter2 = new SqlDataAdapter("select * from orders", myConnection)

    try
      mySqlDataAdapter1.Fill(myDataSet,"Customers")
      mySqlDataAdapter2.Fill(myDataSet,"Orders")

      ' ADD RELATION
      myDataSet.Relations.Add("CustOrders",myDataSet.Tables("Customers").Columns("CustomerId"),myDataSet.Tables("Orders").Columns("CustomerId"))

      ' Iterate over data of Customers and their orders
      Dim myDataRow1 as DataRow
      for each myDataRow1 in myDataSet.Tables("Customers").Rows
        Console.WriteLine("Customer: " + myDataRow1("ContactName").ToString())

        ' Iterate over orders data
        Dim myDataRow2 as DataRow
        for each myDataRow2 in myDataRow1.GetChildRows(myDataSet.Relations("CustOrders"))
          Console.WriteLine("Order # " + myDataRow2("OrderId").ToString())
        next

        Console.WriteLine()
      next
    catch e as Exception
      Console.WriteLine(e.ToString())
    Finally
      myConnection.Close()
    end try
  end sub
end class

end namespace



