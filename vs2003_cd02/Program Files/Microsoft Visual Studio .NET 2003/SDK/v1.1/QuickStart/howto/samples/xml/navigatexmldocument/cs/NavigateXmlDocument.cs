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

public class NavigateXmlDocumentSample
{
    private const String document = "books.xml";

    public static void Main()
    {
        NavigateXmlDocumentSample myNavigateXmlDocumentSample = new NavigateXmlDocumentSample();
        myNavigateXmlDocumentSample.Run(document);
    }

    public void Run(String args)
    {
        try
        {
            // Load the XML from file
            Console.WriteLine ();
            Console.WriteLine ("Loading file {0} ...", args);

            XPathDocument myXPathDocument = new XPathDocument(args);

            Console.WriteLine ("XPathDocument loaded with XML data successfully ...");

            // Get an XPathNavigator from the XPathDocument
            Console.WriteLine ("Create a Navigator ...");
            //Create an XPathNavigator
            XPathNavigator myXPathNavigator = myXPathDocument.CreateNavigator();

            // Display contents
            Console.WriteLine ("Display contents of the file {0}", args);
            Console.WriteLine ();

            myXPathNavigator.MoveToRoot(); // Initialize the myXPathNavigator to start at the root
            DisplayTree(myXPathNavigator); // Display all the nodes

            // Find the price of the first book. Start at the root node
            Console.WriteLine ();
            Console.WriteLine ("Find the price of the first book by navigating nodes ...");
            myXPathNavigator.MoveToRoot();
            DisplayNode (true, myXPathNavigator); // root node
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // ?xml version='1.0'? node
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator); //!-- This file ... node
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator); // bookstore element
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // book element
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // title element
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator);// author element
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator); // price Element
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // value of price element

            // Select the book titles
            Console.WriteLine();
            Console.WriteLine("Select the book titles with an XPathNodeIterator...");
            myXPathNavigator.MoveToRoot();

            XPathNodeIterator myXPathNodeIterator = myXPathNavigator.Select("descendant::book/title");

            while(myXPathNodeIterator.MoveNext())
            {
                Console.WriteLine("<" + myXPathNodeIterator.Current.Name + ">" + myXPathNodeIterator.Current.Value);
            };

        } 
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

    // Walks the XPathNavigator tree recursively 
    public void DisplayTree (XPathNavigator myXPathNavigator)
    {
        if (myXPathNavigator.HasChildren)
        {
            myXPathNavigator.MoveToFirstChild();

            Format (myXPathNavigator);
            DisplayTree (myXPathNavigator); 

            myXPathNavigator.MoveToParent();
        }
        while (myXPathNavigator.MoveToNext())
        {
            Format (myXPathNavigator);
            DisplayTree (myXPathNavigator); 
        }
    }

    // Format the output
    private void Format (XPathNavigator myXPathNavigator)
    {
        if (!myXPathNavigator.HasChildren)
        {
            if (myXPathNavigator.NodeType == XPathNodeType.Text)
                Console.WriteLine(myXPathNavigator.Value );
            else if (myXPathNavigator.Name != String.Empty)
                Console.WriteLine("<" + myXPathNavigator.Name + ">");
            else 
                Console.WriteLine();
        }
        else
        {
            Console.WriteLine("<" + myXPathNavigator.Name + ">");
        
            // Show the attributes if there are any
            if (myXPathNavigator.HasAttributes)
            {
                if (myXPathNavigator.MoveToFirstAttribute())
                {
                    Console.WriteLine("Attributes of <" + myXPathNavigator.Name + ">");

                    while (myXPathNavigator.MoveToNextAttribute())
                        Console.Write("<" + myXPathNavigator.Name + "> " + myXPathNavigator.Value + " ");

                    // Return to the 'Parent' node of the attributes
                    myXPathNavigator.MoveToParent();
                }
            }
        }
    }

    private void DisplayNode(Boolean success, XPathNavigator myXPathNavigator)
    {
        if (success && (myXPathNavigator.NodeType == XPathNodeType.Text))
            Console.WriteLine(myXPathNavigator.Value );
        else if (success && (myXPathNavigator.Name != String.Empty))
            Console.WriteLine("<" + myXPathNavigator.Name + ">");
        else
            Console.WriteLine();
    }

} // End class NavigateXmlDocumentSample
} // End namespace HowTo.Samples.XML
