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
Imports System.Xml
Imports System.Xml.XPath

namespace HowTo.Samples.XML

public class XmlNodeReaderSample

    private const document as String = "books.xml"

    public shared sub Main()
        Dim myXmlNodeReaderSample as XmlNodeReaderSample = new XmlNodeReaderSample()
        myXmlNodeReaderSample.Run(document)
    end sub

    public sub Run(arg as String )

        try
            ' Load the XML from file
            Console.WriteLine ()
            Console.WriteLine ("Loading file {0} ...", arg)

            Dim myXmlDocument as XmlDocument  = new XmlDocument()
            myXmlDocument.Load (arg)

            Console.WriteLine ("XmlDocument loaded with XML data successfully ...")

            Console.WriteLine()
            Console.WriteLine("Create an XmlNodeReader to show the third book ...")
            Console.WriteLine()

            Dim myXmlNodeReader as XmlNodeReader  = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[3]"))
            FormatXml (myXmlNodeReader)

            Console.WriteLine ()
            Console.WriteLine ("Create an XmlNodeReader to show the second book ... ")
            Console.WriteLine ()

            myXmlNodeReader = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[2]"))

            myXmlNodeReader.Read()
            Console.WriteLine (myXmlNodeReader.ReadInnerXml())

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

    private sub FormatXml (reader as XmlNodeReader)

        while (reader.Read())

        select case reader.NodeType

            case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction")

            case XmlNodeType.DocumentType:
                Format (reader, "DocumentType")

            case XmlNodeType.Document:
                Format (reader, "Document")

            case XmlNodeType.Comment:
                Format (reader, "Comment")

            case XmlNodeType.Element:
                Format (reader, "Element")
                while (reader.MoveToNextAttribute())
                    Format (reader, "Attribute")
                end while

            case XmlNodeType.Text:
                Format (reader, "Text")

            case XmlNodeType.Whitespace:
                Format (reader, "Whitespace")

            end select
    end while

    end sub

    'Format the output
    private sub Format (reader as XmlNodeReader, NodeType as String)

        Dim value as String = System.String.Empty
        Dim i as long
        for i=0  to (reader.Depth - 1)
            Console.Write(Chr(9))
        Next

        if (reader.HasValue)
            value = reader.Value
        end if

        Console.WriteLine(NodeType & "<" & reader.Name & ">" + value)
    end sub

end Class 'XMLNodeReaderSample
end Namespace 'HowTo.Samples.XML
