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

public class handleerrors
  public shared sub Main()
    Dim myhandleerrors as handleerrors
    myhandleerrors = new handleerrors()
    myhandleerrors.Run()
  end sub

  public sub Run()
    ' Create a new Connection and SqlDataAdapter
    Dim myConnection as SqlConnection
    Dim mySqlDataAdapter as SqlDataAdapter

    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection)

    ' Create the new instance of the DataSet
    Dim myDataSet as DataSet
    myDataSet = new DataSet()

    try
      ' Load the customer table from the database into a table called Customers in the dataset
      mySqlDataAdapter.Fill(myDataSet,"Customers")

      ' Create a new dataview instance on the Customers table that was just created
      Dim myDataView as DataView
      myDataView = new DataView(myDataSet.Tables("Customers"))

      ' Sort the view based on the FirstName column
      myDataView.Sort = "CustomerID"

      myDataSet.Tables("Customers").Rows(0).RowError = "An Error was added"
      myDataSet.Tables("Customers").Rows(1).RowError = "This is another error message"

      if myDataSet.Tables("Customers").HasErrors then
        Dim ErrDataRows as DataRow()
        ErrDataRows = myDataSet.Tables("Customers").GetErrors()
        Console.WriteLine("DataTable {0} has {1} Error(s)!",myDataSet.Tables("Customers").TableName,ErrDataRows.Length.ToString())

        Dim i as integer
        for i = 0 to ErrDataRows.Length -1
          Console.WriteLine("Row Error for row {0} --  Error Msg={1}",ErrDataRows(i)("CustomerID").ToString(),ErrDataRows(i).RowError)
        next
      else
        Console.WriteLine("=================")
        Console.WriteLine("DataTable {0} Has no errors", myDataSet.Tables("Customers").TableName)
      end if
    catch e as Exception
      Console.WriteLine(e.ToString())
    Finally
      myConnection.Close()
    end try
  end sub
end class

end namespace

