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
using namespace System::Xml;
using namespace System::Xml::Schema;

namespace HowToSamplesXML
{
__gc public class SchemaCollectionSample
{
protected:
    static String *xmlDocument = S"xmlsc.xml";
    static String *xsdDocument = S"xmlsc.xsd";
        
public:
    void Main()
    {
        String* args[] = {xmlDocument, xsdDocument};
        SchemaCollectionSample* mySchemaCollectionSample = new SchemaCollectionSample();
        mySchemaCollectionSample->Run(args);
    }

    void Run(String* args[])
    {  
        XmlValidatingReader* reader = 0;
        XmlSchemaCollection* xsc = new XmlSchemaCollection();

        try 
        {
            xsc->Add(xsdDocument , new XmlTextReader(args[1]));
            reader = new XmlValidatingReader(new XmlTextReader(args[0]));
            reader->ValidationEventHandler += new ValidationEventHandler (this,&SchemaCollectionSample::ValidationEventHandle);
            reader->Schemas->Add(xsc);
            reader->ValidationType = ValidationType::Schema;

            while (reader->Read())
            {
                for (int i=0; i < reader->Depth; i++)
                    Console::Write(S"\t");
                Console::WriteLine (S"{0}<{1}>{2}", __box(reader->NodeType), reader->Name, reader->Value);
                
                if (reader->NodeType == XmlNodeType::Element)
                    while(reader->MoveToNextAttribute())
                    {
                        for (int i=0; i < reader->Depth; i++)
                            Console::Write(S"\t");
                        Console::WriteLine (S"{0}<{1}>{2}", __box(reader->NodeType), reader->Name, reader->Value);                   
                    }
            }
        }
        catch (Exception* e) 
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
        __finally
        {
            if (reader != 0) 
                reader->Close();
        }
    }
    void ValidationEventHandle (Object* sender, ValidationEventArgs* args)
    {
        Console::WriteLine(S"\tValidation error: {0}", args->Message);

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

};// End class SchemaCollectionSample
}// End of HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the SchemaCollectionSample class
    SchemaCollectionSample* mySchemaCollectionSample = new SchemaCollectionSample();
    mySchemaCollectionSample->Main();      

}

