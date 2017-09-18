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
Imports System.XML

namespace HowTo.Samples.ADONET

public class xmlfromsqlsrv
  public shared sub Main()
    Dim myxmlfromsqlsrv as xmlfromsqlsrv
    myxmlfromsqlsrv = new xmlfromsqlsrv()
    myxmlfromsqlsrv.Run()
  end sub

  public sub Run()

    Dim sConnection as String = "server=(local)\NetSDK;Integrated Security=SSPI;database=northwind"
    Dim mySqlConnection as SqlConnection = new SqlConnection(sConnection)
    Dim mySqlCommand as SqlCommand = new SqlCommand("select * from customers FOR XML AUTO, XMLDATA", mySqlConnection)
    mySqlCommand.CommandTimeout = 15

    try
      mySqlConnection.Open()

      ' Now create the DataSet and fill it with xml data.
      Dim myDataSet1 as DataSet = new DataSet()
      myDataSet1.ReadXml(mySqlCommand.ExecuteXmlReader(), XmlReadMode.Fragment)

      ' Modify to match the other dataset
      myDataSet1.DataSetName = "NewDataSet"


      ' Get the same data through the provider.
      Dim mySqlDataAdapter as SqlDataAdapter = new SqlDataAdapter("select * from customers", sConnection)
      Dim myDataSet2 as DataSet = new DataSet()
      mySqlDataAdapter.Fill(myDataSet2)

      ' Write data to files: data1.xml and data2.xml.
      myDataSet1.WriteXml("data1.xml")
      myDataSet2.WriteXml("data2.xml")
      Console.WriteLine ("Data has been writen to the output files: data1.xml and data2.xml")
      Console.WriteLine ()
      Console.WriteLine ("********************data1.xml********************")
      Console.WriteLine (myDataSet1.GetXml())
      Console.WriteLine ()
      Console.WriteLine ("********************data2.xml********************")
      Console.WriteLine (myDataSet2.GetXml())
    catch e as Exception
      Console.Write(e.ToString())
    finally
      mySqlConnection.Close()
    end try
  end sub
end class

end namespace




