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
__gc public class NavigateXmlDocumentSample
{
protected:
    static String *document = S"books.xml";

public:
    static void Main()
    {
        NavigateXmlDocumentSample* myNavigateXmlDocumentSample = new NavigateXmlDocumentSample();
        myNavigateXmlDocumentSample->Run(document);
    }

    void Run(String* args)
    {
        try
        {
            // Load the XML from file
            Console::WriteLine ();
            Console::WriteLine (S"Loading file {0} ...", args);

            XPathDocument* myXPathDocument = new XPathDocument(args);

            Console::WriteLine (S"XPathDocument loaded with XML data successfully ...");

            // Get an XPathNavigator from the XPathDocument
            Console::WriteLine (S"Create a Navigator ...");
            //Create an XPathNavigator
            XPathNavigator* myXPathNavigator = myXPathDocument->CreateNavigator();

            // Display contents
            Console::WriteLine (S"Display contents of the file {0}", args);
            Console::WriteLine ();

            myXPathNavigator->MoveToRoot(); // Initialize the myXPathNavigator to start at the root
            DisplayTree(myXPathNavigator); // Display all the nodes

            // Find the price of the first book. Start at the root node
            Console::WriteLine ();
            Console::WriteLine (S"Find the price of the first book by navigating nodes ...");
            myXPathNavigator->MoveToRoot();
            DisplayNode (true, myXPathNavigator); // root node
            DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // ?xml version='1.0'? node
            DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator); //!-- This file ... node
            DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator); // bookstore element
            DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // book element
            DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // title element
            DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator);// author element
            DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator); // price Element
            DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // value of price element

            // Select the book titles
            Console::WriteLine();
            Console::WriteLine(S"Select the book titles with an XPathNodeIterator...");
            myXPathNavigator->MoveToRoot();

            XPathNodeIterator* myXPathNodeIterator = myXPathNavigator->Select("descendant::book/title");

            while(myXPathNodeIterator->MoveNext())
            {
                Console::WriteLine(String::Concat(S"<", myXPathNodeIterator->Current->Name, S">", myXPathNodeIterator->Current->Value));
            };

        } 
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    // Walks the XPathNavigator tree recursively 
    void DisplayTree (XPathNavigator* myXPathNavigator)
    {
        if (myXPathNavigator->HasChildren)
        {
            myXPathNavigator->MoveToFirstChild();

            Format (myXPathNavigator);
            DisplayTree (myXPathNavigator); 

            myXPathNavigator->MoveToParent();
        }
        while (myXPathNavigator->MoveToNext())
        {
            Format (myXPathNavigator);
            DisplayTree (myXPathNavigator); 
        }
    }

    // Format the output
private:
    void Format (XPathNavigator* myXPathNavigator)
    {
        if (!myXPathNavigator->HasChildren)
        {
            if (myXPathNavigator->NodeType == XPathNodeType::Text)
                Console::WriteLine(myXPathNavigator->Value );
            else if (myXPathNavigator->Name != String::Empty)
                Console::WriteLine(String::Concat(S"<", myXPathNavigator->Name, S">"));
            else 
                Console::WriteLine();
        }
        else
        {
            String* element = myXPathNavigator->Name;
            Console::WriteLine(String::Concat(S"<", element, S">"));
        
            // Show the attributes if there are any
            if (myXPathNavigator->MoveToFirstAttribute())
            {
                Console::Write(S"Attributes of <{0}> :", element);
                    
                Console::Write(S"{0}=", myXPathNavigator->Name);
                Console::Write(S"{0} ", myXPathNavigator->ToString());

                while (myXPathNavigator->MoveToNextAttribute())
                {
                    Console::Write(S"{0}=", myXPathNavigator->Name);
                    Console::Write(S"{0} ", myXPathNavigator->ToString());
                }
                
                Console::WriteLine("");
            }
        }
        // Return to the 'Parent' node of the attributes
        //myXPathNavigator->MoveToParent();
    }

    void DisplayNode(Boolean success, XPathNavigator* myXPathNavigator)
    {
        if (success && (myXPathNavigator->NodeType == XPathNodeType::Text))
            Console::WriteLine(myXPathNavigator->Value );
        else if (success && (myXPathNavigator->Name != String::Empty))
            Console::WriteLine(String::Concat(S"<", myXPathNavigator->Name, S">"));
        else
            Console::WriteLine();
    }

}; // End class NavigateXmlDocumentSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the NavigateXmlDocumentSample class
    NavigateXmlDocumentSample* MyNavigateXmlDocumentSample = new NavigateXmlDocumentSample();
    MyNavigateXmlDocumentSample->Main();      

}
