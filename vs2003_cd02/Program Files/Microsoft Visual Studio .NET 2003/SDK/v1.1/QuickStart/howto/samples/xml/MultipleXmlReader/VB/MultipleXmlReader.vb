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

public class MultipleXmlReaderSample

    private const document as String = "twopart.xml"

    public shared sub Main()
        Dim myMultipleXmlReaderSample as MultipleXmlReaderSample  = new MultipleXmlReaderSample()
        myMultipleXmlReaderSample.Run(document)
    end sub

    public sub Run(args as String)
        try
            'Create a new file stream for the specified source file.
            Dim filestreamSource as FileStream  = new FileStream(args, FileMode.Open, FileAccess.Read)
            'Create a new reader with the file stream
            Dim reader as XmlTextReader  = new XmlTextReader(filestreamSource)
            'Read the first part of the XML document
            while(reader.Read())
                'Display the elements and stop reading on the part1 end element tag
                'then go to ReadPart2 to start another reader to read the rest of the file.
                Select (reader.NodeType)

                    case XmlNodeType.Element
                        Console.WriteLine("Name: {0}", reader.Name)
                        Console.WriteLine("  Prefix: {0}", reader.Prefix)
                        Console.WriteLine("  LocalName: {0}", reader.LocalName)
                        Console.WriteLine("  Namespace: {0}", reader.NamespaceURI)

                    case XmlNodeType.EndElement
                        'Stop reading at end element for element with localname equal to part1
                        if ("part1" = reader.LocalName) then
                            Console.WriteLine("End reading part 1...")
                            Console.WriteLine()
                            goto ReadPart2
                        end if

                end Select
            end while

            'Read the rest of the XML document
            ReadPart2:
            Console.WriteLine("Begin reading part 2...")
            'Create an XmlNamespaceManager and add the namespaces for the document.
            Dim nsmanager as XmlNamespaceManager  = new XmlNamespaceManager(reader.NameTable)
            'Set default namespace--first param is null.
            nsmanager.AddNamespace(String.Empty, "http://tempuri.org/mydefaultnamespace")
            nsmanager.AddNamespace("myns", "http://tempuri.org/mynamespace")
            nsmanager.AddNamespace("yourns", "http://tempuri.org/yournamespace")
            Dim pc as XmlParserContext  = new XmlParserContext(reader.NameTable, nsmanager, reader.XmlLang, XmlSpace.Default)

            'Reset the filestream to beginning of the source stream
            filestreamSource.Seek(0, SeekOrigin.Begin)
            
            Dim reader2 as XmlTextReader = new XmlTextReader(filestreamSource, XmlNodeType.Element, pc)

            while(reader2.Read())
                Select (reader2.NodeType)

                    case XmlNodeType.Element
                        Console.WriteLine("Element Name: {0}", reader2.Name)
                        Console.WriteLine("  Prefix: {0}", reader2.Prefix)
                        Console.WriteLine("  LocalName: {0}", reader2.LocalName)
                        Console.WriteLine("  Namespace: {0}", reader2.NamespaceURI)

                    case XmlNodeType.EndElement
                        'Stop reading at end element for element with localname equal to part2
                        if ("part2" = reader2.LocalName) then
                            Console.WriteLine("End reading part 2...")
                            goto Done
                        end if

                end Select
            end while

            Done:
            Console.WriteLine("Done.")
            reader.Close()

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

end Class 'MultipleXmlReaderSample
end Namespace 'HowTo.Samples.XML
