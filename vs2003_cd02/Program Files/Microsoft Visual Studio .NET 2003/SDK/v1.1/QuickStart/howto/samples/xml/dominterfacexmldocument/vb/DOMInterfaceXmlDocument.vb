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

imports System
imports System.IO
imports System.Xml
imports microsoft.visualbasic

namespace HowTo.Samples.XML

public class DOMInterfaceXmlDocumentSample

    private const document as String = "books.xml"

    public shared sub Main()
        Dim myDOMInterfaceXmlDocumentSample as DOMInterfaceXmlDocumentSample
        myDOMInterfaceXmlDocumentSample = new DOMInterfaceXmlDocumentSample()
        myDOMInterfaceXmlDocumentSample.Run(document)
    end sub

    public sub Run(args as String)
        Dim reader as XmlTextReader = nothing

        try

            ' Load the XML from file
            Console.WriteLine ("Reading file {0} ...", args)
            reader = new XmlTextReader (args)
            reader.WhitespaceHandling = WhitespaceHandling.None
            Console.WriteLine ("File {0} read sucessfully ...", args)

            ' Create an XmlDocument from the XmlTextReader
            Dim myXmlDocument as XmlDocument = new XmlDocument()
            myXmlDocument.Load (reader)
            Console.WriteLine ("XmlDocument loaded with XML data successfully ...")

            ' Process the supplied XML file
            Console.WriteLine ("Processing ...")
            Console.WriteLine ()

            ' Start from the document Element
            DisplayTree(myXmlDocument.DocumentElement)

        catch e as Exception
            Console.WriteLine ("Exception:" & e.ToString())

        finally
            If Not reader Is Nothing
                reader.Close()
            end if

        end try
    end sub

    public sub DisplayTree( node as XmlNode)

        if not isnothing(node) then Format (node)

        if node.HasChildNodes then
            node = node.FirstChild
            while not isnothing(node)
                DisplayTree(node)
                node = node.NextSibling
            end While
        end if
    end sub

  ' Format the output
    private sub Format ( node as XmlNode)

        if not node.HasChildNodes then
            Console.WriteLine( Strings.chr(9) & node.Name & "<" & node.Value & ">")

        else
            Console.Write(node.Name)
            if XmlNodeType.Element = node.NodeType then
                Dim map as XmlNamedNodeMap = node.Attributes
                Dim attrnode As Object
                    for each attrnode in map
                        Console.Write(" " & Ctype(attrnode,XmlNode).Name & "<" & Ctype(attrnode,XmlNode).Value & "> " )
                    next
            end if
            Console.WriteLine()
        end if
    end sub

end class
end Namespace
