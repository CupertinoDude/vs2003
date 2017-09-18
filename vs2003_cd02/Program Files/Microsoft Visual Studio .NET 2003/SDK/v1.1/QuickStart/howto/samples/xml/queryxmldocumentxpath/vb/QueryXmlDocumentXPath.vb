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

public class QueryXmlDocumentXPathSample

    private const localURL as String = "http://localhost/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/vb/books.xml"

    Shared sub Main
        Dim myQueryXmlDocumentXPathSample as QueryXmlDocumentXPathSample
        myQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample()
        myQueryXmlDocumentXPathSample.Run(localURL)
    end sub

    public sub Run(args as String)
        Console.WriteLine("XPath Test started ...")

        Dim myXPathDocument as XPathDocument = new XPathDocument(args)
        Dim myXPathNavigator as XPathNavigator = myXPathDocument.CreateNavigator()
            
        ' Get all the book prices
        XPathQuery(myXPathNavigator, "descendant::book/price")

        ' Get the ISBN of the last book
        XPathQuery(myXPathNavigator, "bookstore/book[3]/@ISBN")
    end sub

    private sub XPathQuery(myXPathNavigator as XPathNavigator, xpathexpr as String )
    
        try
            Console.WriteLine("XPath query: " + xpathexpr)

            ' Create a node interator to select nodes and move through them (read-only)
            Dim myXPathNodeIterator as XPathNodeIterator  =  myXPathNavigator.Select (xpathexpr)

            while (myXPathNodeIterator.MoveNext())
                Console.WriteLine("<" & myXPathNodeIterator.Current.Name + "> " & myXPathNodeIterator.Current.Value)
            end while

            Console.WriteLine()
        
        catch e as Exception        
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

end Class
end Namespace
