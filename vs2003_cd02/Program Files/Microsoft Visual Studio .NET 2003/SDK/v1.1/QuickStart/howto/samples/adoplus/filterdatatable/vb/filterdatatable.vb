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

public class filterdatatable
  public shared sub Main()
    Dim myfilterdatatable as filterdatatable
    myfilterdatatable = new filterdatatable()
    myfilterdatatable.Run()
  end sub

  public sub Run()
    ' Create a new Connection and SqlDataAdapter
    Dim myConnection as SqlConnection
    Dim mySqlDataAdapter as SqlDataAdapter

    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection)

    try
      ' Create the new instance of the DataSet
      Dim myDataSet as DataSet
      myDataSet = new DataSet()

      ' Load the customer table from the database into a table called Customers in the dataset
      mySqlDataAdapter.Fill(myDataSet,"Customers")

      ' Create a new dataview instance on the Customers table that was just created
      Dim myDataView as DataView
      myDataView = new DataView(myDataSet.Tables("Customers"))

      ' Sort the view based on the FirstName column
      myDataView.Sort = "CustomerID"

      ' Filter the dataview to only show customers with the CustomerID of ALFKI.
      myDataView.RowFilter = "CustomerID='ALFKI'"

      Dim i as integer
      for i = 0 to myDataView.Count -1
        Console.Write(myDataView(i)("CustomerID").ToString() + " - " + myDataView(i)("CompanyName").ToString())
      next
    catch e as Exception
      Console.WriteLine(e.ToString())
    Finally
      myConnection.close()
    end try
  end sub
end class

end namespace



