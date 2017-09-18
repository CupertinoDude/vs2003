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
Imports System.Xml.Xpath

namespace HowTo.Samples.XML

public class XmlDocumentEventSample

    private const document as String = "books.xml"

    public shared sub Main()
        Dim myXmlDocumentEventSample as XmlDocumentEventSample = new XmlDocumentEventSample()
        myXmlDocumentEventSample.Run(document)
    end sub

    public sub Run(args as String )
        try
            'Load the XML from file
            Console.WriteLine ()
            Console.WriteLine ("Loading file {0} ...", args)

            Dim myXmlDocument as XmlDocument  = new XmlDocument()
            myXmlDocument.Load (args)

            'Add MyEvent Handlers here
            AddHandler myXmlDocument.NodeChanged, new XmlNodeChangedEventHandler(addressof MyNodeChangedEvent)
            AddHandler myXmlDocument.NodeInserted, new XmlNodeChangedEventHandler(addressof MyNodeInsertedEvent)

            Console.WriteLine ("XmlDocument loaded with XML data successfully ...")

            ' Increase all the book prices by 2%
            Console.WriteLine()
            Console.WriteLine("Increase all the book prices by 2% ...")
            Console.WriteLine()
            
            ' Create a list of the <book> nodes and change their values
            Dim myXmlNodeList as XmlNodeList  = myXmlDocument.SelectNodes("descendant::book/price")
            Dim myXmlNode as XmlNode

            for each myXmlNode in myXmlNodeList
                Console.WriteLine("<" + myXmlNode.Name + "> " + myXmlNode.InnerText)
                Dim price as Double  = System.Double.Parse(myXmlNode.InnerText)
                myXmlNode.InnerText = CStr(CType(price * 1.02, Double).ToString("#.00"))
            next

            Console.WriteLine()
            Console.WriteLine("Adding a new book to the XmlDocument ...")
            Console.WriteLine()

            ' Create a new book
            Dim myNewBook as XmlDocumentFragment  = myXmlDocument.CreateDocumentFragment()

            myNewBook.InnerXml = ("<book genre="" Object-Orientated Technology "" publicationdate="" 1994 "" " & _
                                "ISBN=""0-201-63361-2"">" & _
                                "<title>Design Patterns - Elements of Reusable Object-Orientated Software</title>" & _
                                "<author>" & _
                                "<first-name>Eric</first-name>" & _
                                "<last-name>Gamma</last-name>" & _
                                "</author>" & _
                                "<price>49.95</price>" & _
                                "</book>")
            

            Dim rootXmlElement as XmlElement  = myXmlDocument.DocumentElement

            ' Add the new book to the XmlDocument
            rootXmlElement.InsertBefore(myNewBook, rootXmlElement.FirstChild)

            Console.WriteLine()
            Console.WriteLine("Cloning the first book node in the XmlDocument ...")
            Console.WriteLine()


            ' Clone the node and note that by cloning the node we
            ' are inserting it again into the XmlDocument
            Dim myNewBook2 as XmlNode  = myXmlDocument.DocumentElement.FirstChild.Clone()

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

    ' Handle the Node Changed Event
    public sub MyNodeChangedEvent(src as Object , args as XmlNodeChangedEventArgs )
        Console.Write("Node Changed Event: <" + args.Node.Name + "> changed")
        if not (args.Node.Value is Nothing) then
            Console.WriteLine(" with value " + args.Node.Value)
        else
            Console.WriteLine("")
        end if
    end sub

    ' Handle the Node Inserted Event
    public sub MyNodeInsertedEvent(src as Object , args as XmlNodeChangedEventArgs )
        Console.Write("Node Inserted Event: <" + args.Node.Name + "> inserted")
        if not (args.Node.Value is Nothing) then
            Console.WriteLine(" with value " + args.Node.Value)
        else
            Console.WriteLine("")
        end if
    end sub

end Class 'XmlDocumentEvent
end Namespace 'HowTo.Samples.XML
