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
using System.Xml.Xsl;
using System.Xml.XPath;

public class StreamXmlDocumentSample
{
    private const String document = "books.xml";
    private const String newStyleSheet = "identity.xsl";

    public static void Main()
    {
        String[] args = {document, newStyleSheet};
        StreamXmlDocumentSample myStreamXmlDocumentSample = new StreamXmlDocumentSample();
        myStreamXmlDocumentSample.Run(args);
    }

    public void Run(String[] args)
    {
        XmlReader myXmlReader = null;
        XmlDataDocument myXmlDataDocument = new XmlDataDocument();
        XslTransform myXslTransform = new XslTransform();

        try
        {
            // Load the XML from file
            Console.WriteLine ("Loading file {0} ...", args[0]);
            myXmlDataDocument.Load (args[0]);
            Console.WriteLine ("XmlDataDocument loaded with XML data successfully ...\r\n");

            Console.WriteLine ("Reading XML ...\r\n");
            myXslTransform.Load(args[1]);

            XPathNavigator myXPathNavigator = myXmlDataDocument.CreateNavigator();
            myXmlReader = myXslTransform.Transform(myXPathNavigator, null, (XmlResolver)null);
            FormatXml (myXmlReader);
        }

        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

        finally
        {
            // Close the reader
            if (myXmlReader != null)
                myXmlReader.Close();
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
        Console.Write(reader.Depth + " ");
        Console.Write(reader.AttributeCount + " ");
        for (int i=0; i < reader.Depth; i++)
        {
            Console.Write('\t');
        }

        Console.Write(NodeType + "<" + reader.Name + ">" + reader.Value);
        Console.WriteLine();
    }

} // End class StreamXmlDocumentSample
} // End namespace HowTo.Samples.XML
