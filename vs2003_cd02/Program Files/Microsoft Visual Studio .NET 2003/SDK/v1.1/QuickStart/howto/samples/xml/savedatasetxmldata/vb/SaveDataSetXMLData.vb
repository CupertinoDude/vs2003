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
Imports System.Data
Imports System.Xml
Imports System.Xml.Xsl

Namespace HowTo.Samples.XML

Public Class SaveDataSetXMLDataSample

    Shared Sub Main
        Dim mySaveDataSetXMLDataSample As SaveDataSetXMLDataSample
        mySaveDataSetXMLDataSample = new SaveDataSetXMLDataSample()
        mySaveDataSetXMLDataSample.Run()
    End Sub

    Public Sub Run()
        Try
            'Load the DataSet with relation data
            Dim myDataSet As DataSet = new DataSet()
            LoadDataSet(myDataSet)

            DisplayTables(myDataSet)

            Dim xmlFile As String = _
                Environment.GetEnvironmentVariable("TEMP") & "\\PersonPetVB.xml"
            Dim schemaFile As String = _
                Environment.GetEnvironmentVariable("TEMP") & "\\PersonPetVB.xsd"

            'Write out schema representation
            myDataSet.WriteXmlSchema(schemaFile)

            'Write out XML data form relational data
            myDataSet.WriteXml(xmlFile, XmlWriteMode.IgnoreSchema)

            'Create an XmlDataDocument for the DataSet
            Dim datadoc As XmlDataDocument = new System.Xml.XmlDataDocument(myDataSet)

            'Display the XML
            DisplayXMLData(datadoc)
        Catch e As Exception
            Console.WriteLine("Exception: " & e.ToString())
        End Try
    End Sub

    ' Load a DataSet with relational data
    Private Sub LoadDataSet(myDataSet As DataSet)

        Try
            Console.WriteLine("Loading the DataSet ...")

            ' Set DataSet name
            myDataSet.DataSetName = "PersonPet"

            ' Create tables for people and pets
            Dim people As DataTable = New DataTable("Person")
            Dim pets As DataTable = New DataTable("Pet")

            ' Set up the columns in the Tables
            Dim personname As DataColumn = New DataColumn ("Name", GetType (System.String))
            Dim personAge As DataColumn = New DataColumn ("Age", GetType (System.Int32))

            Dim petname As DataColumn = New DataColumn ("Name", GetType (System.String))
            Dim pettype As DataColumn = New DataColumn ("Type", GetType (System.String))

            ' Add columns to person table
            Dim id As DataColumn = people.Columns.Add("ID", GetType (System.Int32))
            id.AutoIncrement = true
            Dim primarykey As DataColumn() = New DataColumn() {id}
            people.PrimaryKey = primarykey
            people.Columns.Add (personname)
            people.Columns.Add (personAge)

            ' Add columns to pet table
            id = pets.Columns.Add("ID", GetType (System.Int32))
            id.AutoIncrement = true
            pets.PrimaryKey = new DataColumn() {id}
            id.AutoIncrement = true
            Dim ownerid As DataColumn = pets.Columns.Add("OwnerID", GetType (System.Int32))
            Dim foreignkey As DataColumn() = New DataColumn() {ownerid}
            pets.Columns.Add (petname)
            pets.Columns.Add (pettype)

            ' Add tables to the DataSet
            myDataSet.Tables.Add (people)
            myDataSet.Tables.Add (pets)

            ' Add people
            Dim mark As DataRow = people.NewRow()
            mark(personname) = "Mark"
            mark(personAge) = 18
            people.Rows.Add(mark)

            Dim william As DataRow = people.NewRow()
            william(personname) = "William"
            william(personAge) = 12
            people.Rows.Add(william)

            Dim james As DataRow = people.NewRow()
            james(personname) = "James"
            james(personAge) = 7
            people.Rows.Add(james)

            Dim levi As DataRow = people.NewRow()
            levi(personname) = "Levi"
            levi(personAge) = 4
            people.Rows.Add(levi)

            ' Add relationships
            Console.WriteLine("Creating relationships between people and pets ...")
            Dim personpetrel As DataRelation = New DataRelation ("PersonPet", primarykey, foreignkey, false)
            myDataSet.Relations.Add (personpetrel)

            ' Add pets
            Dim row As DataRow = pets.NewRow()
            row("OwnerID") = mark("ID")
            row(petname) = "Frank"
            row(pettype) = "cat"
            pets.Rows.Add(row)

            row = pets.NewRow()
            row("OwnerID") = william("ID")
            row(petname) = "Rex"
            row(pettype) = "dog"
            pets.Rows.Add(row)

            row = pets.NewRow()
            row("OwnerID") = james("ID")
            row(petname) = "Cottontail"
            row(pettype) = "rabbit"
            pets.Rows.Add(row)

            row = pets.NewRow()
            row("OwnerID") = levi("ID")
            row(petname) = "Sid"
            row(pettype) = "snake"
            pets.Rows.Add(row)

            row = pets.NewRow()
            row("OwnerID") = levi("ID")
            row(petname) = "Tickles"
            row(pettype) = "spider"
            pets.Rows.Add(row)

            row = pets.NewRow()
            row("OwnerID") = william("ID")
            row(petname) = "Tweetie"
            row(pettype) = "canary"
            pets.Rows.Add(row)

            ' commit changes
            myDataSet.AcceptChanges()

        Catch e As Exception
            Console.WriteLine("Exception: " & e.ToString())
        End Try
    End Sub


    'Display the contents of the DataSet
    Private Sub DisplayTables(myDataset As DataSet)
        Try
            If myDataset Is Nothing
                Console.WriteLine("The DataSet is null")
                return
            End If

            Console.WriteLine("{0}DataSet: {0}{1} contains ...", Chr(10), myDataset.DataSetName)

            'Navigate Dataset
            Console.WriteLine("No of Tables: {0}  Table content ..." & Chr(10),  myDataset.Tables.Count.ToString())
            Dim table As DataTable
            For Each table In myDataset.Tables
                Console.WriteLine("TableName = " & table.TableName.ToString())
                Console.WriteLine ("{0}", "---------")
                Console.WriteLine("Columns ..." & Chr(10))

                Dim column As DataColumn
                For Each column In table.Columns
                    Console.Write("{0,-22}",column.ColumnName)
                Next

                Console.WriteLine(Chr(10) & "Number of rows = " & table.Rows.Count.ToString())
                Console.WriteLine("Rows ..." & Chr(10))

                Dim row As DataRow
                For Each row In table.Rows
                    Dim value As object
                    For Each value In row.ItemArray
                        Console.Write("{0,-22}",value.ToString())
                    Next
                    Console.WriteLine()
                Next

                Console.WriteLine()
            Next

            'What relationships are there?

            Dim i As Integer
            For i = 0 to (myDataset.Relations.Count - 1)
                Console.WriteLine(myDataset.Relations(i).RelationName.ToString())
            Next

            Console.WriteLine()

            'Who owns which pets ?
            Dim person As DataRow
            For Each person In myDataset.Tables("Person").Rows
                Console.WriteLine ("Name = {0} owns", person("Name"))

                Dim personpet As DataRow
                For Each personpet In person.GetChildRows( myDataset.Relations("PersonPet"))
                    Console.WriteLine("{0}Pet = {1} the {2}", Chr(9), personpet("Name") ,personpet("Type"))
                Next

                Console.WriteLine()
            Next

        Catch e As Exception
            Console.WriteLine("Exception: " & e.ToString())
        End Try
    End Sub


    'Display data As XML
    Private Sub DisplayXMLData(datadoc As XmlDataDocument)
        Dim myXmlNodeReader As XmlNodeReader = nothing

        Try
            Console.WriteLine("Displaying the XML ...")
            Console.WriteLine()

            myXmlNodeReader = New XmlNodeReader (datadoc.SelectSingleNode("/"))
            FormatXml (myXmlNodeReader)
        Catch e As Exception
            Console.WriteLine("Exception: " & e.ToString())
        Finally
            If Not myXmlNodeReader Is Nothing
                myXmlNodeReader.Close()
            End If
        End Try
    End Sub

    Private Sub FormatXml (reader As XmlReader)

        While (reader.Read())

        Select Case reader.NodeType

            Case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction")

            Case XmlNodeType.DocumentType:
                Format (reader, "DocumentType")

            Case XmlNodeType.Document:
                Format (reader, "Document")

            Case XmlNodeType.Comment:
                Format (reader, "Comment")

            Case XmlNodeType.Element:
                Format (reader, "Element")
                While(reader.MoveToNextAttribute())
                    Format (reader, "Attribute")
                End While

            Case XmlNodeType.Text:
                Format (reader, "Text")

            Case XmlNodeType.Whitespace:
                Format (reader, "Whitespace")

            End Select
    End While

    End Sub

    'Format the output
    Private Sub Format (reader As XmlReader, NodeType As String)

        Dim value As String = System.String.Empty
        Dim i As long
        For i=0 To (reader.Depth - 1)
            Console.Write(Chr(9))
        Next

        If (reader.HasValue)
            value = reader.Value
        End If

        Console.WriteLine(NodeType & "<" & reader.Name & ">" + value)
    End Sub

End Class
End Namespace