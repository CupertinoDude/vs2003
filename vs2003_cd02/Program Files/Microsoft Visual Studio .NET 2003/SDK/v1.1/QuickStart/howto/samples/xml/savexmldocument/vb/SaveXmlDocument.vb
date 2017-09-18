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

Namespace HowTo.Samples.XML

Public Class SaveXmlDocumentSample

    Shared Sub Main()
        Dim document as String = Environment.CurrentDirectory & "\books.xml"
        Dim updatedDocument as String = _
            Environment.GetEnvironmentVariable("TEMP") & "\updatebooksVB.xml"

        Dim args As String() = {document, updatedDocument}
        Dim mySaveXmlDocumentSample as SaveXmlDocumentSample
        mySaveXmlDocumentSample = new SaveXmlDocumentSample()
        mySaveXmlDocumentSample.Run(args)
    end sub

    public sub Run(args As String())
        try
            ' Create an XmlDocument
            Dim myXmlDocument as XmlDocument = new XmlDocument()
            myXmlDocument.Load (args(0))
            Console.WriteLine ("XmlDocument loaded with XML data successfully ...")
            Console.WriteLine()

            IncreasePrice(myXmlDocument.DocumentElement)

            ' Write out data as XML
            myXmlDocument.Save(args(1))
            Console.WriteLine()
            Console.WriteLine("Updated prices saved in file {0}", args(1))

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

    public sub IncreasePrice(node as XmlNode)

        if (node.Name = "price")

            node = node.FirstChild
            Dim price as Decimal
            price = System.Decimal.Parse(node.Value)

            ' Increase all the book prices by 2%
            Dim newprice as String
            newprice = CType(price*(new Decimal(1.02)), Decimal).ToString("#.00")
            Console.WriteLine("Old Price = " & node.Value & Strings.chr(9) & "New price = " & newprice)
            node.Value = newprice
        end if

        node = node.FirstChild
        While Not node Is Nothing
            IncreasePrice(node)
            node = node.NextSibling
        end while

    end sub

end Class
end Namespace
