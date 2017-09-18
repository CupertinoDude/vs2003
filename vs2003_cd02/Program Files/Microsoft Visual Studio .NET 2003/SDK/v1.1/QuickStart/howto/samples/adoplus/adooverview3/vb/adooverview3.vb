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

public class adooverview3
  public shared sub Main()
    Dim myadooverview3 as adooverview3
    myadooverview3 = new adooverview3()
    myadooverview3.Run()
  end sub

  public sub Run()
    Dim myReader as SqlDataReader
    Dim mySqlConnection as SqlConnection
    Dim mySqlCommand as SqlCommand


    mySqlConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlCommand = new SqlCommand("select * from customers", mySqlConnection)

    try
      mySqlConnection.Open()
      myReader = mySqlCommand.ExecuteReader()

      Console.Write("Customer ID    ")
      Console.WriteLine("Company Name")

      do while (myReader.Read())
        Console.Write(myReader("CustomerID").ToString() + "    ")
        Console.WriteLine(myReader("CompanyName").ToString())
      loop
    catch e as Exception
      Console.WriteLine(e.ToString())
    finally
      if Not (myReader is Nothing)
        myReader.Close()
      end if

      if (mySqlConnection.State = ConnectionState.Open)
        mySqlConnection.Close()
      end if
    end try
  end sub
end class

end namespace




