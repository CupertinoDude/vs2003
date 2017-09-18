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

public class ReadXmlFileSample
{
    private const string document = "books.xml";

    public static void Main()
    {
        ReadXmlFileSample myReadXmlFileSample = new ReadXmlFileSample();
        myReadXmlFileSample.Run(document);
    }

    public void Run(String args)
    {
        XmlTextReader reader = null;

        try
        {
            // Load the file with an XmlTextReader
            Console.WriteLine ("Reading file {0} ...", args);
            reader = new XmlTextReader (args);
            Console.WriteLine ("File {0} read sucessfully ...", args);

            // Process the supplied XML file
            Console.WriteLine ("Processing ...");
            Console.WriteLine ();
            FormatXml(reader, args);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Failed to read the file {0}", args);
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

        finally
        {
            Console.WriteLine();
            Console.WriteLine("Processing of the file {0} complete.", args);
            // Finished with XmlTextReader
            if (reader != null)
                reader.Close();
        }
    }

    private static void FormatXml (XmlReader reader, String filename)
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

        // Display the Statistics for the file.
        Console.WriteLine ();
        Console.WriteLine("Statistics for {0} file", filename);
        Console.WriteLine ();
        Console.WriteLine("XmlDeclaration: {0}",declarationCount);
        Console.WriteLine("ProcessingInstruction: {0}",piCount);
        Console.WriteLine("DocumentType: {0}",docCount);
        Console.WriteLine("Comment: {0}",commentCount);
        Console.WriteLine("Element: {0}",elementCount);
        Console.WriteLine("Element Attributes: {0}",attributeCount);
        Console.WriteLine("Text: {0}",textCount);
        Console.WriteLine("Whitespace: {0}",whitespaceCount);
    }

    private static void Format(XmlReader reader, String nodeType)
    {
        // Format the output
        Console.Write(reader.Depth + " ");
        Console.Write(reader.AttributeCount + " ");
        for (int i=0; i < reader.Depth; i++)
        {
            Console.Write('\t');
        }

        Console.Write(reader.Prefix + nodeType + "<" + reader.Name + ">" + reader.Value);

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

} // End class ReadXmlFileSample
} // End namespace HowTo.Samples.XML