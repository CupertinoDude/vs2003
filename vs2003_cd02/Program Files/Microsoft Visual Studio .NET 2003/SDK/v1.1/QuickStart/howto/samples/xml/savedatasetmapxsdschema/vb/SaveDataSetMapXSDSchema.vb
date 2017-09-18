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

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Data
Imports System.Xml
Imports System.Data.DataSet

Namespace HowTo.Samples.XML

Public Class SaveDataSetMapXSDSchemaSample

    Shared Sub Main
        Dim mySaveDataSetMapXSDSchemaSample As SaveDataSetMapXSDSchemaSample
        mySaveDataSetMapXSDSchemaSample = new SaveDataSetMapXSDSchemaSample()
        mySaveDataSetMapXSDSchemaSample.Run()
    End Sub

    Public Sub Run()
        Try
            ' Load the DataSet with relation data and write out a schema representation
            Dim datadoc As XmlDataDocument = new XmlDataDocument()
            LoadDataSet(datadoc.DataSet)
            DisplayTables(datadoc.DataSet)
            WriteSchema(datadoc)

        Catch e As Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        End Try
     End Sub

    ' Load a DataSet with relational data
    Private Sub LoadDataSet(dataset As DataSet)

        Try
            Console.WriteLine("Loading the DataSet ...")

            ' Set DataSet name
            dataset.DataSetName = "PersonPet"

            ' Create tables for people and pets
            Dim people As DataTable = new DataTable("Person")
            Dim pets As DataTable = new DataTable("Pet")

            ' Set up the columns in the Tables
            Dim personname As DataColumn = new DataColumn ("Name", GetType (System.String))
            Dim personAge As DataColumn = new DataColumn ("Age", GetType (System.Int32))

            Dim petname As DataColumn = new DataColumn ("Name", GetType (System.String))
            Dim pettype As DataColumn = new DataColumn ("Type", GetType (System.String))

            ' Add columns to person table
            Dim id As DataColumn = people.Columns.Add("ID", GetType (System.Int32))
            id.AutoIncrement = true
            Dim primarykey As DataColumn() = new DataColumn() {id}
            people.PrimaryKey = primarykey
            people.Columns.Add (personname)
            people.Columns.Add (personAge)

            ' Add columns to pet table
            id = pets.Columns.Add("ID", GetType (System.Int32))
            id.AutoIncrement = true
            pets.PrimaryKey = new DataColumn() {id}
            id.AutoIncrement = true
            Dim ownerid As DataColumn = pets.Columns.Add("OwnerID", GetType (System.Int32))
            Dim foreignkey As DataColumn() = new DataColumn() {ownerid}
            pets.Columns.Add (petname)
            pets.Columns.Add (pettype)

            ' Add tables to the DataSet
            dataset.Tables.Add (people)
            dataset.Tables.Add (pets)

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
            Dim personpetrel As DataRelation = new DataRelation ("PersonPet", primarykey, foreignkey, false)
            dataset.Relations.Add (personpetrel)

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
            dataset.AcceptChanges()

        Catch e As Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        End Try
    End Sub

    ' Displays the contents of the DataSet tables
    Private Sub DisplayTables(myDataset As DataSet)
        Try
            If myDataset Is Nothing
                Console.WriteLine("The DataSet is null")
                return
            End If

            Console.WriteLine("{0}DataSet: {0}{1} contains ...", Chr(10), myDataset.DataSetName)

            'Navigate Dataset
            Console.WriteLine("No of Tables: {0}  Table content ..." & Chr(10), _
                myDataset.Tables.Count)
            Dim table As DataTable
            For Each table In myDataset.Tables
                Console.WriteLine("TableName = " & table.TableName.ToString())
                Console.WriteLine ("---------")
                Console.WriteLine("Columns ..." & Chr(10))

                Dim column As DataColumn
                For Each column In table.Columns
                    Console.Write("{0,-22}",column.ColumnName.ToString())
                Next

                Console.WriteLine(Chr(10) & "Number of rows = " & table.Rows.Count.ToString())
                Console.WriteLine("Rows ..."& Chr(10))

                Dim row As DataRow
                For Each row In table.Rows

                    Dim value As Object
                    For each value in row.ItemArray
                        Console.Write("{0,-22}",value.ToString())
                    Next
                    Console.WriteLine()
                Next
                Console.WriteLine()
            Next

            ' What relationships are there?

            Dim i As Integer
            For i = 0 To (myDataset.Relations.Count - 1)
                Console.WriteLine(myDataset.Relations(i).RelationName.ToString())
            Next

            Console.WriteLine()

            ' Who owns which pets ?
            Dim person As DataRow
            For Each person In myDataset.Tables("Person").Rows

                Console.WriteLine ("Name = {0} owns", person("Name"))
                Dim personpet As DataRow
                For Each personpet in person.GetChildRows(myDataset.Relations("PersonPet"))
                    Console.WriteLine("{0}Pet = {1} the {2}", _
                        Chr(9), personpet("Name") ,personpet("Type"))
                Next
                Console.WriteLine()
            Next

        catch e As Exception

            Console.WriteLine ("Exception: {0}", e.ToString())
        End Try
    End Sub

    ' Write the schema for the dataset
    Private Sub WriteSchema(datadoc As System.Xml.XmlDataDocument)

        Dim writer As StreamWriter
        Dim mySaveSchema As String = Environment.GetEnvironmentVariable("TEMP") & _
            "\PersonPetVB.xsd"

        Try
            Console.WriteLine("Writing the schema to {0} ...", mySaveSchema)
            writer = new StreamWriter(mySaveSchema)
            datadoc.DataSet.WriteXmlSchema(writer)

        Catch e As Exception
            Console.WriteLine ("Exception: {0}", e.ToString())

        Finally
            If Not writer Is Nothing
                writer.Close()
            End If

        End Try
    End Sub

End Class
End Namespace
