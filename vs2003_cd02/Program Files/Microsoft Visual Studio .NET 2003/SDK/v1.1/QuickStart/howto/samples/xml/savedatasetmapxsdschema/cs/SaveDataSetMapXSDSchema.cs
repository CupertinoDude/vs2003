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

public class SaveDataSetMapXSDSchemaSample
{

    public static void Main()
    {
        SaveDataSetMapXSDSchemaSample mySaveDataSetMapXSDSchemaSample = 
            new SaveDataSetMapXSDSchemaSample();
        mySaveDataSetMapXSDSchemaSample.Run();
    }

    public void Run()
    {
        try
        {
            // Load the DataSet with relation data and write out a schema representation
            XmlDataDocument datadoc = new XmlDataDocument();
            LoadDataSet(datadoc.DataSet);
            DisplayTables(datadoc.DataSet);
            WriteSchema(datadoc);
        }
        catch (Exception e)
        {
            Console.WriteLine("Exception: {0}", e.ToString());
        }
    }

    // Load a DataSet with relational data
    private void LoadDataSet(DataSet dataset)
    {
        try
        {
            Console.WriteLine("Loading the DataSet ...");

            // Set DataSet name
            dataset.DataSetName = "PersonPet";

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
            dataset.Tables.Add (people);
            dataset.Tables.Add (pets);

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
            dataset.Relations.Add (personpetrel);

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
            dataset.AcceptChanges();
        }

        catch (Exception e)
        {
            Console.WriteLine("Exception: {0}", e.ToString());
        }
    }

    // Display the contents of the DataSet
    internal void DisplayTables(DataSet dataset)
    {
        try
        {
            if (dataset == null)
            {
                Console.WriteLine("The DataSet is null");
                return;
            }

            Console.WriteLine("\r\nDataSet: \r\n{0} contains ...", dataset.DataSetName);

            // Navigate Dataset
            Console.WriteLine("No of Tables: {0}  Table content ...\r\n", 
                dataset.Tables.Count);
            foreach(DataTable table in dataset.Tables)
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
            for (int i = 0; i < dataset.Relations.Count; i++)
            {
                Console.WriteLine(dataset.Relations[i].RelationName);
            }

            Console.WriteLine();

            // Who owns which pets ?
            foreach (DataRow person in dataset.Tables["Person"].Rows)
            {
                Console.WriteLine ("Name = {0} owns", person["Name"]);
                foreach (DataRow personpet in person.GetChildRows(
                    dataset.Relations["PersonPet"]))
                {
                    Console.WriteLine("\tPet = {0} the {1}", 
                        personpet["Name"] ,personpet["Type"]);
                }
                Console.WriteLine();
            }
        }
        catch (Exception e)
        {
            Console.WriteLine("Exception: {0}", e.ToString());
        }
    }

    // Write the schema for the dataset
    internal void WriteSchema(XmlDataDocument datadoc)
    {
        StreamWriter writer = null;
        String mySaveSchema = Environment.GetEnvironmentVariable("TEMP") + 
            "\\PersonPetCS.xsd";

        try
        {
            Console.WriteLine("Writing the schema to {0} ...", mySaveSchema);
            writer = new StreamWriter(mySaveSchema);
            datadoc.DataSet.WriteXmlSchema(writer);
        }

        catch (Exception e)
        {
            Console.WriteLine("Exception: {0}", e.ToString());
        }

        finally
        {
            if (writer != null)
                writer.Close();
        }
    }

} // End class SaveDataSetMapXSDSchemaSample
} // End namespace HowTo.Samples.XML
