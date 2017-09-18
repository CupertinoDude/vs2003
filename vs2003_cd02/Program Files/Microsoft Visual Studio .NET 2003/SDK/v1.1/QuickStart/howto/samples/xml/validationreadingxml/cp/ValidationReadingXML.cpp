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

#using <mscorlib.dll>
#using <System.Xml.Dll>

using namespace System;
using namespace System::IO;
using namespace System::Xml;
using namespace System::Xml::Schema;

namespace HowToSamplesXML
{
__gc public class ValidationReadingXMLSample
{
protected:
    static String *document1 = S"booksDTD.xml";
    static String *document2 = S"booksDTDFail.xml";
    static String *document3 = S"booksSchema.xml";
    static String *document4 = S"booksSchemaFail.xml";
    static String *document5 = S"schema.xsd";

    static XmlValidatingReader* myXmlValidatingReader = 0;
    static XmlTextReader* myXmlTextReader = 0;
    static Boolean Success = true;

public:
    void Main()
    {
        String* args[] = {document1, document2, document3, document4, document5};
        ValidationReadingXMLSample* myValidationReadingXMLSample = new ValidationReadingXMLSample();
        myValidationReadingXMLSample->Run(args);
    }

    void Run(String* args[])
    {
        try
        {
           // Validate the XML file with the DTD
            Console::WriteLine();
            Console::WriteLine(S"Validating XML file booksDTD.xml with DTD file books.dtd ...");
            myXmlTextReader = new XmlTextReader (args[0]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader->ValidationType = ValidationType::DTD;
            Validate();

            // DTD Validation failure
            Success = true;
            Console::WriteLine();
            Console::WriteLine(S"Validation XML file booksDTDFail.xml with DTD file books.dtd ...");
            myXmlTextReader = new XmlTextReader (args[1]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader->ValidationType = ValidationType::DTD;
            Validate();

            XmlSchemaCollection* myXmlSchemaCollection = new XmlSchemaCollection();
            myXmlSchemaCollection->Add(S"schema.xsd" , new XmlTextReader(args[4]));

            // Validate the XML file with the schema
            Success = true;
            Console::WriteLine();
            Console::WriteLine(S"Validation XML file booksSchema.xml with schema file schema.xsd ...");
            myXmlTextReader = new XmlTextReader (args[2]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader->Schemas->Add(myXmlSchemaCollection);
            myXmlValidatingReader->ValidationType = ValidationType::Schema;
            Validate();

            // Schema Validation failure
            Success = true;
            Console::WriteLine();
            Console::WriteLine(S"Validation XML file booksSchemaFail.xml with schema file schema.xsd ...");
            myXmlTextReader = new XmlTextReader (args[3]);
            myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
            myXmlValidatingReader->Schemas->Add(myXmlSchemaCollection);
            myXmlValidatingReader->ValidationType = ValidationType::Schema;
            Validate();
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

        __finally
        {
            // Finished with XmlTextReader
            if (myXmlValidatingReader != 0)
                myXmlValidatingReader->Close();
        }
    }

    void Validate()
    {
        try
        {
            // Set the validation event handler
            myXmlValidatingReader->ValidationEventHandler += new ValidationEventHandler (this, &ValidationReadingXMLSample::ValidationEventHandle);

            // Read XML data
            while (myXmlValidatingReader->Read()){}
            String* validationSuccess = (Success==true ? S"successful" : S"failed");
            Console::WriteLine (S"Validation finished. Validation {0}", validationSuccess);
        }
        catch (XmlException* e)
        {
            Console::WriteLine (S"XmlException: {0}", e->ToString());
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    void ValidationEventHandle (Object* sender, ValidationEventArgs* args)
    {
        Success = false;

        Console::WriteLine(String::Concat(S"\tValidation error: ", args->Message));

        if (args->Severity == XmlSeverityType::Warning)
        {
            Console::WriteLine(S"No schema found to enforce validation.");
        } else
            if (args->Severity == XmlSeverityType::Error)
            {
                   Console::WriteLine(S"validation error occurred when validating the instance document.");
            } 

        if (args->Exception != 0) // XSD schema validation error
        {
            Console::WriteLine(String::Concat(args->Exception->SourceUri, S",", __box(args->Exception->LinePosition), S",", args->Exception->LineNumber));
        }

    }

};// End class ValidationReadingXMLSample
}// End of HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the ValidationReadingXMLSample class
    ValidationReadingXMLSample* myValidationReadingXMLSample = new ValidationReadingXMLSample();
    myValidationReadingXMLSample->Main();      

}
