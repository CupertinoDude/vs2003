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

Option Strict off

Imports System
Imports System.IO
Imports System.Data
Imports System.Xml

namespace HowTo.Samples.XML

public class DataSetMapXMLDataSample

    private const document as String = "books.xml"

    Shared sub Main
        Dim myDataSetMapXMLDataSample as DataSetMapXMLDataSample
        myDataSetMapXMLDataSample = new DataSetMapXMLDataSample()
        myDataSetMapXMLDataSample.Run(document)
    end sub

    public sub Run(args as String)
        try
            Console.WriteLine("Creating an XmlDataDocument ...")
            Dim datadoc as new System.Xml.XmlDataDocument

            ' Infer the DataSet schema from the XML data and load the XML Data
            datadoc.DataSet.ReadXml(new StreamReader(args), XmlReadMode.InferSchema)

            DisplayTables(datadoc.DataSet)

        catch e as Exception
                Console.WriteLine ("Exception: " & e.toString() )
        end try
    end sub

    ' Displays the contents of the DataSet tables
    private sub DisplayTables(myDataset as DataSet)
        ' Navigate Dataset
        Console.WriteLine("Content of Tables ...")
        Console.writeline()

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
            Console.WriteLine("Number of rows = " & table.Rows.Count.ToString())
            Console.WriteLine("Rows ...")

        Dim row as DataRow
            for each row in table.Rows

        Dim value as Object
                for each value in row.ItemArray
                    Console.Write("{0,-22}",value.ToString())
                next
                Console.WriteLine()
            next
            Console.WriteLine()
        next
    end sub
end class
end Namespace