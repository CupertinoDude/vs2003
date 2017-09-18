'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Xml
Imports System.Xml.XPath

namespace HowTo.Samples.XML

public class NavigateXmlDocumentSample

    private const document as String = "books.xml"

    Shared sub Main
        Dim myNavigateXmlDocumentSample as NavigateXmlDocumentSample
        myNavigateXmlDocumentSample = new NavigateXmlDocumentSample()
        myNavigateXmlDocumentSample.Run(document)
    end sub

    public sub Run(args as String)
        try
            ' Load the XML from file
            Console.WriteLine ()
            Console.WriteLine ("Loading file {0} ...", args)

            Dim myXPathDocument as XPathDocument = new XPathDocument(args)

            Console.WriteLine ("XPathDocument loaded with XML data successfully ...")

            ' Get an XPathNavigator from the XmlDocument
            Console.WriteLine ("Create a Navigator ...")
            ' Create an XPathNavigator
            Dim myXPathNavigator as XPathNavigator  = myXPathDocument.CreateNavigator()

            ' Display contents
            Console.WriteLine ("Display contents of the file {0}", args)
            Console.WriteLine ()

            myXPathNavigator.MoveToRoot() ' Initialise the myXPathNavigator to start at the root
            DisplayTree(myXPathNavigator) ' Display all the nodes

            'Find the price of the first book. Start at the root node
            Console.WriteLine ()
            Console.WriteLine ("Find the price of the first book by navigating nodes ...")
            myXPathNavigator.MoveToRoot()
            DisplayNode (true, myXPathNavigator) ' root node
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' ?xml version='1.0'? node
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator) '!-- This file ... node
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator) ' bookstore element
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' book element
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' title element
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator)' author element
            DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator) ' price Element
            DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' value of price element

            ' Select the book titles
            Console.WriteLine()
            Console.WriteLine("Select the book titles with an XPathNodeIterator...")
            myXPathNavigator.MoveToRoot()

            Dim myXPathNodeIterator as XPathNodeIterator  = myXPathNavigator.Select("descendant::book/title")

            while(myXPathNodeIterator.MoveNext())
                Console.WriteLine("<" & myXPathNodeIterator.Current.Name & ">" & myXPathNodeIterator.Current.Value)
            end while

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

    ' Walks the XPathNavigator tree recursively
    public sub DisplayTree (myXPathNavigator as XPathNavigator )

        if (myXPathNavigator.HasChildren)
            myXPathNavigator.MoveToFirstChild()

            Format (myXPathNavigator)
            DisplayTree (myXPathNavigator)

            myXPathNavigator.MoveToParent()
        end if

        while (myXPathNavigator.MoveToNext())
            Format (myXPathNavigator)
            DisplayTree (myXPathNavigator)
        end while
    end sub

    ' Format the output
    private sub Format (myXPathNavigator as XPathNavigator )
        if Not (myXPathNavigator.HasChildren)
            if (myXPathNavigator.NodeType = XPathNodeType.Text)
                Console.WriteLine(myXPathNavigator.Value )
            elseif (myXPathNavigator.Name <> String.Empty)
                Console.WriteLine("<" & myXPathNavigator.Name & ">")
            else
                Console.WriteLine()
            end if

        else
            Console.WriteLine("<" & myXPathNavigator.Name & ">")

            ' Show the attributes if there are any
            if (myXPathNavigator.HasAttributes)
                if (myXPathNavigator.MoveToFirstAttribute())

                    Console.WriteLine("Attributes of <" & myXPathNavigator.Name & ">")

                    while (myXPathNavigator.MoveToNextAttribute())
                        Console.Write("<" + myXPathNavigator.Name + "> " + myXPathNavigator.Value + " ")
                    end while

                    ' Return to the 'Parent' node of the attributes
                    myXPathNavigator.MoveToParent()
                end if
            end if
        end if
    end sub

    private sub DisplayNode(success as Boolean, myXPathNavigator as XPathNavigator )

        if (success and (myXPathNavigator.NodeType = XPathNodeType.Text))
            Console.WriteLine(myXPathNavigator.Value)
        else if (success and (myXPathNavigator.Name <> String.Empty))
            Console.WriteLine("<" & myXPathNavigator.Name & ">")
        else
            Console.WriteLine()
        end if
    end sub

end Class
end Namespace
