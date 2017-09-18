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
using System.Xml.XPath;

namespace HowTo.Samples.XML
{

public class XmlNameSpaceSample
{
    // Schema to read from
    private const String document = "orders.xml";

    public static void Main()
    {
        XmlNameSpaceSample myXmlNameSpaceSample = new XmlNameSpaceSample();
        myXmlNameSpaceSample.Run(document);
    }

    public void Run(String args) 
    {
        try
        {
            String exprString = String.Empty;

            // Create a new XmlDocument for the specified source file and load it.
            XmlDocument myXmlDocument = new XmlDocument();
            myXmlDocument.Load(args);

            // Create a string containing the XPATH expression to evaluate.
            exprString = String.Format("// {0}:item", "yourns1");

            // Create an XmlNamespaceManager and add the namespaces for the document.
            XmlNamespaceManager nsmanager = new XmlNamespaceManager(myXmlDocument.NameTable);

            // Map namespaces to prefixes for querying purposes.
            nsmanager.AddNamespace("defaultns", "http://tempuri.org/myUSordersnamespace");
            nsmanager.AddNamespace("myns", "http://tempuri.org/myUSorderprocessornamespace");
            nsmanager.AddNamespace("yourns1", "http://tempuri.org/USvendor1namespace");
            nsmanager.AddNamespace("yourns2", "http://tempuri.org/USvendor2namespace");

            XmlNodeList nodelist = myXmlDocument.SelectNodes(exprString, nsmanager);

            foreach (XmlNode myXmlNode in nodelist)
            {
                DisplayTree(myXmlNode);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
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
            Console.WriteLine("\t" + node.Value);

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

} // End class XmlNameSpaceSample
} // End namespace HowTo.Samples.XML







