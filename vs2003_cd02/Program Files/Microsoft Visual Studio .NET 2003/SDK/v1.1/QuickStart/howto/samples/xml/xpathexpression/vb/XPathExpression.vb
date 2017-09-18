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
Imports System.Globalization
Imports System.IO
Imports System.Xml
Imports System.Xml.XPath
Imports System.Collections

namespace HowTo.Samples.XML

public class XPathExpressionSample

    private const document as String = "books.xml"

    public shared sub Main()
        Dim myXPathExpressionSample as XPathExpressionSample  = new XPathExpressionSample()
        myXPathExpressionSample.Run(document)
    end sub

    public sub Run(args as String)
        try
            Dim selectExpr as string  = String.Empty
            Dim myXPathExpr as XPathExpression

            Console.WriteLine()
            Console.WriteLine("XPathExpression started ...")
            Console.WriteLine()

            Dim myXPathDocument as XPathDocument  = new XPathDocument(args)

            ' Create an XPathNavigator
            Dim myXPathNavigator as XPathNavigator  = myXPathDocument.CreateNavigator()

            ' Get the Book elements
            selectExpr = "bookstore/book"

            Console.WriteLine("XPath query: " + selectExpr)

            ' Ensure we are at the root node
            myXPathNavigator.MoveToRoot()

            myXPathExpr = myXPathNavigator.Compile(selectExpr)

            Console.WriteLine()
            Console.WriteLine("Original order ...")
            Console.WriteLine()

            ' Create an XPathNodeIterator to walk over the selected nodes
            Dim myXPathNodeIterator as XPathNodeIterator  = myXPathNavigator.Select (myXPathExpr)

            FormatXml(myXPathNodeIterator)

            ' Ensure we are at the root node
            myXPathNavigator.MoveToRoot()

            Console.WriteLine()
            Console.WriteLine("Sort by ISBN (using IComparer - Text ascending)...")
            Console.WriteLine()

            ' Create comparision class for the ISBN number
            Dim myISBNCompare as ISBNCompare  = new ISBNCompare()

            ' Add a comparer to do a string compare on the ISBN number
            myXPathExpr.AddSort("@ISBN", myISBNCompare)

            myXPathNodeIterator = myXPathNavigator.Select (myXPathExpr)

            FormatXml(myXPathNodeIterator)

            ' Create Second XPathNavigator
            Dim myXPathNavigator2 as XPathNavigator  = myXPathDocument.CreateNavigator()

            ' Ensure we are at the root node
            myXPathNavigator2.MoveToRoot()
            myXPathExpr = myXPathNavigator2.Compile(selectExpr)

            Console.WriteLine()
            Console.WriteLine("Sort by publication date (using XSLT expression - Text descending) ...")
            Console.WriteLine()

            ' Add an XSLT based sort
            myXPathExpr.AddSort("@publicationdate", XmlSortOrder.Descending, XmlCaseOrder.None, "", XmlDataType.Text)

            myXPathNodeIterator = myXPathNavigator2.Select (myXPathExpr)

            FormatXml(myXPathNodeIterator)
        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

    private sub FormatXml (nav as XPathNodeIterator)
        ' Loop getting information about each node
        while (nav.MoveNext())
            Select (nav.Current.NodeType)
                case XPathNodeType.ProcessingInstruction:
                    Format (nav, "ProcessingInstruction")

                case XPathNodeType.Comment:
                    Format (nav, "Comment")

                case XPathNodeType.Element:
                    Format (nav, "Element")

                case XPathNodeType.Text:
                    Format (nav, "Text")

                case XPathNodeType.Whitespace:
                    Format (nav, "Whitespace")
            end Select
        end While
        Console.WriteLine()
    end sub

    ' Format the output
    private sub Format (nav as XPathNodeIterator, nodeType as String)
        if (nav.Current.HasAttributes) then
            Console.Write("<" & nav.Current.Name)
            nav.Current.MoveToFirstAttribute()
            Console.Write(" " & nav.Current.Name & "=" & nav.Current.Value)
            while (nav.Current.MoveToNextAttribute())
                Console.Write(" " & nav.Current.Name & "=" & nav.Current.Value)
            end while
	    Console.Write(">")
        end if

        ' Return to the 'Parent' node of the attributes
        nav.Current.MoveToParent()
        Console.WriteLine("")
    end sub
end Class 'XPathExpressionSample

public Class ISBNCompare : Implements IComparer
    'Use a function name other than 'Compare'
    Function MyCompare( First As Object, Second As Object ) As Integer Implements IComparer.Compare
        Dim s1 as String  = CStr(First)
        Dim s2 as String  = CStr(Second)

        'Console.WriteLine("ISBN's to Compare: 1. {0} 2. {1}", s1, s2);
        return String.Compare(s1.ToString(), s2.ToString (), True, CultureInfo.InvariantCulture)
    end function
end Class 'ISBNCompare

end Namespace 'HowTo.Samples.XML
