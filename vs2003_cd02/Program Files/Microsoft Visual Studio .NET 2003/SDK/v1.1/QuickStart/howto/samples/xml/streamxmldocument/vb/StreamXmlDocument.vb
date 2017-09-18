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
Imports System.Xml.Xsl
Imports System.Xml.XPath

namespace HowTo.Samples.XML

public class StreamXmlDocumentSample

    private const document as String = "books.xml"
    private const newStyleSheet as String = "identity.xsl"

    shared sub Main()
        Dim args As String() = {document, newStyleSheet}
        Dim myStreamXmlDocumentSample as StreamXmlDocumentSample
        myStreamXmlDocumentSample = new StreamXmlDocumentSample()
        myStreamXmlDocumentSample.Run(args)
    end sub

    public sub Run(args As String())

        Dim myXmlReader as XmlReader = nothing
        Dim myXmlDataDocument as XmlDataDocument = new XmlDataDocument()
        Dim myXslTransform as XslTransform = new XslTransform()

        try
            ' Load the XML from file
            Console.WriteLine ("Loading file {0} ...", args(0))
            myXmlDataDocument.Load (args(0))
            Console.WriteLine ("XmlDataDocument loaded with XML data successfully ..." & Chr(10))

            Console.WriteLine ("Reading XML ..." & Chr(10))
            myXslTransform.Load(args(1))

            Dim myXPathNavigator as XPathNavigator = myXmlDataDocument.CreateNavigator()
            myXmlReader = myXslTransform.Transform(myXPathNavigator, nothing, Ctype(nothing, XmlResolver))
            FormatXml (myXmlReader)

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())

        finally
            ' Close the reader
            If Not myXmlReader Is Nothing
                myXmlReader.Close()
            end if

        end try
    end sub

    private sub FormatXml (reader as XmlReader)

        While reader.Read()

            Select (reader.NodeType)

            case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction")

            case XmlNodeType.DocumentType:
                Format (reader, "DocumentType")

            case XmlNodeType.Comment:
                Format (reader, "Comment")

            case XmlNodeType.Element:
                Format (reader, "Element")
                While reader.MoveToNextAttribute()
                    Format (reader, "Attribute")
                end While

            case XmlNodeType.Text:
                Format (reader, "Text")

            case XmlNodeType.Whitespace:
                Format (reader, "Whitespace")

            end Select

        end While
    end sub

    private sub Format(byref reader as XmlReader, NodeType as String)

        ' Format the output
        Console.Write(reader.Depth & " ")
        Console.Write(reader.AttributeCount & " ")

        Dim i as Integer
        for i = 0 to reader.Depth - 1
            Console.Write(Strings.chr(9))
        Next

        Console.Write(reader.Prefix & NodeType & "<" & reader.Name & ">" & reader.Value)
        Console.WriteLine()
    end sub

end Class
end Namespace
