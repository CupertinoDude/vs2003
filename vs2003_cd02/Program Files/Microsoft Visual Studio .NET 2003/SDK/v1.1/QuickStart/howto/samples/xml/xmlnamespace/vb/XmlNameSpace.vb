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

public class XmlNameSpaceSample

    'XML file to read from
    private const document as String = "orders.xml"

    public shared sub Main()
        Dim myXmlNameSpaceSample as XmlNameSpaceSample  = new XmlNameSpaceSample()
        myXmlNameSpaceSample.Run(document)
    end sub

    public sub Run(args as String )
        try
            Dim exprString as String  = String.Empty

            'Create a new XmlDocument for the specified source file and load it.
            Dim myXmlDocument as XmlDocument  = new XmlDocument()
            myXmlDocument.Load(args)

            'Create a string containing the XPATH expression to evaluate.
            exprString = String.Format("//{0}:item", "yourns1")

            'Create an XmlNamespaceManager and add the namespaces for the document.
            Dim nsmanager as XmlNamespaceManager  = new XmlNamespaceManager(myXmlDocument.NameTable)

            'Map namespaces to prefixes for querying purposes.
            nsmanager.AddNamespace("defaultns", "http://tempuri.org/myUSordersnamespace")
            nsmanager.AddNamespace("myns", "http://tempuri.org/myUSorderprocessornamespace")
            nsmanager.AddNamespace("yourns1", "http://tempuri.org/USvendor1namespace")
            nsmanager.AddNamespace("yourns2", "http://tempuri.org/USvendor2namespace")

            Dim nodelist as XmlNodeList = myXmlDocument.SelectNodes(exprString, nsmanager)

            Dim myXmlNode as XmlNode
            for each myXmlNode in nodelist
                DisplayTree(myXmlNode)
            next

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
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
            Console.WriteLine( Strings.chr(9) & node.Value)

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
end Class 'XmlNameSpaceSample
end Namespace 'HowTo.Samples.XML
