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

using System;
using System.IO;
using System.Data;
using System.Xml;

namespace HowTo.Samples.XML
{

public class LoadDataSetXMLDataSample
{
    private const String document = "books.xml";
    private const String myLoadSchema = "books.xsd";
    private XmlDataDocument myXmlDataDocument;

    public static void Main()
    {
        String[] args = {document, myLoadSchema};
        LoadDataSetXMLDataSample myLoadDataSetXMLDataSample = new LoadDataSetXMLDataSample();
        myLoadDataSetXMLDataSample.Run(args);
    }

    public void Run(String[] args)
    {
        try
        {
            Console.WriteLine("Creating an XmlDataDocument ...");
            myXmlDataDocument = new XmlDataDocument();
            ParseSchema(args[1]);
            DisplayTableStructure();

            myXmlDataDocument.Load(args[0]);

            DisplayTables(myXmlDataDocument.DataSet);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

    // Loads a specified schema into the DataSet
    public void ParseSchema(String schema)
    {
        StreamReader myStreamReader = null;

        try
        {
            Console.WriteLine("Reading Schema file ...");
            myStreamReader = new StreamReader(schema);
            myXmlDataDocument.DataSet.ReadXmlSchema(myStreamReader);
        }

        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

        finally
        {
            if (myStreamReader != null)
                myStreamReader.Close();
        }
    }

    // Displays the DataSet tables structure
    private void DisplayTableStructure()
    {
        Console.WriteLine("Table structure \r\n");
        Console.WriteLine("Tables count=" + myXmlDataDocument.DataSet.Tables.Count.ToString());
        for (int i = 0; i < myXmlDataDocument.DataSet.Tables.Count; i++)
        {
            Console.WriteLine("\r\nTableName='" + myXmlDataDocument.DataSet.Tables[i].TableName + "'.");
            Console.WriteLine("Columns count=" + myXmlDataDocument.DataSet.Tables[i].Columns.Count.ToString());

            for (int j = 0; j < myXmlDataDocument.DataSet.Tables[i].Columns.Count; j++)
            {
                Console.WriteLine("\tColumnName='" + myXmlDataDocument.DataSet.Tables[i].Columns[j].ColumnName + "', type = " + myXmlDataDocument.DataSet.Tables[i].Columns[j].DataType.ToString());
            }
        }
    }

    // Displays the contents of the DataSet tables
    private void DisplayTables(DataSet dataset)
    {
        // Navigate Dataset
        Console.WriteLine("\r\nContent of Tables ...");

        foreach(DataTable table in dataset.Tables)
        {
            Console.WriteLine("TableName = " + table.TableName);
            Console.WriteLine ("{0}", "---------");
            Console.WriteLine("Columns ...");

            foreach(DataColumn column in table.Columns)
            {
                Console.Write("{0,-22}",column.ColumnName);
            }
            Console.WriteLine("\r\nNumber of rows = {0}", table.Rows.Count.ToString());
            Console.WriteLine("Rows ...");

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
    }

} // End class LoadDataSetXMLDataSample
} // End namespace HowTo.Samples.XML
