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

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Xml

namespace HowTo.Samples.XML

public class DataSetMapXSDSchemaSample

    private const myLoadSchema as String = "books.xsd"
    private myXmlDataDocument as XmlDataDocument

    shared sub Main()
        Dim myDataSetMapXSDSchemaSample as DataSetMapXSDSchemaSample
        myDataSetMapXSDSchemaSample = new DataSetMapXSDSchemaSample()
        myDataSetMapXSDSchemaSample.Run(myLoadSchema)
    end sub

    public sub Run(args as String)
        try
            myXmlDataDocument = new XmlDataDocument()
            Console.WriteLine("Creating an XmlDataDocument ...")
            ParseSchema(args)
            DisplayTableStructure()
        catch e as exception
            Console.WriteLine ("Exception: " & e.ToString())
        end try
    end sub

    ' Loads a specified schema into the DataSet
    public sub ParseSchema(schema as string)
        Dim myStreamReader as StreamReader = nothing
        try
            myStreamReader = new StreamReader(schema)
            Console.WriteLine("Reading Schema file ...")
            myXmlDataDocument.DataSet.ReadXmlSchema(myStreamReader)

        catch e as exception
            Console.WriteLine ("Exception: " & e.ToString())

        finally
            If Not myStreamReader Is Nothing
                myStreamReader.Close()
            end if

        end try
    end sub

    ' Displays the DataSet tables structure
    private sub DisplayTableStructure()
        Console.WriteLine()
        Console.WriteLine("Table structure")
        Console.WriteLine()
        Console.WriteLine("Tables count=" & myXmlDataDocument.DataSet.Tables.Count.ToString())

        Dim i,j as integer

        for i = 0 to (myXmlDataDocument.DataSet.Tables.Count - 1)
            Console.WriteLine("TableName='" & myXmlDataDocument.DataSet.Tables(i).TableName & "'.")
            Console.WriteLine("Columns count=" & myXmlDataDocument.DataSet.Tables(i).Columns.Count.ToString())

            for j = 0 to (myXmlDataDocument.DataSet.Tables(i).Columns.Count - 1)
                Console.WriteLine(Strings.chr(9) & "ColumnName='" & myXmlDataDocument.DataSet.Tables(i).Columns(j).ColumnName & "', type = " & myXmlDataDocument.DataSet.Tables(i).Columns(j).DataType.ToString())
            next
            Console.WriteLine()
        next
    end sub

end class
end Namespace
