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
using System.Xml;
using System.Xml.XPath;

public class XmlNodeReaderSample
{
    private const String document = "books.xml";

    public static void Main()
    {
        XmlNodeReaderSample myXmlNodeReaderSample = new XmlNodeReaderSample();
        myXmlNodeReaderSample.Run(document);
    }

    public void Run(String arg)
    {
        try
        {
            // Load the XML from file
            Console.WriteLine ();
            Console.WriteLine ("Loading file {0} ...", arg);

            XmlDocument myXmlDocument = new XmlDocument();
            myXmlDocument.Load (arg);

            Console.WriteLine ("XmlDocument loaded with XML data successfully ...");

            Console.WriteLine();
            Console.WriteLine("Create an XmlNodeReader to show the third book ...");
            Console.WriteLine();

            XmlNodeReader myXmlNodeReader = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[3]"));
            FormatXml (myXmlNodeReader);

            Console.WriteLine ();
            Console.WriteLine ("Create an XmlNodeReader to show the second book ... ");
            Console.WriteLine ();

            myXmlNodeReader = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[2]"));

            myXmlNodeReader.Read();
            Console.WriteLine (myXmlNodeReader.ReadInnerXml());

        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

    private static void FormatXml (XmlNodeReader reader)
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
    private static void Format(XmlNodeReader reader, String NodeType)
    {
        // Format the output
        for (int i=0; i < reader.Depth; i++)
        { 
            Console.Write('\t');
        }

        Console.Write(NodeType + "<" + reader.Name + ">" + reader.Value);
        Console.WriteLine();
    }

} // End class XMLNodeReaderSample
} // End namespace HowTo.Samples.XML

