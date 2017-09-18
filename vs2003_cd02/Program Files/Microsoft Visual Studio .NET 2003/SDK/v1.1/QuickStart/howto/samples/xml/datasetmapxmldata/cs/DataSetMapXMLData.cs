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

public class DataSetMapXMLDataSample
{
    private const String document = "books.xml";

    public static void Main()
    {
        DataSetMapXMLDataSample myDataSetMapXMLDataSample = new DataSetMapXMLDataSample();
        myDataSetMapXMLDataSample.Run(document);
    }

    public void Run(String args)
    {
        try
        {
            Console.WriteLine("Creating an XmlDataDocument ...");
            XmlDataDocument datadoc = new XmlDataDocument();

            // Infer the DataSet schema from the XML data and load the XML Data
            datadoc.DataSet.ReadXml(new StreamReader(args), XmlReadMode.InferSchema);

            DisplayTables(datadoc.DataSet);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

    // Displays the contents of the DataSet tables
    private void DisplayTables(DataSet myDataset)
    {
        // Navigate Dataset
        Console.WriteLine("Content of Tables ...");
        Console.WriteLine();
            
        foreach(DataTable table in myDataset.Tables)
        {
            Console.WriteLine("TableName = " + table.TableName);
            Console.WriteLine ("{0}", "---------");
            Console.WriteLine("Columns ...");

            foreach(DataColumn column in table.Columns)
            {
                Console.Write("{0,-22}",column.ColumnName);
            }
            Console.WriteLine();
            Console.WriteLine("Number of rows = {0}", table.Rows.Count.ToString());
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

} // End class DataSetMapXMLDataSample
} // End namespace HowTo.Samples.XML
