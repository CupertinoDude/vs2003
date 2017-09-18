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
Imports System.Data.SqlClient

namespace HowTo.Samples.ADONET

public class adooverview2
  public shared sub Main()
    Dim myadooverview2 as adooverview2
    myadooverview2 = new adooverview2()
    myadooverview2.Run()
  end sub

  public sub Run()
    Dim Message as String
    Dim myConnection as SqlConnection
    Dim mySqlCommand as SqlCommand
    Dim mySqlCleanup as SqlCommand


    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlCommand = new SqlCommand("INSERT INTO Customers (CustomerId, CompanyName, ContactName, ContactTitle, Address) Values ('ABC','ABC Company', 'John Smith', 'Owner','One My Way')", myConnection)
    mySqlCleanup = new SqlCommand("DELETE FROM Customers WHERE CustomerId = 'ABC'", myConnection)

    try
      myConnection.Open()
      mySqlCleanup.ExecuteNonQuery()  ' remove record that may have been entered previously.
      mySqlCommand.ExecuteNonQuery()
      Message = "New Record inserted into Customers table in northwind."
    catch myException as Exception
      Message= "Couldn't insert record: " + myException.ToString()
    finally
      myConnection.Close()
    end try

    Console.Write(Message)
  end sub
end class

end namespace


