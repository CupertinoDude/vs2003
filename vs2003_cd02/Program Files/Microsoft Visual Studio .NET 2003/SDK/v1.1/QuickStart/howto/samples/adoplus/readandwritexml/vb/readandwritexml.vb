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

public class readandwritexml
  public shared sub Main()
    Dim myreadandwritexml as readandwritexml
    myreadandwritexml = new readandwritexml()
    myreadandwritexml.Run()
  end sub

  public sub Run()

      Dim myConnection as SqlConnection
      Dim mySqlDataAdapter1 as SqlDataAdapter
      Dim mySqlDataAdapter2 as SqlDataAdapter
      Dim myDataSet as DataSet

      myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
      mySqlDataAdapter1 = new SqlDataAdapter("select * from customers", myConnection)
      mySqlDataAdapter2 = new SqlDataAdapter("select * from orders", myConnection)

      myDataSet = new DataSet()
    try
      mySqlDataAdapter1.Fill(myDataSet,"Customers")
      mySqlDataAdapter2.Fill(myDataSet,"Orders")

      Dim strXMLData as String
      Dim strXMLSchema as String

      strXMLData = myDataSet.GetXml()
      strXMLSchema = myDataSet.GetXmlSchema()

      Console.WriteLine("Select View Source to see XMLSchema")
      Console.WriteLine(strXMLSchema)
      Console.WriteLine("")
      Console.WriteLine("Data")
      Console.WriteLine(strXMLData)
    catch e as Exception
      Console.WriteLine(e.ToString())
    Finally
      myConnection.Close()  	
    end try
  end sub
end class

end namespace
