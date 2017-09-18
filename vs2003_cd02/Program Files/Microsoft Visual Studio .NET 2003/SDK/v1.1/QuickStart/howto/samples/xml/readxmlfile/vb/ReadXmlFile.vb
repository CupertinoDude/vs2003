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

namespace HowTo.Samples.XML

public class ReadXmlFileSample

    private const document as String = "books.xml"

    Shared sub Main
        Dim myReadXmlFileSample as ReadXmlFileSample
        myReadXmlFileSample = new ReadXmlFileSample()
        myReadXmlFileSample.Run(document)
    end sub

    public sub Run(args as String)

        Dim reader as XmlTextReader = nothing

        try
            ' Load the file with an XmlTextReader
            Console.WriteLine ("Reading file books.xml ...")
            reader = new XmlTextReader (args)
            Console.WriteLine ("File books.xml read sucessfully ...")

            ' Process the supplied XML file
            Console.WriteLine ("Processing ...")
            Console.WriteLine ()
            FormatXml(reader, args)

        catch e as Exception

            Console.WriteLine ("Failed to read the file 0", args)
            Console.WriteLine ("Exception: {0}", e.ToString())

        finally
            Console.WriteLine()
            Console.WriteLine("Processing of the file {0} complete.", args)
            ' Finished with XmlTextReader
            If Not reader Is Nothing
                reader.Close()
            end if

        End try
    End Sub

    private shared Sub FormatXml (reader as XmlTextReader, filename as String)

        Dim declarationCount, piCount, docCount, commentCount, elementCount as Integer
        Dim attributeCount, textCount, whitespaceCount as Integer

        While reader.Read()

            Select (reader.NodeType)

            case XmlNodeType.XmlDeclaration:
                Format (reader, "XmlDeclaration")
                declarationCount += 1

            case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction")
                piCount += 1

            case XmlNodeType.DocumentType:
                Format (reader, "DocumentType")
                docCount += 1

            case XmlNodeType.Comment:
                Format (reader, "Comment")
                commentCount += 1

            case XmlNodeType.Element:
                Format (reader, "Element")
                elementCount += 1
                if (reader.HasAttributes)
                    attributeCount += reader.AttributeCount
                end if

            case XmlNodeType.Text:
                Format (reader, "Text")
                textCount += 1

            case XmlNodeType.Whitespace:
                whitespaceCount += 1

            End Select

        End While

        ' Display the Statistics for the file
        Console.WriteLine ()
        Console.WriteLine("Statistics for {0} file", filename)
        Console.WriteLine ()
        Console.WriteLine("XmlDeclaration: " & declarationCount)
        Console.WriteLine("ProcessingInstruction: " & piCount)
        Console.WriteLine("DocumentType: " & docCount)
        Console.WriteLine("Comment: " & commentCount)
        Console.WriteLine("Element: " & elementCount)
        Console.WriteLine("Element Attributes: " & attributeCount)
        Console.WriteLine("Text: " & textCount)
        Console.WriteLine("Whitespace: " & whitespaceCount)
    End Sub

    private shared Sub Format(byref reader as XmlTextReader , nodeType as String)

        ' Format the output
        Console.Write(reader.Depth & " ")
        Console.Write(reader.AttributeCount & " ")

        Dim i as Integer
        for i = 0 to reader.Depth - 1
            Console.Write(Strings.chr(9))
        Next

        Console.Write(nodeType & "<" & reader.Name & ">" & reader.Value)

        'Display the attributes values for the current node
        if (reader.HasAttributes)
            Console.Write(" Attributes:")
            Dim j as Integer
            for j = 0 to reader.AttributeCount - 1
                Console.Write(" [{0}] " & reader(j), j)
            next
        End if

        Console.WriteLine()

    End Sub

End Class
End Namespace
