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

public class connectionpooling

  public shared sub Main()
    Dim myconnectionpooling as connectionpooling = new connectionpooling()
    myconnectionpooling.Run()
  end sub

  public sub Run()
    try
      
      Dim connString as String

      ' Specification in the connection string:
      ' Please note: Pooling is implicit, you automatically get it unless you disable it. 
      '              Therefore, "true" is the default for the pooling keyword (pooling=true).   
      ' Connection Reset:    False
      ' Connection Lifetime: 5
      ' Enlist:              true
      ' Min Pool Size:       1
      ' Max Pool Size:       50
      connString = "server=(local)\NetSDK;Integrated Security=SSPI;database=northwind;" & _
                   "connection reset=false;" & _
                   "connection lifetime=5;" & _
                   "enlist=true;" & _
                   "min pool size=1;" & _
                   "max pool size=50"

      Dim myConnection1 as SqlConnection = new SqlConnection(connString)
      Dim myConnection2 as SqlConnection = new SqlConnection(connString)
      Dim myConnection3 as SqlConnection = new SqlConnection(connString)

      ' Open two connections. 
      Console.WriteLine ("Open two connections.")
      myConnection1.Open()
      myConnection2.Open()

      ' Now there are two connections in the pool that matches the connection string.
      ' Return the both connections to the pool. 
      Console.WriteLine ("Return both of the connections to the pool.")
      myConnection1.Close()
      myConnection2.Close()

      ' Get a connection out of the pool.
      Console.WriteLine ("Open a connection from the pool.")
      myConnection1.Open()

      ' Get a second connection out of the pool.
      Console.WriteLine ("Open a second connection from the pool.")
      myConnection2.Open()

      ' Open a third connection.
      Console.WriteLine ("Open a third connection.")
      myConnection3.Open()

      ' Return the all connections to the pool.  
      Console.WriteLine ("Return all three connections to the pool.")
      myConnection1.Close()
      myConnection2.Close()
      myConnection3.Close()

    catch e as Exception
      ' Display the error.
      Console.WriteLine(e.ToString())
    end try

  end sub
end class

end namespace




