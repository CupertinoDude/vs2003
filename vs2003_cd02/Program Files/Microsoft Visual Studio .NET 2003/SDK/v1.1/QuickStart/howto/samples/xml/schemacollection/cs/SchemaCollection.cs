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

namespace HowTo.Samples.XML
{

using System;
using System.IO;
using System.Xml;
using System.Xml.Schema;

public class SchemaCollectionSample
{
    private const String xmlDocument = "xmlsc.xml";
    private const String xsdDocument = "xmlsc.xsd";
        
    public static void Main()
    {
        String[] args = {xmlDocument, xsdDocument};
        SchemaCollectionSample mySchemaCollectionSample = new SchemaCollectionSample();
        mySchemaCollectionSample.Run(args);
    }

    public void Run(String[] args)
    {  
        XmlValidatingReader reader = null;
        XmlSchemaCollection xsc = new XmlSchemaCollection();

        try 
        {
            xsc.Add(xsdDocument , new XmlTextReader(args[1]));
            reader = new XmlValidatingReader(new XmlTextReader(args[0]));
            reader.ValidationEventHandler += new ValidationEventHandler (this.ValidationEventHandle);
            reader.Schemas.Add(xsc);
            reader.ValidationType = ValidationType.Schema;

            while (reader.Read())
            {
                for (int i=0; i < reader.Depth; i++)
                    Console.Write('\t');
                Console.WriteLine ("{0}<{1}>{2}", reader.NodeType, reader.Name, reader.Value);
                
                if (reader.NodeType == XmlNodeType.Element)
                    while(reader.MoveToNextAttribute())
                    {
                        for (int i=0; i < reader.Depth; i++)
                            Console.Write('\t');
                        Console.WriteLine ("{0}<{1}>{2}", reader.NodeType, reader.Name, reader.Value);                   
                    }
            }
        }
        catch (Exception e) 
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            if (reader != null) 
                reader.Close();
        }
    }
    public void ValidationEventHandle (object sender, ValidationEventArgs args)
    {
        Console.WriteLine("\tValidation error: " + args.Message);

        if (args.Severity == XmlSeverityType.Warning)
        {
            Console.WriteLine("No schema found to enforce validation.");
        } else
        	if (args.Severity == XmlSeverityType.Error)
        	{
            	   Console.WriteLine("validation error occurred when validating the instance document.");
        	} 

        if (args.Exception != null) // XSD schema validation error
        {
            Console.WriteLine(args.Exception.SourceUri + "," +  args.Exception.LinePosition + "," +  args.Exception.LineNumber);
        }

        //if (myXmlValidatingReader.Reader.LineNumber > 0)
        //{
        //    Console.WriteLine("Line: "+ myXmlValidatingReader.Reader.LineNumber + " Position: " + myXmlValidatingReader.Reader.LinePosition);
        //}
    }
} // End class SchemaCollectionSample
} // End namespace HowTo.Samples.XML

