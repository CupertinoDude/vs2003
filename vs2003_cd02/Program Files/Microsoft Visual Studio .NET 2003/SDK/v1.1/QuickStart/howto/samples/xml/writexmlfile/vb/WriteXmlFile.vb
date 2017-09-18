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

Public Class WriteXmlFileSample

    Shared Sub Main()
        Dim myWriteXmlFileSample as WriteXmlFileSample
        Dim document As String = _
            Environment.GetEnvironmentVariable("TEMP") & "\newbooksVB.xml"
        myWriteXmlFileSample = new WriteXmlFileSample()
        myWriteXmlFileSample.Run(document, _
            Environment.CurrentDirectory & "\\books.dtd")
    End Sub

    Public Sub Run(args As String, dtdFile as String)

        Dim myXmlTextReader As XmlTextReader = nothing
        Dim myXmlTextWriter As XmlTextWriter = nothing

        Try
            myXmlTextWriter = New XmlTextWriter (args, nothing)

            myXmlTextWriter.Formatting = System.Xml.Formatting.Indented
            myXmlTextWriter.WriteStartDocument(false)
            myXmlTextWriter.WriteDocType("bookstore", nothing, dtdFile, nothing)
            myXmlTextWriter.WriteComment("This file represents another " & _
                "fragment of a book store inventory database")
            myXmlTextWriter.WriteStartElement("bookstore")
            myXmlTextWriter.WriteStartElement("book", nothing)
            myXmlTextWriter.WriteAttributeString("genre","autobiography")
            myXmlTextWriter.WriteAttributeString("publicationdate","1979")
            myXmlTextWriter.WriteAttributeString("ISBN","0-7356-0562-9")
            myXmlTextWriter.WriteElementString("title", nothing, _
                "The Autobiography of Mark Twain")
            myXmlTextWriter.WriteStartElement("Author", nothing)
            myXmlTextWriter.WriteElementString("first-name", "Mark")
            myXmlTextWriter.WriteElementString("last-name", "Twain")
            myXmlTextWriter.WriteEndElement()
            myXmlTextWriter.WriteElementString("price", "7.99")
            myXmlTextWriter.WriteEndElement()
            myXmlTextWriter.WriteEndElement()

            'Write the XML to file and close the writer
            myXmlTextWriter.Flush()
            myXmlTextWriter.Close()

            ' Read the file back in and parse to ensure well formed XML
            myXmlTextReader = new XmlTextReader (args)
            FormatXml (myXmlTextReader, args)

        Catch e As Exception
            Console.WriteLine ("Exception: {0}", e.ToString())

        Finally
            Console.WriteLine()
            Console.WriteLine("Processing of the file {0} complete.", args)

            If Not myXmlTextReader Is Nothing
                myXmlTextReader.Close()
            End If

            'Close the writer
            If Not myXmlTextWriter Is Nothing
                myXmlTextWriter.Close()
            End If

        End Try
    End Sub

    Private Shared Sub FormatXml (reader as XmlTextReader, filename as String)

        Dim piCount, docCount, commentCount, elementCount As Integer
        Dim attributeCount, textCount, whitespaceCount As Integer

        While reader.Read()

            Select (reader.NodeType)

            Case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction")
                piCount += 1

            Case XmlNodeType.DocumentType:
                Format (reader, "DocumentType")
                docCount += 1

            Case XmlNodeType.Comment:
                Format (reader, "Comment")
                commentCount += 1

            Case XmlNodeType.Element:
                Format (reader, "Element")
                elementCount += 1
                While reader.MoveToNextAttribute()
                    Format (reader, "Attribute")
                End While

                If (reader.HasAttributes)
                    attributeCount += reader.AttributeCount
                End If

            Case XmlNodeType.Text:
                Format (reader, "Text")
                textCount += 1

            Case XmlNodeType.Whitespace:
                whitespaceCount += 1

            End Select

        End While

        ' Display the Statistics for the file
        Console.WriteLine ()
        Console.WriteLine("Statistics for {0} file", filename)
        Console.WriteLine ()
        Console.WriteLine("ProcessingInstruction: " & piCount)
        Console.WriteLine("DocumentType: " & docCount)
        Console.WriteLine("Comment: " & commentCount)
        Console.WriteLine("Element: " & elementCount)
        Console.WriteLine("Attribute: " & attributeCount)
        Console.WriteLine("Text: " & textCount)
        Console.WriteLine("Whitespace: " & whitespaceCount)
    End Sub

    Private Shared Sub Format(byref reader as XmlTextReader , NodeType as String)

        ' Format the output
        Console.Write(reader.Depth & " ")
        Console.Write(reader.AttributeCount & " ")

        Dim i As Integer
        For i = 0 to reader.Depth - 1
            Console.Write(Strings.chr(9))
        Next

        Console.Write(reader.Prefix & NodeType & "<" & reader.Name & ">" & reader.Value)
        Console.WriteLine()

    End Sub

End Class
End Namespace
