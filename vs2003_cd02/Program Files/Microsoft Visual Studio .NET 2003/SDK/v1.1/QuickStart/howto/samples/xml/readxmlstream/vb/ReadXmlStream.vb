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

public class ReadXmlStreamSample

    Shared sub Main
        Dim myReadXmlStreamSample as ReadXmlStreamSample
        myReadXmlStreamSample = new ReadXmlStreamSample()
        myReadXmlStreamSample.Run()
    end sub

    public sub Run()

        Dim stream as StringReader
        Dim reader as XmlTextReader = nothing

        try
            Console.WriteLine ("Initializing StringReader ...")
            stream = new StringReader ("<?xml version='1.0'?>" & _
                                       "<!-- This file represents a fragment of a book store inventory database -->" & _
                                       "<bookstore>" & _
                                       " <book genre=""autobiography"" publicationdate=""1981"" ISBN=""1-861003-11-0"">" & _
                                       "   <title>The Autobiography of Benjamin Franklin</title>" & _
                                       "   <author>" & _
                                       "       <first-name>Benjamin</first-name>" & _
                                       "       <last-name>Franklin</last-name>" & _
                                       "   </author>" & _
                                       "   <price>8.99</price>" & _
                                       " </book>" & _
                                       " <book genre=""novel"" publicationdate=""1967"" ISBN=""0-201-63361-2"">" & _
                                       "   <title>The Confidence Man</title>" & _
                                       "   <author>" & _
                                       "       <first-name>Herman</first-name>" & _
                                       "       <last-name>Melville</last-name>" & _
                                       "   </author>" & _
                                       "   <price>11.99</price>" & _
                                       " </book>" & _
                                       "  <book genre=""philosophy"" publicationdate=""1991"" ISBN=""1-861001-57-6"">" & _
                                       "   <title>The Gorgias</title>" & _
                                       "   <author>" & _
                                       "       <name>Plato</name>" & _
                                       "   </author>" & _
                                       "   <price>9.99</price>" & _
                                       " </book>" & _
                                       "</bookstore>")

            ' Load the XmlTextReader from the stream
            reader = new XmlTextReader (stream)

            Console.WriteLine ("Processing ...")
            Console.WriteLine ()
            FormatXml(reader)

        catch e as Exception
            Console.WriteLine ("Exception: {0} ", e.ToString())

        finally
            Console.WriteLine()
            Console.WriteLine("Processing of stream complete.")
            If Not reader Is Nothing
                reader.Close()
            end if

        end try
    end sub

    private shared sub FormatXml (reader as XmlTextReader)

        Dim piCount, docCount, commentCount, elementCount as Integer
        Dim attributeCount, textCount, whitespaceCount as Integer

        While reader.Read()

            Select (reader.NodeType)

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
                While reader.MoveToNextAttribute()
                    Format (reader, "Attribute")
                end While

                if (reader.HasAttributes)
                    attributeCount += reader.AttributeCount
                end if

            case XmlNodeType.Text:
                Format (reader, "Text")
                textCount += 1

            case XmlNodeType.Whitespace:
                whitespaceCount += 1

            end Select

        end While

        ' Display the Statistics for the file
        Console.WriteLine ()
        Console.WriteLine("Statistics for stream")
        Console.WriteLine ()
        Console.WriteLine("ProcessingInstruction: " & piCount)
        Console.WriteLine("DocumentType: " & docCount)
        Console.WriteLine("Comment: " & commentCount)
        Console.WriteLine("Element: " & elementCount)
        Console.WriteLine("Attribute: " & attributeCount)
        Console.WriteLine("Text: " & textCount)
        Console.WriteLine("Whitespace: " & whitespaceCount)
    end sub

    private shared sub Format(byref reader as XmlTextReader, nodeType as String)

        ' Format the output
        Console.Write(reader.Depth & " ")
        Console.Write(reader.AttributeCount & " ")

        Dim i as Integer
        for i = 0 to reader.Depth - 1
            Console.Write(Strings.chr(9))
        Next

        Console.Write(reader.Prefix & nodeType & "<" & reader.Name & ">" & reader.Value)
        Console.WriteLine()

    end sub

end Class
end Namespace
