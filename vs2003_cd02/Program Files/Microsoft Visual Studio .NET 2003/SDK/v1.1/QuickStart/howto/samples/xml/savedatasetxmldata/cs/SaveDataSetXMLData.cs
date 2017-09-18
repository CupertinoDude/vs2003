//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

namespace HowTo.Samples.XML
{

using System;
using System.IO;
using System.Data;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;

public class SaveDataSetXMLDataSample
{

    public static void Main()
    {
        SaveDataSetXMLDataSample mySaveDataSetXMLDataSample = new SaveDataSetXMLDataSample();
        mySaveDataSetXMLDataSample.Run();
    }

    public void Run()
    {
        try
        {
            // Load the DataSet with relation data
            DataSet myDataSet = new DataSet();
            LoadDataSet(myDataSet);

            DisplayTables(myDataSet);

            String xmlFile = Environment.GetEnvironmentVariable("TEMP") + 
                 "\\PersonPetCS.xml";
            String schemaFile = Environment.GetEnvironmentVariable("TEMP") +
                 "\\PersonPetCS.xsd";

            // Write out schema representation
            myDataSet.WriteXmlSchema(schemaFile);

            // Write out XML data form relational data
            myDataSet.WriteXml(xmlFile, XmlWriteMode.IgnoreSchema);

            // Create an XmlDataDocument for the DataSet
            XmlDataDocument datadoc = new XmlDataDocument(myDataSet);

            // Display the XML
            DisplayXMLData(datadoc);
        }
        catch (Exception e)
        {
            Console.WriteLine("Exception: {0}", e.ToString());
        }
    }

    // Load a DataSet with relational data
    private void LoadDataSet(DataSet myDataSet)
    {
        try
        {
            Console.WriteLine("Loading the DataSet ...");

            // Set DataSet name
            myDataSet.DataSetName = "PersonPet";

            // Create tables for people and pets
            DataTable people = new DataTable("Person");
            DataTable pets = new DataTable("Pet");

            // Set up the columns in the Tables
            DataColumn personname = new DataColumn ("Name", typeof(String));
            DataColumn personAge = new DataColumn ("Age", typeof(Int32));

            DataColumn petname = new DataColumn ("Name", typeof(String));
            DataColumn pettype = new DataColumn ("Type", typeof(String));

            // Add columns to person table
            DataColumn id = people.Columns.Add("ID", typeof(Int32));
            id.AutoIncrement = true;
            people.PrimaryKey = new DataColumn[] {id};
            people.Columns.Add (personname);
            people.Columns.Add (personAge);

            // Add columns to pet table
            id = pets.Columns.Add("ID", typeof(Int32));
            id.AutoIncrement = true;
            pets.PrimaryKey = new DataColumn[] {id};
            id.AutoIncrement = true;
            DataColumn ownerid = pets.Columns.Add("OwnerID", typeof(Int32));
            DataColumn[] foreignkey = new DataColumn[] {ownerid};
            pets.Columns.Add (petname);
            pets.Columns.Add (pettype);

            // Add tables to the DataSet
            myDataSet.Tables.Add (people);
            myDataSet.Tables.Add (pets);

            // Add people
            DataRow mark = people.NewRow();
            mark[personname] = "Mark";
            mark[personAge] = 18;
            people.Rows.Add(mark);

            DataRow william = people.NewRow();
            william[personname] = "William";
            william[personAge] = 12;
            people.Rows.Add(william);

            DataRow james = people.NewRow();
            james[personname] = "James";
            james[personAge] = 7;
            people.Rows.Add(james);

            DataRow levi = people.NewRow();
            levi[personname] = "Levi";
            levi[personAge] = 4;
            people.Rows.Add(levi);

            // Add relationships
            Console.WriteLine("Creating relationships between people and pets ...");
            DataRelation personpetrel = new DataRelation ("PersonPet",
                people.PrimaryKey, foreignkey);
            myDataSet.Relations.Add (personpetrel);

            // Add pets
            DataRow row = pets.NewRow();
            row["OwnerID"] = mark["ID"];
            row[petname] = "Frank";
            row[pettype] = "cat";
            pets.Rows.Add(row);

            row = pets.NewRow();
            row["OwnerID"] = william["ID"];
            row[petname] = "Rex";
            row[pettype] = "dog";
            pets.Rows.Add(row);

            row = pets.NewRow();
            row["OwnerID"] = james["ID"];
            row[petname] = "Cottontail";
            row[pettype] = "rabbit";
            pets.Rows.Add(row);

            row = pets.NewRow();
            row["OwnerID"] = levi["ID"];
            row[petname] = "Sid";
            row[pettype] = "snake";
            pets.Rows.Add(row);

            row = pets.NewRow();
            row["OwnerID"] = levi["ID"];
            row[petname] = "Tickles";
            row[pettype] = "spider";
            pets.Rows.Add(row);

            row = pets.NewRow();
            row["OwnerID"] = william["ID"];
            row[petname] = "Tweetie";
            row[pettype] = "canary";
            pets.Rows.Add(row);

            // commit changes
            myDataSet.AcceptChanges();
        }

        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

    // Display the contents of the DataSet
    internal void DisplayTables(DataSet myDataSet)
    {
        try
        {
            if (myDataSet == null)
            {
                Console.WriteLine("The DataSet is null");
                return;
            }

            Console.WriteLine("\r\nDataSet: \r\n{0} contains ...", myDataSet.DataSetName);

            // Navigate Dataset
            Console.WriteLine("No of Tables: {0}  Table content ...\r\n", 
                myDataSet.Tables.Count);
            foreach(DataTable table in myDataSet.Tables)
            {
                Console.WriteLine("TableName = " + table.TableName);
                Console.WriteLine ("{0}", "---------");
                Console.WriteLine("Columns ...\r\n");
                foreach(DataColumn column in table.Columns)
                {
                    Console.Write("{0,-22}",column.ColumnName);
                }
                Console.WriteLine("\r\nNumber of rows = " + table.Rows.Count.ToString());
                Console.WriteLine("Rows ...\r\n");
                foreach(DataRow row in table.Rows)
                {
                    foreach(Object value in row.ItemArray)
                    {
                        Console.Write("{0,-22}",value.ToString());
                    }
                    Console.WriteLine();
                }
                Console.WriteLine();
            }

            // What relationships are there?

            for (int i = 0; i < myDataSet.Relations.Count; i++)
            {
                Console.WriteLine(myDataSet.Relations[i].RelationName);
            }

            Console.WriteLine();

            // Who owns which pets ?
            foreach (DataRow person in myDataSet.Tables["Person"].Rows)
            {
                Console.WriteLine ("Name = {0} owns", person["Name"]);
                foreach (DataRow personpet in 
                    person.GetChildRows(myDataSet.Relations["PersonPet"]))
                {
                    Console.WriteLine("\tPet = {0} the {1}", 
                        personpet["Name"] ,personpet["Type"]);
                }
                Console.WriteLine();
            }
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }


    // Display data as XML
    internal void DisplayXMLData(XmlDataDocument datadoc)
    {
        XmlNodeReader myXmlNodeReader = null;

        try
        {
            Console.WriteLine("Displaying the XML ...\r\n");
            myXmlNodeReader = new XmlNodeReader (datadoc.SelectSingleNode("/"));
            FormatXml (myXmlNodeReader);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
        finally
        {
            if (myXmlNodeReader != null)
                myXmlNodeReader.Close();
        }
    }

    private static void FormatXml (XmlReader reader)
    {
        while (reader.Read())
        {
            switch (reader.NodeType)
            {
            case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction");
                break;
            case XmlNodeType.DocumentType:
                Format (reader, "DocumentType");
                break;
            case XmlNodeType.Document:
                Format (reader, "Document");
                break;
            case XmlNodeType.Comment:
                Format (reader, "Comment");
                break;
            case XmlNodeType.Element:
                Format (reader, "Element");
                while(reader.MoveToNextAttribute())
                {
                    Format (reader, "Attribute");
                }
                break;
            case XmlNodeType.Text:
                Format (reader, "Text");
                break;
            case XmlNodeType.Whitespace:
                Format (reader, "Whitespace");
                break;
            }
        }
    }

    // Format the output
    private static void Format(XmlReader reader, String NodeType)
    {
        // Format the output
        for (int i=0; i < reader.Depth; i++)
        {
            Console.Write('\t');
        }

        Console.Write(NodeType + "<" + reader.Name + ">" + reader.Value);
        Console.WriteLine();
    }

} // End class SaveDataSetXMLDataSample
} // End namespace HowTo.Samples.XML
