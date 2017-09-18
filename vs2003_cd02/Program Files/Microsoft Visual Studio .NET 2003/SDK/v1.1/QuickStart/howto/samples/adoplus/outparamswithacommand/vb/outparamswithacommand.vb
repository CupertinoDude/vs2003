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

public class outparamswithacommand
  public shared sub Main()
    Dim myoutparamswithacommand as outparamswithacommand
    myoutparamswithacommand = new outparamswithacommand()
    myoutparamswithacommand.Run()
  end sub

  public sub Run()
    Dim MsgString as string

    ' Create a new Connection and SqlDataAdapter
    Dim myConnection as SqlConnection

    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")

    ' Create stored procedure with out parameter
    try
      Dim CreateProcCommand as SqlCommand
      Dim DropProcCommand as SqlCommand
      CreateProcCommand = new SqlCommand("CREATE PROCEDURE GetCompanyName  @CustomerId nchar(5), @CompanyName nchar(40) out as select @CompanyName = CompanyName from Customers where CustomerId = @CustomerId",myConnection)
      DropProcCommand = new SqlCommand("IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetCompanyName' AND type = 'P') DROP PROCEDURE GetCompanyName", myConnection)

      myConnection.Open()
      DropProcCommand.ExecuteNonQuery()   ' remove procedure if it exists
      CreateProcCommand.ExecuteNonQuery() ' create procedure

      Dim myCommand as SqlCommand
      myCommand = new SqlCommand("GetCompanyName", myConnection)
      myCommand.CommandType = CommandType.StoredProcedure

      ' Fill the parameters collection based upon stored procedure
      Dim workParam as SqlParameter

      workParam = myCommand.Parameters.Add("@CustomerID", SqlDbType.NChar, 5)
      ' ParameterDirection.Input is the default for the Direction property. Thus the following line is not
      ' needed here. To set the Direction property to its default value, use the following line.
      'workParam.Direction = ParameterDirection.Input

      workParam = myCommand.Parameters.Add("@CompanyName", SqlDbType.NChar, 40)
      workParam.Direction = ParameterDirection.Output

      myCommand.Parameters("@CustomerID").Value = "ALFKI"

      myCommand.ExecuteNonQuery()
      MsgString = "CompanyName = " + myCommand.Parameters("@CompanyName").Value.ToString()
    catch e as Exception
      MsgString = e.ToString()
    finally
      myConnection.Close()
    end try

    Console.Write(MsgString)
  end sub
end class

end namespace


