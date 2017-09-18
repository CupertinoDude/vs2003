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

public class XmlReadFromURLSample
{
    // URL to read from
    private const String localURL = "http://localhost/quickstart/howto/samples/Xml/XmlReadFromURL/cs/books.xml";

    public static void Main()
    {
        XmlReadFromURLSample myXmlReadFromURLSample = new XmlReadFromURLSample();
        myXmlReadFromURLSample.Run();
    }

    public void Run()
    {
        XmlTextReader myXmlURLreader = null;

        try
        {
            // Reading XML from a URL
            Console.WriteLine ("Initializing XmlTextReader  ...");
            Console.WriteLine ("Reading from URL: {0}", localURL);

            // Load the XmlTextReader from the URL
            myXmlURLreader = new XmlTextReader (localURL);

            Console.WriteLine ("Processing ...");
            Console.WriteLine ();
            FormatXml(myXmlURLreader);
        }

        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
            Console.WriteLine ("Make sure that, {0} exists", localURL);
        }

        finally
        {
            Console.WriteLine();
            Console.WriteLine("Processing of URL complete.");
            // Finished with XmlTextReader
            if (myXmlURLreader != null)
                myXmlURLreader.Close();
        }
    }

    private static void FormatXml (XmlTextReader reader)
    {
        int declarationCount=0, piCount=0, docCount=0, commentCount=0, elementCount=0, attributeCount=0, textCount=0, whitespaceCount=0;

        while (reader.Read())
        {
            switch (reader.NodeType)
            {
            case XmlNodeType.XmlDeclaration:
                Format (reader, "XmlDeclaration");
                declarationCount++;
                break;
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
        Console.WriteLine("Statistics for URL");
        Console.WriteLine ();
        Console.WriteLine("XmlDeclaration: {0}",declarationCount++);
        Console.WriteLine("ProcessingInstruction: {0}",piCount++);
        Console.WriteLine("DocumentType: {0}",docCount++);
        Console.WriteLine("Comment: {0}",commentCount++);
        Console.WriteLine("Element: {0}",elementCount++);
        Console.WriteLine("Attribute: {0}",attributeCount++);
        Console.WriteLine("Text: {0}",textCount++);
        Console.WriteLine("Whitespace: {0}",whitespaceCount++);
    }
    // Format the output
    private static void Format(XmlTextReader reader, String nodeType)
    {
        // Format the output
        Console.Write(reader.Depth + " ");
        Console.Write(reader.AttributeCount + " ");
        for (int i=0; i < reader.Depth; i++)
        {
            Console.Write('\t');
        }

        Console.Write(nodeType + "<" + reader.Name + ">" + reader.Value);

        // Display the attributes values for the current node
        if (reader.HasAttributes)
        {
            Console.Write(" Attributes:");

            for (int j=0; j < reader.AttributeCount; j++)
            {
                Console.Write(" [{0}] " + reader[j], j);
            }
        }

        Console.WriteLine();
    }

} // End class XmlReadFromURLSample
} // End namespace HowTo.Samples.XML

