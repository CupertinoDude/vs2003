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
    
__gc public class XmlReadWriteSchemaSample
{
protected:
    static String* document = S"sample.xsd";

public:
    void Main() 
    {
        XmlReadWriteSchemaSample* myXmlReadWriteSchemaSample = new XmlReadWriteSchemaSample();
        myXmlReadWriteSchemaSample->Run(document);
    }

    void Run(String* args) 
    {
        try
        {
            //Create a stringwriter for output
            StringWriter* myStringWriter = new StringWriter();
            XmlTextWriter* myXmlWriter = new XmlTextWriter(myStringWriter);
            myXmlWriter->Formatting = Formatting::Indented;
            myXmlWriter->Indentation = 2;
            
            //Read the Schema
            Console::WriteLine(S"Reading schema {0} ...", args);
            Console::WriteLine();
            XmlSchema* mySchema = XmlSchema::Read(new XmlTextReader(args), 0);
            
            //Write the Schema
            Console::WriteLine(S"Writing schema {0} ...", args);
            Console::WriteLine();
            mySchema->Write(myXmlWriter);
            Console::WriteLine(myStringWriter->ToString());
            
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

    }
}; // End class XmlReadWriteSchemaSample
} // End namespace HowToSamplesXML


//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    XmlReadWriteSchemaSample* myXmlReadWriteSchemaSample = new XmlReadWriteSchemaSample();
    myXmlReadWriteSchemaSample->Main();      

}



