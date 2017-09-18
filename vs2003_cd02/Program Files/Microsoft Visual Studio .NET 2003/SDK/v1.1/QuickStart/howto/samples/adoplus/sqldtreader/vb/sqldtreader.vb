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
Imports Microsoft.VisualBasic

namespace HowTo.Samples.ADONET

public class sqldtreader
  public shared sub Main()
    Dim mysqldtreader as sqldtreader
    mysqldtreader = new sqldtreader()
    mysqldtreader.Run()
  end sub

  public sub Run()
    Dim myDataReader as SqlDataReader
    Dim mySqlConnection as SqlConnection
    Dim mySqlCommand as SqlCommand


    mySqlConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlCommand = new SqlCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", mySqlConnection)

    try
      mySqlConnection.Open()
      myDataReader = mySqlCommand.ExecuteReader(CommandBehavior.CloseConnection)

      Console.Write("EmployeeID" + Chr(9))
      Console.Write("Name" + Chr(9))
      Console.Write("Title" + Chr(9))
      Console.Write("ReportsTo" + Chr(10))

      ' Always call Read before accessing data.
      do while (myDataReader.Read())
        Console.Write(myDataReader.GetInt32(0).ToString() + Chr(9))
        Console.Write(myDataReader.GetString(2) + " " + myDataReader.GetString(1) + Chr(9))
        Console.Write(myDataReader.GetString(3) + Chr(9))
        if (myDataReader.IsDBNull(4)) then
          Console.Write("N/A" + Chr(10))
        else
          Console.Write(myDataReader.GetInt32(4).ToString() + Chr(10))
        end if
      loop
    catch e as Exception
      Console.Write(e.ToString())
    finally
      ' Always call Close when done reading.
      if Not (myDataReader is Nothing)
        myDataReader.Close()
      end if

      ' Close the connection when done with it.
      if (mySqlConnection.State = ConnectionState.Open)
        mySqlConnection.Close()
      end if
    end try
  end sub
end class

end namespace



