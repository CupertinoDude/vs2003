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
using namespace System::Xml::XPath;

namespace HowToSamplesXML
{
__gc public class XmlNodeReaderSample
{
protected:
    static String *document = S"books.xml";

public:
    void Main()
    {
        XmlNodeReaderSample* myXmlNodeReaderSample = new XmlNodeReaderSample();
        myXmlNodeReaderSample->Run(document);
    }

    void Run(String* args)
    {
        try
        {
            // Load the XML from file
            Console::WriteLine ();
            Console::WriteLine (S"Loading file {0} ... \r\n", args);

            XmlDocument* myXmlDocument = new XmlDocument();
            myXmlDocument->Load (args);

            Console::WriteLine (S"XmlDocument loaded with XML data successfully ... ");

            Console::WriteLine();
            Console::WriteLine (S"Create an XmlNodeReader to show the third book ...");
            Console::WriteLine();

            XmlNodeReader* myXmlNodeReader = new XmlNodeReader (myXmlDocument->SelectSingleNode(S"bookstore/book[3]"));

            FormatXml (myXmlNodeReader);

            Console::WriteLine ();
            Console::WriteLine (S"Create an XmlNodeReader to show the second book ... ");
            Console::WriteLine ();

            myXmlNodeReader = new XmlNodeReader (myXmlDocument->SelectSingleNode(S"bookstore/book[2]"));

            myXmlNodeReader->Read();
            Console::WriteLine (myXmlNodeReader->ReadInnerXml());

        }
        catch (XmlException* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

private:
    void FormatXml (XmlNodeReader* reader)
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
    void Format(XmlNodeReader* reader, String* NodeType)
    {
        // Format the output
        for (int i=0; i < reader->Depth; i++)
        {
            Console::Write(S"\t");
        }

        Console::Write(String::Concat(NodeType, S"<", reader->Name, S">", reader->Value));
        Console::WriteLine();
    }
}; // End class XmlNodeReaderSample
} // End namespace HowToSamplesXML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    XmlNodeReaderSample* MyXmlNodeReaderSample = new XmlNodeReaderSample();
    MyXmlNodeReaderSample->Main();      

}
