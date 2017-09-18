//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.IO;
using System.Xml;

namespace HowTo.Samples.XML
{

public class MultipleXmlReaderSample
{
    private const String document = "twopart.xml";

    public static void Main()
    {
        MultipleXmlReaderSample myMultipleXmlReaderSample = new MultipleXmlReaderSample();
        myMultipleXmlReaderSample.Run(document);
    }

    public void Run(String args)
    {
        try
        {
            //Create a new file stream for the specified source file.
            FileStream filestreamSource = new FileStream(args, FileMode.Open, FileAccess.Read);
            //Create a new reader with the file stream
            XmlTextReader reader = new XmlTextReader(filestreamSource);
            //Read the first part of the XML document
            while(reader.Read())
            {
                //Display the elements and stop reading on the part1 endelement tag
                //then go to ReadPart2 to start another reader to read the rest of the file.
                switch(reader.NodeType)
                {
                    case XmlNodeType.Element:
                        Console.WriteLine("Name: {0}", reader.Name);
                        Console.WriteLine("  Prefix: {0}", reader.Prefix);
                        Console.WriteLine("  LocalName: {0}", reader.LocalName);
                        Console.WriteLine("  Namespace: {0}", reader.NamespaceURI);
                        break;
                    case XmlNodeType.EndElement:
                        //Stop reading at end element for element with localname equal to part1
                        if ("part1"==reader.LocalName)
                        {
                            Console.WriteLine("End reading part 1...");
                            Console.WriteLine();
                            goto ReadPart2;
                        }
                        break;
                }
            }

            //Read the rest of the XML document
            ReadPart2:
            Console.WriteLine("Begin reading part 2...");
            //Create an XmlNamespaceManager and add the namespaces for the document.
            XmlNamespaceManager nsmanager = new XmlNamespaceManager(reader.NameTable);
            //Set default namespace--first param is null.
            nsmanager.AddNamespace(String.Empty, "http://tempuri.org/mydefaultnamespace");
            nsmanager.AddNamespace("myns", "http://tempuri.org/mynamespace");
            nsmanager.AddNamespace("yourns", "http://tempuri.org/yournamespace");
            XmlParserContext pc = new XmlParserContext(reader.NameTable, nsmanager, reader.XmlLang, XmlSpace.Default);

            // Reset the filestream to beginning of the source stream
            filestreamSource.Seek(0, SeekOrigin.Begin);
            
            XmlTextReader reader2 = new XmlTextReader(filestreamSource, XmlNodeType.Element, pc);

            while(reader2.Read())
            {
                switch (reader2.NodeType)
                {
                    case XmlNodeType.Element:
                        Console.WriteLine("Element Name: {0}", reader2.Name);
                        Console.WriteLine("  Prefix: {0}", reader2.Prefix);
                        Console.WriteLine("  LocalName: {0}", reader2.LocalName);
                        Console.WriteLine("  Namespace: {0}", reader2.NamespaceURI);
                        break;
                    case XmlNodeType.EndElement:
                        //Stop reading at end element for element with localname equal to part2
                        if ("part2"==reader2.LocalName)
                        {
                            Console.WriteLine("End reading part 2...");
                            goto Done;
                        }
                        break;
                }
            }

            Done:
            Console.WriteLine("Done.");
            reader.Close();

        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }
} // End class MultipleXmlReaderSample
} // End namespace HowTo.Samples.XML


