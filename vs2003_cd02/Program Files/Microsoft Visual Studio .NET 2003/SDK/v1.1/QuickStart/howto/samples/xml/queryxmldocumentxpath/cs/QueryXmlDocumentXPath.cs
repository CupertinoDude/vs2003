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

public class QueryXmlDocumentXPathSample
{
    private const String localURL = "http://localhost/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/cs/books.xml";

    public static void Main()
    {
        QueryXmlDocumentXPathSample myQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample();
        myQueryXmlDocumentXPathSample.Run(localURL);
    }

    public void Run(String args)
    {
        Console.WriteLine("XPath Test started ...");
   
        XPathDocument myXPathDocument = new XPathDocument(args);
        XPathNavigator myXPathNavigator = myXPathDocument.CreateNavigator();

        // Get all the book prices
        XPathQuery(myXPathNavigator, "descendant::book/price");

        // Get the ISBN of the last book
        XPathQuery(myXPathNavigator, "bookstore/book[3]/@ISBN");
    }

    private void XPathQuery(XPathNavigator myXPathNavigator, String xpathexpr )
    {
        try
        {
            Console.WriteLine("XPath query: " + xpathexpr);

            // Create a node interator to select nodes and move through them (read-only)
            XPathNodeIterator myXPathNodeIterator =  myXPathNavigator.Select (xpathexpr);

            while (myXPathNodeIterator.MoveNext())
            {
                Console.WriteLine("<" + myXPathNodeIterator.Current.Name + "> " + myXPathNodeIterator.Current.Value);
            }

            Console.WriteLine();

        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }
    
} // End class QueryXmlDocumentXPathSample
} // End namespace HowTo.Samples.XML
