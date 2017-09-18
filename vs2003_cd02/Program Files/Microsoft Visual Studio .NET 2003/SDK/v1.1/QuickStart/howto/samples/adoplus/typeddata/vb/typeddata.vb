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
Imports customerDataSet
Imports Microsoft.VisualBasic

namespace HowTo.Samples.ADONET

public class typeddata
  public shared sub Main()
    Dim mytypeddata as typeddata
    mytypeddata = new typeddata()
    mytypeddata.Run()
  end sub

  public sub Run()

    Dim mySqlDataAdapter As SqlDataAdapter = New SqlDataAdapter("Select * from customers", "server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")

    try
      Dim myCustDS As New custDS()
      mySqlDataAdapter.Fill(myCustDS, "Customers")

      Console.WriteLine("CustomerID" & Chr(10))

      Dim myDataRow as custDS.customersRow
      For Each myDataRow in myCustDS.customers
        Console.WriteLine(myDataRow.CustomerID)
      Next
    catch e as Exception
      Console.Write(e.ToString())
    end try
  end Sub
end class

end namespace
