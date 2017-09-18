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
using namespace System::IO;
using namespace System::Xml;
using namespace System::Xml::Xsl;
using namespace System::Xml::XPath;

namespace HowToSamplesXML
{
__gc public class StreamXmlDocumentSample
{
protected:
    static String *document = S"books.xml";
    static String *newStyleSheet = S"identity.xsl";


public:
    void Main()
    {
        String* args[] = {document, newStyleSheet};
        StreamXmlDocumentSample* myStreamXmlDocumentSample = new StreamXmlDocumentSample();
        myStreamXmlDocumentSample->Run(args);
    }

    void Run(String* args[])
    {
        XmlReader* myXmlReader = 0;
        XmlDataDocument* myXmlDataDocument = new XmlDataDocument();
        XslTransform* myXslTransform = new XslTransform();

        try
        {
            // Load the XML from file
            Console::WriteLine (S"Loading file {0} ...", args[0]);
            myXmlDataDocument->Load (args[0]);
            Console::WriteLine (S"XmlDataDocument loaded with XML data successfully ...\r\n");

            Console::WriteLine (S"Reading XML ...\r\n");
            myXslTransform->Load(args[1]);

            XPathNavigator* myXPathNavigator = myXmlDataDocument->CreateNavigator();
            myXmlReader = myXslTransform->Transform(myXPathNavigator, 0,(XmlResolver*)0);
            FormatXml (myXmlReader);
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

        __finally
        {
            // Close the reader
            if (myXmlReader != 0)
                myXmlReader->Close();
        }
    }

private: 
    void FormatXml (XmlReader* reader)
    {
        while (reader->Read())
        {
            switch (reader->NodeType)
            {
            case XmlNodeType::ProcessingInstruction:
                Format (reader, S"ProcessingInstruction");
                break;
            case XmlNodeType::DocumentType:
                Format (reader, S"DocumentType");
                break;
            case XmlNodeType::Document:
                Format (reader, S"Document");
                break;
            case XmlNodeType::Comment:
                Format (reader, S"Comment");
                break;
            case XmlNodeType::Element:
                Format (reader, S"Element");
                while(reader->MoveToNextAttribute())
                {
                    Format (reader, S"Attribute");
                }
                break;
            case XmlNodeType::Text:
                Format (reader, S"Text");
                break;
            case XmlNodeType::Whitespace:
                Format (reader, S"Whitespace");
                break;
            }
        }
    }

    // Format the output
    void Format(XmlReader* reader, String* NodeType)
    {
        // Format the output
        Console::Write(S"{0} ", __box(reader->Depth));
        Console::Write(S"{0} ", __box(reader->AttributeCount));
        for (int i=0; i < reader->Depth; i++)
        {
            Console::Write(S"\t");
        }

        Console::Write(String::Concat(NodeType, S"<", reader->Name, S">", reader->Value));
        Console::WriteLine();
    }

}; // End class StreamXmlDocumentSample
} // End namespace HowTo.Samples.XML


//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the StreamXmlDocumentSample class
    StreamXmlDocumentSample* MyStreamXmlDocumentSample = new StreamXmlDocumentSample();
    MyStreamXmlDocumentSample->Main();      

}


