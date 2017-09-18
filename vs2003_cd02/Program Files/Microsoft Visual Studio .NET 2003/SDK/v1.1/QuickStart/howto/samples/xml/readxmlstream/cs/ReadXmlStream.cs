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

public class ReadXmlStreamSample
{
    public static void Main()
    {
        ReadXmlStreamSample myReadXmlStreamSample = new ReadXmlStreamSample();
        myReadXmlStreamSample.Run();
    }

    public void Run()
    {
        StringReader stream;
        XmlTextReader reader = null;

        try
        {
            Console.WriteLine ("Initializing StringReader ...");

            stream = new StringReader("<?xml version='1.0'?>" +
                                      "<!-- This file represents a fragment of a book store inventory database -->" +
                                      "<bookstore>" +
                                      " <book genre=\"autobiography\" publicationdate=\"1981\" ISBN=\"1-861003-11-0\">" +
                                      "   <title>The Autobiography of Benjamin Franklin</title>" +
                                      "   <author>" +
                                      "       <first-name>Benjamin</first-name>" +
                                      "       <last-name>Franklin</last-name>" +
                                      "   </author>" +
                                      "   <price>8.99</price>" +
                                      " </book>" +
                                      " <book genre=\"novel\" publicationdate=\"1967\" ISBN=\"0-201-63361-2\">" +
                                      "   <title>The Confidence Man</title>" +
                                      "   <author>" +
                                      "       <first-name>Herman</first-name>" +
                                      "       <last-name>Melville</last-name>" +
                                      "   </author>" +
                                      "   <price>11.99</price>" +
                                      " </book>" +
                                      "  <book genre=\"philosophy\" publicationdate=\"1991\" ISBN=\"1-861001-57-6\">" +
                                      "   <title>The Gorgias</title>" +
                                      "   <author>" +
                                      "       <name>Plato</name>" +
                                      "   </author>" +
                                      "   <price>9.99</price>" +
                                      " </book>" +
                                      "</bookstore>");

            // Load the XmlTextReader from the stream
            reader = new XmlTextReader (stream);

            Console.WriteLine ("Processing ...");
            Console.WriteLine ();
            FormatXml(reader);
        }

        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

        finally
        {
            Console.WriteLine();
            Console.WriteLine("Processing of stream complete.");
            // Finished with XmlTextReader
            if (reader != null)
                reader.Close();
        }
    }

private static void FormatXml (XmlReader reader)
{
    int piCount=0, docCount=0, commentCount=0, elementCount=0, attributeCount=0, textCount=0, whitespaceCount=0;

    while (reader.Read())
    {
            switch (reader.NodeType)
            {
            case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction");
                piCount++;
                break;
            case XmlNodeType.DocumentType:
                Format (reader, "DocumentType");
                docCount++;
                break;
            case XmlNodeType.Comment:
                Format (reader, "Comment");
                commentCount++;
                break;
            case XmlNodeType.Element:
                Format (reader, "Element");
                while(reader.MoveToNextAttribute())
                {
                    Format (reader, "Attribute");
                }
                elementCount++;
                if (reader.HasAttributes)
                    attributeCount += reader.AttributeCount;
                break;
            case XmlNodeType.Text:
                Format (reader, "Text");
                textCount++;
                break;
            case XmlNodeType.Whitespace:
                whitespaceCount++;
                break;
            }
        }

        // Display the Statistics
        Console.WriteLine ();
        Console.WriteLine("Statistics for stream");
        Console.WriteLine ();
        Console.WriteLine("ProcessingInstruction: {0}",piCount++);
        Console.WriteLine("DocumentType: {0}",docCount++);
        Console.WriteLine("Comment: {0}",commentCount++);
        Console.WriteLine("Element: {0}",elementCount++);
        Console.WriteLine("Attribute: {0}",attributeCount++);
        Console.WriteLine("Text: {0}",textCount++);
        Console.WriteLine("Whitespace: {0}",whitespaceCount++);
    }

    // Format the output
    private static void Format(XmlReader reader, String nodeType)
    {
        // Format the output
        Console.Write(reader.Depth + " ");
        Console.Write(reader.AttributeCount + " ");
        for (int i=0; i < reader.Depth; i++)
        {
            Console.Write('\t');
        }

        Console.Write(nodeType + "<" + reader.Name + ">" + reader.Value);
        Console.WriteLine();
    }

} // End class ReadXmlStreamSample
} // End namespace HowTo.Samples.XML
