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

public class gettingdata
  public shared sub Main()
    Dim mygettingdata as gettingdata
    mygettingdata = new gettingdata()
    mygettingdata.Run()
  end sub

  public sub Run()
    Dim myConnection as SqlConnection
    Dim mySqlDataAdapter as SqlDataAdapter

    try
      Dim myDataSet as DataSet = new DataSet()

      myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
      mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection)

      mySqlDataAdapter.Fill(myDataSet,"Customers")

      Dim myDataRow as DataRow
      For Each myDataRow In myDataSet.Tables("Customers").Rows
        Console.WriteLine(myDataRow("CustomerId").ToString())
      Next
    catch e as Exception
      Console.WriteLine(e.ToString())
    Finally
	myConnection.Close()
    end try
  end sub
end class

end namespace




