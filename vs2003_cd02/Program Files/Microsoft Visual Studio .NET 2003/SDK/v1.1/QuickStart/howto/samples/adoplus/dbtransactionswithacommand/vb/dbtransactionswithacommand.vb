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

public class dbtransactionswithacommand
  public shared sub Main()
    Dim mydbtransactionswithacommand as dbtransactionswithacommand
    mydbtransactionswithacommand = new dbtransactionswithacommand()
    mydbtransactionswithacommand.Run()
  end sub

  public sub Run()

    Dim myConnection as SQLConnection = new SQLConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    Dim myCommand as SQLCommand = new SqlCommand()
    Dim myTrans as SqlTransaction

    ' Open the connection.
    myConnection.Open()

    ' Assign the connection property.
    myCommand.Connection  = myConnection

    ' Begin the transaction.
    myTrans = myConnection.BeginTransaction()

    ' Assign transaction object for a pending local transaction
    myCommand.Transaction = myTrans

    try
      ' Restore database to it's original condition so sample will work correctly.
      myCommand.CommandText = "DELETE FROM Region WHERE (RegionID = 100) OR (RegionID = 101)"
      myCommand.ExecuteNonQuery()

      ' Insert the first record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (100, 'MidWestern')"
      myCommand.ExecuteNonQuery()

      ' Insert the second record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (101, 'MidEastern')"
      myCommand.ExecuteNonQuery()

      myTrans.Commit()
      Console.Write("Both Records are written to the database!")
    catch e as Exception
      myTrans.Rollback()
      Console.WriteLine(e.ToString())
      Console.Write("Neither record is written to the database!")
    finally
      myConnection.Close()
    end try
  end sub
end class

end namespace


