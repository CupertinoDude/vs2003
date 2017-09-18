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

public class WriteXmlFileSample
{
    public static void Main()
    {
        string document = Environment.GetEnvironmentVariable("TEMP") + "\\newbooksCS.xml";
        WriteXmlFileSample myWriteXmlFileSample = new WriteXmlFileSample();
        myWriteXmlFileSample.Run(document, Environment.CurrentDirectory + "\\books.dtd");
    }

    public void Run(String args, String dtdFile)
    {
        XmlTextWriter myXmlTextWriter = null;
        XmlTextReader myXmlTextReader = null;

        try
        {
            myXmlTextWriter = new XmlTextWriter (args, null);

            myXmlTextWriter.Formatting = Formatting.Indented;
            myXmlTextWriter.WriteStartDocument(false);
            myXmlTextWriter.WriteDocType("bookstore", null, dtdFile, null);
            myXmlTextWriter.WriteComment("This file represents another fragment of a book store inventory database");
            myXmlTextWriter.WriteStartElement("bookstore");
            myXmlTextWriter.WriteStartElement("book", null);
            myXmlTextWriter.WriteAttributeString("genre","autobiography");
            myXmlTextWriter.WriteAttributeString("publicationdate","1979");
            myXmlTextWriter.WriteAttributeString("ISBN","0-7356-0562-9");
            myXmlTextWriter.WriteElementString("title", null, "The Autobiography of Mark Twain");
            myXmlTextWriter.WriteStartElement("Author", null);
            myXmlTextWriter.WriteElementString("first-name", "Mark");
            myXmlTextWriter.WriteElementString("last-name", "Twain");
            myXmlTextWriter.WriteEndElement();
            myXmlTextWriter.WriteElementString("price", "7.99");
            myXmlTextWriter.WriteEndElement();
            myXmlTextWriter.WriteEndElement();

            //Write the XML to file and close the writer
            myXmlTextWriter.Flush();
            myXmlTextWriter.Close();

            // Read the file back in and parse to ensure well formed XML
            myXmlTextReader = new XmlTextReader (args);
            FormatXml (myXmlTextReader, args);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

        finally
        {
            Console.WriteLine();
            Console.WriteLine("Processing of the file {0} complete.", args);
            if (myXmlTextReader != null)
                myXmlTextReader.Close();
            //Close the writer
            if (myXmlTextWriter != null)
                myXmlTextWriter.Close();
        }
    }

    private static void FormatXml (XmlTextReader reader, String filename)
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

        // Display the Statistics for the file
        Console.WriteLine ();
        Console.WriteLine("Statistics for {0} file", filename);
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
    private static void Format(XmlReader reader, String NodeType)
    {
        // Format the output
        Console.Write(reader.Depth + " ");
        Console.Write(reader.AttributeCount + " ");

        for (int i=0; i < reader.Depth; i++)
        {
            Console.Write('\t');
        }

        Console.Write(reader.Prefix + NodeType + "<" + reader.Name + ">" + reader.Value);
        Console.WriteLine();
    }

} // End class WriteXmlFileSample
} // End namespace HowTo.Samples.XML
