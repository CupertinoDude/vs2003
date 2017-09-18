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
Imports System.Xml.Schema

namespace HowTo.Samples.XML

public class XmlReadWriteSchemaSample

    'Schema to read from
    private const document as String = "sample.xsd"

    public shared sub Main()
        Dim myXmlReadWriteSchemaSample as XmlReadWriteSchemaSample = new XmlReadWriteSchemaSample()
        myXmlReadWriteSchemaSample.Run(document)
    end sub

    public sub Run(args as String )

        try

            'Create a stringwriter for output
            Dim myStringWriter as StringWriter  = new StringWriter()
            Dim myXmlWriter as XmlTextWriter  = new XmlTextWriter(myStringWriter)
            myXmlWriter.Formatting = Formatting.Indented
            myXmlWriter.Indentation = 2

            'Read the Schema
            Console.WriteLine("Reading schema {0} ...", args)
            Console.WriteLine()
            Dim mySchema as XmlSchema  = XmlSchema.Read(new XmlTextReader(args), Nothing)

            'Write the Schema
            Console.WriteLine("Writing schema {0} ...", args)
            Console.WriteLine()
            mySchema.Write(myXmlWriter)
            Console.WriteLine(myStringWriter.ToString())

        catch e as Exception

            Console.WriteLine ("Exception: {0}", e.ToString())

        end try

    end sub

end Class ' XmlReadWriteSchemaSample
end Namespace ' HowTo.Samples.XML
