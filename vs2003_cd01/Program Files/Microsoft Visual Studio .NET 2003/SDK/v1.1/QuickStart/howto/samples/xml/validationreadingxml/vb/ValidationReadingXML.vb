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

public class ValidationReadingXMLSample

    private const document1 as String = "booksDTD.xml"
    private const document2 as String = "booksDTDFail.xml"
    private const document3 as String = "booksSchema.xml"
    private const document4 as String = "booksSchemaFail.xml"
    private const document5 as String = "schema.xsd"

    private myXmlValidatingReader as XmlValidatingReader
    private myXmlTextReader as XmlTextReader
    private success as Boolean = true

    shared sub Main()
        Dim args As String() = {document1, document2, document3, document4, document5}
        Dim myValidationReadingXMLSample as ValidationReadingXMLSample
        myValidationReadingXMLSample = new ValidationReadingXMLSample()
        myValidationReadingXMLSample.Run(args)
    end sub

    public sub Run(args As String())
        try
            ' Validate the XML file with the DTD
            Console.WriteLine()
            Console.WriteLine("Validating XML file booksDTD.xml with DTD file books.dtd ...")
            myXmlTextReader = new XmlTextReader (args(0))
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader)
            myXmlValidatingReader.ValidationType = ValidationType.DTD
            Validate()

            ' DTD Validation failure
            success = true
            Console.WriteLine()
            Console.WriteLine("Validation XML file booksDTDFail.xml with DTD file books.dtd ...")
            myXmlTextReader = new XmlTextReader (args(1))
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader)
            myXmlValidatingReader.ValidationType = ValidationType.DTD
            Validate()

            Dim myXmlSchemaCollection as XmlSchemaCollection  = new XmlSchemaCollection()
            myXmlSchemaCollection.Add("schema.xsd" , new XmlTextReader(args(4)))

            ' Validate the XML file with the schema
            success = true
            Console.WriteLine()
            Console.WriteLine("Validation XML file booksSchema.xml with schema file schema.xsd ...")
            myXmlTextReader = new XmlTextReader (args(2))
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader)
            myXmlValidatingReader.Schemas.Add(myXmlSchemaCollection)
            myXmlValidatingReader.ValidationType = ValidationType.Schema
            Validate()

            ' Schema Validaiton failure
            success = true
            Console.WriteLine()
            Console.WriteLine("Validation XML file booksSchemaFail.xml with schema file schema.xsd ...")
            myXmlTextReader = new XmlTextReader (args(3))
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader)
            myXmlValidatingReader.Schemas.Add(myXmlSchemaCollection)
            myXmlValidatingReader.ValidationType = ValidationType.Schema
            Validate()

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())

        finally
            ' Finished with XmlTextReader
            If Not myXmlValidatingReader Is Nothing
                myXmlValidatingReader.Close()
            end if

        end try
    end sub

    private sub Validate()

        try
            ' Set the validation event handler
            Dim valdel as ValidationEventHandler = new ValidationEventHandler(addressof ValidationEvent)

            AddHandler myXmlValidatingReader.ValidationEventHandler, valdel

            ' Read XML data
            while myXmlValidatingReader.Read()
            end While

            Dim s as String
            if (success = true)
                s = "successful"
            else
                s = "failed"
            end if
            Console.WriteLine ("Validation finished. Validation {0}", s)

        catch e as XmlException
            Console.WriteLine ("XmlException: {0} ", e.ToString())

        catch e as Exception
            Console.WriteLine ("Exception: {0} ", e.ToString())
        end try
    end sub


    public sub ValidationEvent (errorid as object, args as ValidationEventArgs)

        success = false

        Console.WriteLine(Strings.chr(9) & "Validation error: " & args.Message)

        if (args.Severity = XmlSeverityType.Warning)
            Console.WriteLine("No schema found to enforce validation.")
	elseif (args.Severity = XmlSeverityType.Error)
               Console.WriteLine("validation error occurred when validating the instance document.")
        end if

        if Not (args.Exception is Nothing) ' XSD schema validation error
            Console.WriteLine(args.Exception.SourceUri & "," &  args.Exception.LinePosition & "," & args.Exception.LineNumber)
        end if

        'if (myXmlValidatingReader.Reader.LineNumber > 0)
        '    Console.WriteLine("Line: " & myXmlValidatingReader.Reader.LineNumber & " Position: " & myXmlValidatingReader.Reader.LinePosition)
        'end if
    end sub

end Class
end Namespace
