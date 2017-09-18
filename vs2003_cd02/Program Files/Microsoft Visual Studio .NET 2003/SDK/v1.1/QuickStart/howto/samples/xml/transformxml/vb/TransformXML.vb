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

Option strict off

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Xml
Imports System.Xml.Xsl
Imports System.Xml.XPath

namespace HowTo.Samples.XML

public class TransformXMLSample

    private const document1 as string = "books.xml"
    private const document2 as string = "ProcessParametersA.xml"
    private const document3 as string = "ProcessParametersB.xml"
    private const styleSheet1 as string= "books.xsl"
    private const styleSheet2 as string= "StyleSheetGenerator.xsl"

    shared sub Main()
        Dim args1 As String() = {document1, styleSheet1}
        Dim args2 As String() = {document2, styleSheet2}
        Dim args3 As String() = {document3, styleSheet2}
        Dim myTransformXMLSample as TransformXMLSample
        myTransformXMLSample = new TransformXMLSample()
        Console.WriteLine(Chr(10) & Chr(10) & "*********Output from the first transform:*********" & Chr(10) & Chr(10))
        myTransformXMLSample.Run(args1)
        Console.WriteLine(Chr(10) & Chr(10) & "*********Output from the second transform:*********" & Chr(10) & Chr(10))
        myTransformXMLSample.Run(args2)
        Console.WriteLine(Chr(10) & Chr(10) & "*********Output from the third transform:*********" & Chr(10) & Chr(10))
        myTransformXMLSample.Run(args3)
    end sub

    public sub Run(args As String())

        Console.WriteLine()
        Console.WriteLine("Read XML data file, transform and format display ...")
        Console.WriteLine()

        ReadTransform(args)

        Console.WriteLine()
        Console.WriteLine("Read XML data file, transform and write ...")
        Console.WriteLine()

        ReadTransformWrite(args)
        Console.WriteLine()
    end sub

    public sub ReadTransform(args As String())

        try
            Dim myXPathDocument as XPathDocument = new XPathDocument (args(0))
            Dim myXslTransform as XslTransform = new XslTransform()
            myXslTransform.Load(args(1))
            Dim reader as XmlReader = myXslTransform.Transform(myXPathDocument, nothing, CType(nothing, XmlResolver))

            FormatXml(reader)

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

    public sub ReadTransformWrite(args As String())

        Dim stream as StreamReader = nothing

        try
            Dim myXPathDocument as XPathDocument = new XPathDocument (args(0))
            Dim myXslTransform as XslTransform = new XslTransform()
            Dim writer as XmlTextWriter = new XmlTextWriter("transform.xml", nothing)
            myXslTransform.Load(args(1))
            myXslTransform.Transform(myXPathDocument, nothing, writer, nothing)

            writer.Close()

            stream = new StreamReader ("transform.xml")
            Console.Write(stream.ReadToend())

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())

        finally
            If Not stream Is Nothing
                stream.Close()
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
                Dim flag as Boolean = false
                'Do not display whitespace text nodes
                Dim i as Integer
                Dim array as char() = reader.Value.ToCharArray()
                for i = 0 to reader.Value.Length - 1
                    if not (System.Char.IsWhiteSpace(array(i)))
                        flag = true
                    end if
                Next
                if(flag)
                    Format (reader, "Text")
                end if

            end Select

        end While
    end sub

    private sub Format(byref reader as XmlReader, nodeType as String)
        ' Format the output
        Dim i as Integer
        for i = 0 to reader.Depth - 1
            Console.Write(Chr(9))
        Next

        Console.Write(nodeType & "<" & reader.Name & ">" & reader.Value)
        Console.WriteLine()
    end sub

end Class
end Namespace
