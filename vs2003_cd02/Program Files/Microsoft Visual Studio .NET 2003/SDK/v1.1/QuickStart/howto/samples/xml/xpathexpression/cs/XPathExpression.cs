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
using System.Globalization;
using System.IO;
using System.Xml;
using System.Xml.XPath;
using System.Collections;

namespace HowTo.Samples.XML 
{
    public class XPathExpressionSample 
    {
        private const String document = "books.xml";

        public static void Main() 
        {
            XPathExpressionSample myXPathExpressionSample = new XPathExpressionSample();
            myXPathExpressionSample.Run(document);
        }

        public void Run(String args) 
        {
            try 
            {
                string selectExpr = String.Empty;
                XPathExpression myXPathExpr;

                Console.WriteLine();
                Console.WriteLine("XPathExpression started ...");
                Console.WriteLine();

                XPathDocument myXPathDocument = new XPathDocument(args);

                //Create an XPathNavigator
                XPathNavigator myXPathNavigator = myXPathDocument.CreateNavigator();

                // Get the Book elements
                selectExpr = "bookstore/book";

                Console.WriteLine("XPath query: " + selectExpr);

                // Ensure we are at the root node
                myXPathNavigator.MoveToRoot();

                myXPathExpr = myXPathNavigator.Compile(selectExpr);

                Console.WriteLine();
                Console.WriteLine("Original order ...");
                Console.WriteLine();
                
                // Create an XPathNodeIterator to walk over the selected nodes
                XPathNodeIterator myXPathNodeIterator = myXPathNavigator.Select (myXPathExpr);

                FormatXml(myXPathNodeIterator);

                // Ensure we are at the root node
                myXPathNavigator.MoveToRoot();

                Console.WriteLine();
                Console.WriteLine("Sort by ISBN (using IComparer - Text ascending)...");
                Console.WriteLine();

                // Create comparision class for the ISBN number
                ISBNCompare myISBNCompare = new ISBNCompare();

                // Add a comparer to do a string compare on the ISBN number
                myXPathExpr.AddSort("@ISBN", (IComparer)myISBNCompare);

                myXPathNodeIterator = myXPathNavigator.Select (myXPathExpr);

                FormatXml(myXPathNodeIterator);

                // Create Second XPathNavigator
                XPathNavigator myXPathNavigator2 = myXPathDocument.CreateNavigator();

                // Ensure we are at the root node
                myXPathNavigator2.MoveToRoot();
                myXPathExpr = myXPathNavigator2.Compile(selectExpr);

                Console.WriteLine();
                Console.WriteLine("Sort by publication date (using XSLT expression - Text descending) ...");
                Console.WriteLine();

                // Add an XSLT based sort
                myXPathExpr.AddSort("@publicationdate", XmlSortOrder.Descending, XmlCaseOrder.None, "", XmlDataType.Text);

                myXPathNodeIterator = myXPathNavigator2.Select (myXPathExpr);

                FormatXml(myXPathNodeIterator);
            } 
            catch (Exception e) 
            {
                Console.WriteLine ("Exception: {0}", e.ToString());
            }
        }

        private void FormatXml (XPathNodeIterator nav) 
        {
            // Loop getting information about each node
            while (nav.MoveNext()) 
            {
                switch (nav.Current.NodeType) 
                {
                    case XPathNodeType.ProcessingInstruction:
                        Format (nav, "ProcessingInstruction");
                        break;
                    case XPathNodeType.Comment:
                        Format (nav, "Comment");
                        break;
                    case XPathNodeType.Element:
                        Format (nav, "Element");
                        break;
                    case XPathNodeType.Text:
                        Format (nav, "Text");
                        break;
                    case XPathNodeType.Whitespace:
                        Format (nav, "Whitespace");
                        break;
                }
            }
            Console.WriteLine();
        }

        // Format the output
        private void Format (XPathNodeIterator nav, String nodeType) 
        {
            
            if (nav.Current.HasAttributes) 
            {
                Console.Write("<" + nav.Current.Name);
                nav.Current.MoveToFirstAttribute();
                Console.Write(" " + nav.Current.Name + "=" + nav.Current.Value);
                while (nav.Current.MoveToNextAttribute())
                    Console.Write(" " + nav.Current.Name + "=" + nav.Current.Value);
                Console.Write(">");
            }
            // Return to the 'Parent' node of the attributes
            nav.Current.MoveToParent();
            Console.WriteLine("");
        }

    } // End class XPathExpressionSample

    public class ISBNCompare : IComparer 
    {
        public int Compare( Object First, Object Second ) 
        {
            String s1 = (String) First;
            String s2 = (String) Second;

            Console.WriteLine("ISBN's to Compare: 1. {0} 2. {1}", s1, s2);
            return String.Compare(s1.ToString(), s2.ToString (), true, CultureInfo.InvariantCulture);
        }
    }// End class ISBNCompare
} // End namespace HowTo.Samples.XML
