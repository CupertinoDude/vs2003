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
using System.Xml;

public class DataSetMapXSDSchemaSample
{
    private const String myLoadSchema = "books.xsd";
    private XmlDataDocument myXmlDataDocument;

    public static void Main()
    {
        DataSetMapXSDSchemaSample myDataSetMapXSDSchemaSample = new DataSetMapXSDSchemaSample();
        myDataSetMapXSDSchemaSample.Run(myLoadSchema);
    }

    public void Run(String args)
    {
        try
        {
            Console.WriteLine("Creating an XmlDataDocument ...");
            myXmlDataDocument = new XmlDataDocument();
            ParseSchema(args);
            DisplayTableStructure();
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
        Console.WriteLine("\r\nTable structure\r\n");
        Console.WriteLine("Tables count=" + myXmlDataDocument.DataSet.Tables.Count.ToString());
        for (int i = 0; i < myXmlDataDocument.DataSet.Tables.Count; i++)
        {
            Console.WriteLine("TableName='" + myXmlDataDocument.DataSet.Tables[i].TableName + "'.");
            Console.WriteLine("Columns count=" + myXmlDataDocument.DataSet.Tables[i].Columns.Count.ToString());

            for (int j = 0; j < myXmlDataDocument.DataSet.Tables[i].Columns.Count; j++)
            {
                Console.WriteLine("\tColumnName='" + myXmlDataDocument.DataSet.Tables[i].Columns[j].ColumnName + "', type = " + myXmlDataDocument.DataSet.Tables[i].Columns[j].DataType.ToString());
            }
            Console.WriteLine();
        }
    }

} // End class DataSetMapXSDSchemaSample
} // End namespace HowTo.Samples.XML
