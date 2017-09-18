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

public class ValidationReadingXMLSample
{
    private const String document1 = "booksDTD.xml";
    private const String document2 = "booksDTDFail.xml";
    private const String document3 = "booksSchema.xml";
    private const String document4 = "booksSchemaFail.xml";
    private const String document5 = "schema.xsd";

    private XmlValidatingReader myXmlValidatingReader = null;
    private XmlTextReader myXmlTextReader = null;
    private Boolean Success = true;

    public static void Main()
    {
        String[] args = {document1, document2, document3, document4, document5};
        ValidationReadingXMLSample myValidationReadingXMLSample = new ValidationReadingXMLSample();
        myValidationReadingXMLSample.Run(args);
    }

    public void Run(String[] args)
    {
        try
        {
           // Validate the XML file with the DTD
            Console.WriteLine();
            Console.WriteLine("Validating XML file booksDTD.xml with DTD file books.dtd ...");
            myXmlTextReader = new XmlTextReader (args[0]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader.ValidationType = ValidationType.DTD;
            Validate();

            // DTD Validation failure
            Success = true;
            Console.WriteLine();
            Console.WriteLine("Validation XML file booksDTDFail.xml with DTD file books.dtd ...");
            myXmlTextReader = new XmlTextReader (args[1]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader.ValidationType = ValidationType.DTD;
            Validate();

            XmlSchemaCollection myXmlSchemaCollection = new XmlSchemaCollection();
            myXmlSchemaCollection.Add("schema.xsd" , new XmlTextReader(args[4]));

            // Validate the XML file with the schema
            Success = true;
            Console.WriteLine();
            Console.WriteLine("Validation XML file booksSchema.xml with schema file schema.xsd ...");
            myXmlTextReader = new XmlTextReader (args[2]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader.Schemas.Add(myXmlSchemaCollection);
            myXmlValidatingReader.ValidationType = ValidationType.Schema;
            Validate();

            // Schema Validation failure
            Success = true;
            Console.WriteLine();
            Console.WriteLine("Validation XML file booksSchemaFail.xml with schema file schema.xsd ...");
            myXmlTextReader = new XmlTextReader (args[3]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader.Schemas.Add(myXmlSchemaCollection);
            myXmlValidatingReader.ValidationType = ValidationType.Schema;
            Validate();
        }

        catch (Exception e)
        {
            Console.WriteLine("Exception: " + e.ToString());
        }

        finally
        {
            // Finished with XmlTextReader
            if (myXmlValidatingReader != null)
                myXmlValidatingReader.Close();
        }
    }

    private void Validate()
    {
        try
        {
            // Set the validation event handler
            myXmlValidatingReader.ValidationEventHandler += new ValidationEventHandler (this.ValidationEventHandle);

            // Read XML data
            while (myXmlValidatingReader.Read()){}
            Console.WriteLine ("Validation finished. Validation {0}", (Success==true ? "successful" : "failed"));
        }
        catch (XmlException e)
        {
            Console.WriteLine ("XmlException: " + e.ToString());
        }

        catch (Exception e)
        {
            Console.WriteLine ("Exception: " + e.ToString());
        }
    }

    public void ValidationEventHandle (object sender, ValidationEventArgs args)
    {
        Success = false;

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

}// End class ValidationReadingXMLSample
}// End of HowTo.Samples.XML

