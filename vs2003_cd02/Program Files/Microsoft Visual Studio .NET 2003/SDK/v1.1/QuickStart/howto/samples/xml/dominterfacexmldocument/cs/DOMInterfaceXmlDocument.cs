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
using System.Xml;

namespace HowTo.Samples.XML
{

public class DOMInterfaceXmlDocumentSample
{
    private const String document = "books.xml";

    public static void Main()
    {
        DOMInterfaceXmlDocumentSample myDOMInterfaceXmlDocumentSample = new DOMInterfaceXmlDocumentSample();
        myDOMInterfaceXmlDocumentSample.Run(document);
    }

    public void Run(String args)
    {
        XmlTextReader reader = null;

        try
        {
            // Load the XML from file
            Console.WriteLine ("Reading file {0} ...", args);
            reader = new XmlTextReader (args);
            reader.WhitespaceHandling = WhitespaceHandling.None;
            Console.WriteLine ("File {0} read sucessfully ...", args);

            // Create an XmlDocument from the XmlTextReader
            XmlDocument myXmlDocument = new XmlDocument();
            myXmlDocument.Load (reader);
            Console.WriteLine ("XmlDocument loaded with XML data successfully ...");

            // Process the supplied XML file
            Console.WriteLine ("Processing ...");
            Console.WriteLine ();

            // Start from the document Element
            DisplayTree(myXmlDocument.DocumentElement);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

        finally
        {
            if (reader != null)
                reader.Close();
        }
    }

    public void DisplayTree(XmlNode node)
    {
        if (node != null)
            Format (node);

        if (node.HasChildNodes)
        {
            node = node.FirstChild;
            while (node != null)
            {
                DisplayTree(node);
                node = node.NextSibling;
            }
        }
    }

    // Format the output
    private void Format (XmlNode node)
    {
        if (!node.HasChildNodes)
        {
            Console.WriteLine("\t" + node.Name + "<" + node.Value + ">");
        }

        else
        {
            Console.Write(node.Name);
            if (XmlNodeType.Element == node.NodeType)
            {
                XmlNamedNodeMap map = node.Attributes;
                foreach (XmlNode attrnode in map)
                    Console.Write(" " + attrnode.Name + "<" + attrnode.Value + "> ");
            }
            Console.WriteLine();
        }
    }

} // End class DOMInterfaceXmlDocumentSample
} // End namespace HowTo.Samples.XML
