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
#using <System.Data.Dll>

using namespace System;
using namespace System::Xml;

namespace HowToSamplesXML
{
__gc public class LoadXmlDocumentSample
{
protected:
    static String *document = S"books.xml";

public: 
    void Main()
    {
        LoadXmlDocumentSample* myLoadXmlDocumentSample = new LoadXmlDocumentSample();
        myLoadXmlDocumentSample->Run(document);
    }

    void Run(String* args)
    {
        try
        {
            // Load the XML from file
            Console::WriteLine ();
            Console::WriteLine (S"Loading file {0} ...", args);

            XmlDataDocument* myXmlDocument = new XmlDataDocument();
            myXmlDocument->Load (args);

            Console::WriteLine (S"XmlDataDocument loaded with XML data successfully ...");
            
            // Display the XML document.
            myXmlDocument->Save(Console::Out);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

}; // End class LoadXmlDocumentSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    LoadXmlDocumentSample* MyLoadXmlDocumentSample = new LoadXmlDocumentSample();
    MyLoadXmlDocumentSample->Main();      

}
