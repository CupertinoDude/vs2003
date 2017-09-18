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

namespace HowToSamplesXML
{
__gc public class DOMInterfaceXmlDocumentSample
{
protected:
    static String *document = "books.xml";

public: 
    void Main()
    {
        DOMInterfaceXmlDocumentSample* myDOMInterfaceXmlDocumentSample = new DOMInterfaceXmlDocumentSample();
        myDOMInterfaceXmlDocumentSample->Run(document);
    }

    void Run(String* args)
    {
        XmlTextReader* reader = 0;

        try
        {
            // Load the XML from file
            Console::WriteLine (S"Reading file {0} ...", args);
            reader = new XmlTextReader (args);
            reader->WhitespaceHandling = WhitespaceHandling::None;
            Console::WriteLine (S"File {0} read sucessfully ...", args);

            // Create an XmlDocument from the XmlTextReader
            XmlDocument* myXmlDocument = new XmlDocument();
            myXmlDocument->Load (reader);
            Console::WriteLine (S"XmlDocument loaded with XML data successfully ...");

            // Process the supplied XML file
            Console::WriteLine (S"Processing ...");
            Console::WriteLine ();

            // Start from the document Element
            DisplayTree(myXmlDocument->DocumentElement);
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

    void DisplayTree(XmlNode* node)
    {
        if (node != 0)
            Format (node);

        if (node->HasChildNodes)
        {
            node = node->FirstChild;
            while (node != 0)
            {
                DisplayTree(node);
                node = node->NextSibling;
            }
        }
    }

    // Format the output
private:
    void Format (XmlNode* node)
    {
        if (!node->HasChildNodes)
        {
            Console::Write(S"\t{0}", node->Name);
            Console::WriteLine(S"<{0}>", node->Value );
        }

        else
        {
            Console::Write(node->Name);
            if (XmlNodeType::Element == node->NodeType)
            {
                XmlNamedNodeMap* map = node->Attributes;
                XmlNode* attrnode;
                for (int i = 0; i < map->Count; i++)
                {
                    attrnode = map->Item(i);
                    Console::Write(String::Concat(S" ", attrnode->Name, S"<", attrnode->Value, S"> "));
                }
            }
            Console::WriteLine();
        }
    }

}; // End class DOMInterfaceXmlDocumentSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    DOMInterfaceXmlDocumentSample* MyDOMInterfaceXmlDocumentSample = new DOMInterfaceXmlDocumentSample();
    MyDOMInterfaceXmlDocumentSample->Main();      

}


