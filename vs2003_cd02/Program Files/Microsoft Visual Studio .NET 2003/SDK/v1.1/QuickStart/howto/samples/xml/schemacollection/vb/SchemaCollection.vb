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

Option strict off

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Xml
Imports System.Xml.Schema

namespace HowTo.Samples.XML

public class SchemaCollectionSample

    private const xmlDocument as String = "xmlsc.xml"
    private const xsdDocument as String = "xmlsc.xsd"

    public shared sub Main()
        Dim args As String() = {xmlDocument, xsdDocument}
        Dim mySchemaCollectionSample as SchemaCollectionSample = new SchemaCollectionSample()
        mySchemaCollectionSample.Run(args)
    end sub

    public sub Run(args As String())

        Dim reader as XmlValidatingReader
        Dim xsc as XmlSchemaCollection = new XmlSchemaCollection()

        try 
            xsc.Add(xsdDocument, new XmlTextReader(args(1)))
            reader = new XmlValidatingReader(new XmlTextReader(args(0)))

            ' Set the validation event handler
            Dim valdel as ValidationEventHandler = new ValidationEventHandler(addressof ValidationEvent)

            AddHandler reader.ValidationEventHandler, valdel
            reader.Schemas.Add(xsc)
            reader.ValidationType = ValidationType.Schema
          
            while (reader.Read())
                Dim i as Integer
                For i=0  to (reader.Depth - 1)
                    Console.Write(Chr(9))
                Next
                Console.WriteLine ("{0}<{1}>{2}", reader.NodeType, reader.Name, reader.Value)
                        
                if (reader.NodeType = XmlNodeType.Element)
                    while (reader.MoveToNextAttribute())
                        For i=0  to (reader.Depth - 1)
                            Console.Write(Chr(9))
                        Next
                        Console.WriteLine ("{0}<{1}>{2}", reader.NodeType, reader.Name, reader.Value)
                    end while
                end if
            end while
        catch e as Exception
            Console.WriteLine(e.ToString())
        finally
            if (Not reader is Nothing) 
                reader.Close()
            end if
        end try
    end sub

    public sub ValidationEvent (errorid as object, args as ValidationEventArgs)

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

