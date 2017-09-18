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
using namespace System::Globalization;
using namespace System::IO;
using namespace System::Xml;
using namespace System::Xml::XPath;
using namespace System::Collections;

namespace HowToSamplesXML
{

//Custom sort routine for the XPathExpression
public __gc class ISBNCompare : public IComparer
{

public:
    int Compare( Object* First, Object* Second ) 
    {
        Console::WriteLine(S"ISBN's to Compare: 1. {0} 2. {1}", First->ToString(), Second->ToString ());
        return String::Compare(First->ToString(), Second->ToString(), true, CultureInfo::InvariantCulture);
    }
};// End class ISBNCompare

//Begin the XPathExpressionSample
__gc public class XPathExpressionSample
{
protected:
    static String *document = S"books.xml";

public:
    void Main() 
    {
        XPathExpressionSample* myXPathExpressionSample = new XPathExpressionSample();
        myXPathExpressionSample->Run(document);
    }

    void Run(String *args)
    {

        try
        {
            String* selectExpr = String::Empty;
            XPathExpression* myXPathExpr;

            Console::WriteLine();
            Console::WriteLine(S"XPathExpression started ...");
            Console::WriteLine();

            XPathDocument* myXPathDocument = new XPathDocument(args);

             //Create an XPathNavigator
            XPathNavigator* myXPathNavigator =  myXPathDocument->CreateNavigator();
     
            // Get the Book elements
            selectExpr = S"bookstore/book";

            Console::WriteLine(S"XPath query: {0}", selectExpr);

            // Ensure we are at the root node
            myXPathNavigator->MoveToRoot();

            myXPathExpr = myXPathNavigator->Compile(selectExpr);
            
            Console::WriteLine();
            Console::WriteLine(S"Original order ...");
            Console::WriteLine();

            // Create an XPathNodeIterator to walk over the selected nodes
            XPathNodeIterator* myXPathNodeIterator = myXPathNavigator->Select (myXPathExpr);

            FormatXml(myXPathNodeIterator);

            // Ensure we are at the root node
            myXPathNavigator->MoveToRoot();

            Console::WriteLine();
            Console::WriteLine(S"Sort by ISBN (using IComparer - Text ascending)...");
            Console::WriteLine();

            // Create comparision class for the ISBN number
            ISBNCompare* myISBNCompare = new ISBNCompare();
            // Add a comparer to do a string compare on the ISBN number
            myXPathExpr->AddSort(S"@ISBN", myISBNCompare);

            myXPathNodeIterator = myXPathNavigator->Select (myXPathExpr);

            FormatXml(myXPathNodeIterator);
            
            // Create Second XPathNavigator
            XPathNavigator* myXPathNavigator2 = myXPathDocument->CreateNavigator();

            // Ensure we are at the root node
            myXPathNavigator2->MoveToRoot();
            myXPathExpr = myXPathNavigator2->Compile(selectExpr);

            Console::WriteLine();
            Console::WriteLine(S"Sort by publication date (using XSLT expression - Text descending) ...");
            Console::WriteLine();

            // Add an XSLT based sort
            String* MyStr = S"@publicationdate";
            myXPathExpr->AddSort(MyStr, XmlSortOrder::Descending, XmlCaseOrder::None, S"", XmlDataType::Text);

            myXPathNodeIterator = myXPathNavigator2->Select (myXPathExpr);

            FormatXml(myXPathNodeIterator);
  
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

private:
    void FormatXml (XPathNodeIterator* nav)
    {
        // Loop getting information about each node
        while (nav->MoveNext())
        {
            switch (nav->Current->NodeType)
            {
            case XmlNodeType::ProcessingInstruction:
                Format (nav, S"ProcessingInstruction");
                break;
            case XmlNodeType::Comment:
                Format (nav, S"Comment");
                break;
            case XmlNodeType::Element:
                Format (nav, S"Element");
                break;
            case XmlNodeType::Text:
                Format (nav, S"Text");
                break;
            case XmlNodeType::Whitespace:
                Format (nav, S"Whitespace");
                break;
            }
        }
        Console::WriteLine();
    }

    // Format the output
    void Format (XPathNodeIterator* nav, String* NodeType)
    {

        if (nav->Current->HasAttributes) 
        {
            Console::Write(String::Concat(S"<", nav->Current->Name));
            nav->Current->MoveToFirstAttribute();
            Console::Write(String::Concat(S" ", nav->Current->Name, S"=", nav->Current->Value));
            while (nav->Current->MoveToNextAttribute())
                Console::Write(String::Concat(S" ", nav->Current->Name, S"=", nav->Current->Value));
            Console::Write(S">");
        }
        // Return to the 'Parent' node of the attributes
        nav->Current->MoveToParent();
        Console::WriteLine("");
    }

}; // End class XPathExpressionSample
} // End namespace HowToSamplesXML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    XPathExpressionSample* myXPathExpressionSample = new XPathExpressionSample();
    myXPathExpressionSample->Main();      

}
       
