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

Option strict off

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Data
Imports System.Xml

namespace HowTo.Samples.XML

public class LoadDataSetXMLDataSample

    private const document as string = "books.xml"
    private const myLoadSchema as string = "books.xsd"
    private myXmlDataDocument as XmlDataDocument

    shared sub Main()
        Dim args As String() = {document, myLoadSchema}
        Dim myLoadDataSetXMLDataSample as LoadDataSetXMLDataSample
        myLoadDataSetXMLDataSample = new LoadDataSetXMLDataSample()
        myLoadDataSetXMLDataSample.Run(args)
    end sub

    public sub Run(args As String())
        try
            Console.WriteLine("Creating an XmlDataDocument ...")
            myXmlDataDocument = new XmlDataDocument()
            ParseSchema(args(1))
            DisplayTableStructure()

            myXmlDataDocument.Load(args(0))

            DisplayTables(myXmlDataDocument.DataSet)

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
            If Not myStreamReader Is nothing
                myStreamReader.Close()
            end if

        end try
    end sub

    ' Displays the DataSet tables structure
    private sub DisplayTableStructure()

        Console.WriteLine("Table structure ")
        Console.WriteLine()
        Console.WriteLine("Tables count=" & myXmlDataDocument.DataSet.Tables.Count.ToString())
        Dim i as Integer
        for i = 0 to (myXmlDataDocument.DataSet.Tables.Count - 1)

            Console.WriteLine()
            Console.WriteLine("TableName='" & myXmlDataDocument.DataSet.Tables(i).TableName + "'.")
            Console.WriteLine("Columns count=" & myXmlDataDocument.DataSet.Tables(i).Columns.Count.ToString())

            Dim j As Integer
            for j = 0 to (myXmlDataDocument.DataSet.Tables(i).Columns.Count - 1)
                Console.WriteLine(Strings.chr(9) & "ColumnName='" & myXmlDataDocument.DataSet.Tables(i).Columns(j).ColumnName.ToString() & "', type = " & myXmlDataDocument.DataSet.Tables(i).Columns(j).DataType.ToString())
            Next
        Next

    end sub

    ' Displays the contents of the DataSet tables
    private sub DisplayTables(myDataset as DataSet)

        ' Navigate Dataset
        Console.WriteLine()
        Console.WriteLine("Content of Tables ...")

        Dim table as DataTable
        for each table in myDataset.Tables

            Console.WriteLine("TableName = " & table.TableName.ToString())
            Console.WriteLine ("---------")
            Console.WriteLine("Columns ...")

            Dim column as DataColumn
            for each column in table.Columns

                Console.Write("{0,-22}",column.ColumnName.ToString())
            next
            Console.WriteLine()
            Console.WriteLine("Number of rows = {0}", table.Rows.Count.ToString())
            Console.WriteLine("Rows ...")

            Dim row as DataRow
            for each row in table.Rows

            Dim value as object
                for each value in row.ItemArray
                    Console.Write("{0,-22}",value.ToString())
                Next
                Console.WriteLine()
            Next
            Console.WriteLine()
        Next
    end sub

end Class
end Namespace

