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

public class LoadXmlDocumentSample

    private const document as String = "books.xml"

    public shared sub Main()
        Dim myLoadXmlDocumentSample as LoadXmlDocumentSample
        myLoadXmlDocumentSample = new LoadXmlDocumentSample()
        myLoadXmlDocumentSample.Run(document)
    end sub

    public sub Run(args as String)
        try
            'Load the XML from file
            Console.WriteLine ()
            Console.WriteLine ("Loading file {0} ...", args)

            Dim myXmlDocument as XmlDataDocument = new XmlDataDocument()
            myXmlDocument.Load (args)

            Console.WriteLine ("XmlDataDocument loaded with XML data successfully ...")

            'Display the XML document.
            myXmlDocument.Save(Console.Out)
        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

end Class
end Namespace
