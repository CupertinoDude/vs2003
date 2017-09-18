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
Imports System.Data.OleDb
Imports System.Reflection
Imports Microsoft.VisualBasic

namespace HowTo.Samples.ADONET

public class adorstodataset
  public shared sub Main()
    Dim myadorstodataset as adorstodataset
    myadorstodataset = new adorstodataset()
    myadorstodataset.Run()
  end sub

  public sub Run()
    Dim rsType as Type = Type.GetTypeFromProgID("ADODB.RecordSet")
    Dim rsObj as object = Activator.CreateInstance(rsType)

    Dim constr as String = "server=(local)\NetSDK;Integrated Security=SSPI;database=northwind;provider=sqloledb"
    Dim values as Object() = New Object() {"Region", constr, 0, 1, 512}
    rsType.InvokeMember("Open", BindingFlags.InvokeMethod, Nothing, rsObj, values)

    try
        Dim myDataSet as DataSet = new DataSet()
        Dim adapter as OleDbDataAdapter = new OleDbDataAdapter()
        adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey
        Dim count as Integer = adapter.Fill(myDataSet, rsObj, "ADODB.RecordSet")
        Console.WriteLine("FillCount=" & (count))
        Console.WriteLine()
        Console.WriteLine(myDataSet.GetXml())

    catch e as Exception
      Console.Write(e.ToString())

    finally

      try
        'rsType.InvokeMember("Close", BindingFlags.InvokeMethod, Nothing, rsObj, new object(0))
      catch e as Exception
        Console.Write(e.ToString())
      end try
    end try

  end sub
end class

end namespace

