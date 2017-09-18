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

public class TransformXMLSample
{
    private const string document1 = "books.xml";
    private const string document2 = "ProcessParametersA.xml";
    private const string document3 = "ProcessParametersB.xml";
    private const string styleSheet1 = "books.xsl";
    private const string styleSheet2 = "StyleSheetGenerator.xsl";

    public static void Main()
    {
        TransformXMLSample myTransformXMLSample = new TransformXMLSample();
        Console.WriteLine("\n\n*********Output from the first transform:*********\n\n");
        String[] args1 = {document1, styleSheet1};
        myTransformXMLSample.Run(args1);
        Console.WriteLine("\n\n*********Output from the second transform:*********\n\n");
        String[] args2 = {document2, styleSheet2};
        myTransformXMLSample.Run(args2);
        Console.WriteLine("\n\n*********Output from the third transform:*********\n\n");
        String[] args3 = {document3, styleSheet2};
        myTransformXMLSample.Run(args3);
    }

    public void Run(String[] args)
    {
        Console.WriteLine();
        Console.WriteLine("Read XML data file, transform and format display ...");
        Console.WriteLine();

        ReadTransform(args);

        Console.WriteLine();
        Console.WriteLine("Read XML data file, transform and write ...");
        Console.WriteLine();

        ReadTransformWrite(args);
        Console.WriteLine();
    }

    public void ReadTransform(String[] args)
    {
        try
        {
            XPathDocument myXPathDocument = new XPathDocument (args[0]);
            XslTransform myXslTransform = new XslTransform();
            myXslTransform.Load(args[1]);
            XmlReader reader = myXslTransform.Transform(myXPathDocument, null, (XmlResolver)null);

            FormatXml(reader);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

    public void ReadTransformWrite(String[] args)
    {
        StreamReader stream = null;

        try
        {
            XPathDocument myXPathDocument = new XPathDocument (args[0]);
            XslTransform myXslTransform = new XslTransform();
            XmlTextWriter writer = new XmlTextWriter("transform.xml", null);
            myXslTransform.Load(args[1]);
            myXslTransform.Transform(myXPathDocument, null, writer, null);

            writer.Close();

            stream = new StreamReader ("transform.xml");
            Console.Write(stream.ReadToEnd());
        }

        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

        finally
        {
            if (stream != null)
                stream.Close();
        }
    }

    private void FormatXml (XmlReader reader)
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
                Boolean flag = false;
                // Do not display whitespace text nodes
                for (int i=0; i < reader.Value.Length; i++)
                {
                    if (!System.Char.IsWhiteSpace(reader.Value[i]))
                        flag = true;
                }
                if(flag)
                    Format (reader, "Text");
                break;
            }
        }
    }

    // Format the output
    private static void Format(XmlReader reader, String nodeType)
    {
        // Format the output
        for (int i=0; i < reader.Depth; i++)
        {
            Console.Write('\t');
        }

        Console.Write(nodeType + "<" + reader.Name + ">" + reader.Value);
        Console.WriteLine();
    }

} // End class TransformXMLSample
} // End namespace HowTo.Samples.XML
