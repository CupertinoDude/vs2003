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
__gc public class QueryXmlDocumentXPathSample
{
protected:
    static String *localURL = S"http://localhost/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/cs/books.xml";

public: 
    void Main()
    {
        QueryXmlDocumentXPathSample* myQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample();
        myQueryXmlDocumentXPathSample->Run(localURL);
    }

    void Run(String* args)
    {
        Console::WriteLine(S"XPath Test started ...");
   
        XPathDocument* myXPathDocument = new XPathDocument(args);
        XPathNavigator* myXPathNavigator = myXPathDocument->CreateNavigator();

        // Get all the book prices
        XPathQuery(myXPathNavigator, S"descendant::book/price");

        // Get the ISBN of the last book
        XPathQuery(myXPathNavigator, S"bookstore/book[3]/@ISBN");
    }

private:
    void XPathQuery(XPathNavigator* myXPathNavigator, String* xpathexpr )
    {
        try
        {
            Console::WriteLine(S"XPath query: {0}", xpathexpr);

            // Create a node interator to select nodes and move through them (read-only)
            XPathNodeIterator* myXPathNodeIterator =  myXPathNavigator->Select (xpathexpr);

            while (myXPathNodeIterator->MoveNext())
            {
                Console::WriteLine(String::Concat(S"<", myXPathNodeIterator->Current->Name, S"> ", myXPathNodeIterator->Current->Value));
            }

            Console::WriteLine();

        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }
    
}; // End class QueryXmlDocumentXPathSample
} // End namespace HowTo.Samples.XML


//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the QueryXmlDocumentXPathSample class
    QueryXmlDocumentXPathSample* MyQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample();
    MyQueryXmlDocumentXPathSample->Main();      

}
