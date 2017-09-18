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
__gc public class XmlDocumentEventSample
{
protected:
    static String *document = S"books.xml";

public:
    void Main()
    {
        XmlDocumentEventSample* myXmlDocumentEventSample = new XmlDocumentEventSample();
        myXmlDocumentEventSample->Run(document);
    }

    void Run(String* args)
    {
        try
        {
            // Load the XML from file
            Console::WriteLine ();
            Console::WriteLine (S"Loading file {0} ...", args);

            XmlDocument* myXmlDocument = new XmlDocument();
            myXmlDocument->Load (args);
            
            //Add MyEvent Handlers here
            myXmlDocument->NodeChanged += new XmlNodeChangedEventHandler(this,&XmlDocumentEventSample::MyNodeChangedEvent);
            myXmlDocument->NodeInserted += new XmlNodeChangedEventHandler(this,&XmlDocumentEventSample::MyNodeInsertedEvent);

            Console::WriteLine (S"XmlDocument loaded with XML data successfully ...");

            // Increase all the book prices by 2%
            Console::WriteLine();
            Console::WriteLine(S"Increase all the book prices by 2% ...");
            Console::WriteLine();
            
            // Create a list of the <book> nodes and change their values
            XmlNodeList* myXmlNodeList = myXmlDocument->SelectNodes(S"descendant::book/price");

            XmlNode* myXmlNode;
            for (int i = 0; i < myXmlNodeList->Count; i++)
            {
                myXmlNode = myXmlNodeList->Item(i);
                Console::WriteLine(String::Concat(S"<", myXmlNode->Name, S"> ", myXmlNode->InnerText));
                Double price = Double::Parse(myXmlNode->InnerText);
                myXmlNode->InnerText = String::Format(S"{0:c}",__box(price * 1.02));
            }
                        
            Console::WriteLine();
            Console::WriteLine(S"Adding a new book to the XmlDocument ...");
             Console::WriteLine();

            // Create a new book
            XmlDocumentFragment* myNewBook = myXmlDocument->CreateDocumentFragment();

            myNewBook->InnerXml = (String::Concat(S"<book genre=\" Object-Orientated Technology \" publicationdate=\" 1994 \" ",
                                S"ISBN=\"0-201-63361-2\">",
                                S"<title>Design Patterns - Elements of Reusable Object-Orientated Software</title>",
                                S"<author>",
                                S"<first-name>Eric</first-name>",
                                S"<last-name>Gamma</last-name>",
                                S"</author>",
                                S"<price>49.95</price>",
                                S"</book>"));
            

            XmlElement* rootXmlElement = myXmlDocument->DocumentElement;

            // Add the new book to the XmlDocument
            rootXmlElement->InsertBefore(myNewBook, rootXmlElement->FirstChild);

            Console::WriteLine();
            Console::WriteLine(S"Cloning the first book node in the XmlDocument ...");
            Console::WriteLine();


            // Clone the node and note that by cloning the node we
            // are inserting it again into the XmlDocument
            XmlNode* myNewBook2 = myXmlDocument->DocumentElement->FirstChild->Clone();
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());

        }
    }

    // Handle the Node Changed Event
    void MyNodeChangedEvent(Object* src, XmlNodeChangedEventArgs* args)
    {
        Console::Write(String::Concat(S"Node Changed Event: <", args->Node->Name, S"> changed"));
        if (args->Node->Value != 0)
        {
            Console::WriteLine(String::Concat(S" with value ", args->Node->Value));
        }
        else
            Console::WriteLine(S"");
    }

    // Handle the Node Inserted Event
    void MyNodeInsertedEvent(Object* src, XmlNodeChangedEventArgs* args)
    {
        Console::Write(String::Concat(S"Node Inserted Event: <", args->Node->Name, S"> inserted"));
        if (args->Node->Value != 0)
        {
            Console::WriteLine(String::Concat(S" with value ", args->Node->Value));
        }
        else
            Console::WriteLine("");
    }
    
}; // End class XmlDocumentEvent
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    XmlDocumentEventSample* MyXmlDocumentEventSample = new XmlDocumentEventSample();
    MyXmlDocumentEventSample->Main();      

}
