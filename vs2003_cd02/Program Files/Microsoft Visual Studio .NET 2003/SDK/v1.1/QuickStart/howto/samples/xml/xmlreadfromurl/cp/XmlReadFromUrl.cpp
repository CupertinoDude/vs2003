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

namespace HowToSamplesXML
{
__gc public class XmlReadFromURLSample
{

protected:
    //URL to read from
    static String* localURL = S"http://localhost/quickstart/howto/samples/Xml/XmlReadFromUrl/cs/books.xml";

public:
    void Main() 
    {
        XmlReadFromURLSample* myXmlReadFromURLSample = new XmlReadFromURLSample();
        myXmlReadFromURLSample->Run();
    }

    void Run()
    {

        XmlTextReader* MyXmlURLreader = 0;

        try
        {
            // Reading XML from a URL
            Console::WriteLine (S"Initializing XmlTextReader  ...");
            Console::WriteLine (S"Reading from URL:  {0}", localURL);
    
            // Load the XmlTextReader from the URL
            MyXmlURLreader = new XmlTextReader (localURL);

            Console::WriteLine (S"Processing ...");
            Console::WriteLine ();
            FormatXml(MyXmlURLreader);

        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
            Console::WriteLine (S"Make sure that, {0} exists", localURL);
        }

        __finally
        {
            Console::WriteLine();
            Console::WriteLine(S"Processing of URL complete.");
            // Finished with XmlTextReader
            if (MyXmlURLreader != 0)
                ;//MyXmlURLreader::Close();
        }
    }

private:
    void FormatXml (XmlTextReader* reader)
    {
    int declarationCount=0, PI_count=0, Doc_count=0, comment_count=0, element_count=0, attribute_count=0, text_count=0, whitespace_count=0;

    while (reader->Read())
    {
            switch (reader->NodeType)
            {
            case XmlNodeType::XmlDeclaration:
                Format (reader, S"XmlDeclaration");
                declarationCount++;
                break;
            case XmlNodeType::ProcessingInstruction:
                Format (reader, S"ProcessingInstruction");
                PI_count++;
                break;
            case XmlNodeType::DocumentType:
                Format (reader, S"DocumentType");
                Doc_count++;
                break;
            case XmlNodeType::Comment:
                Format (reader, S"Comment");
                comment_count++;
                break;
            case XmlNodeType::Element:
                Format (reader, S"Element");
                element_count++;
                if (reader->HasAttributes)
                    attribute_count += reader->AttributeCount;
                break;
            case XmlNodeType::Text:
                Format (reader, S"Text");
                text_count++;
                break;
            case XmlNodeType::Whitespace:
                whitespace_count++;
                break;
            }
        }

        // Display the Statistics
        Console::WriteLine ();
        Console::WriteLine(S"Statistics for URL");
        Console::WriteLine();
        Console::WriteLine(S"XmlDeclaration: {0}",__box(declarationCount++));
        Console::WriteLine(S"ProcessingInstruction: {0}",__box(PI_count++));
        Console::WriteLine(S"DocumentType: {0}",__box(Doc_count++));
        Console::WriteLine(S"Comment: {0}",__box(comment_count++));
        Console::WriteLine(S"Element: {0}",__box(element_count++));
        Console::WriteLine(S"Attribute: {0}",__box(attribute_count++));
        Console::WriteLine(S"Text: {0}",__box(text_count++));
        Console::WriteLine(S"Whitespace: {0}",__box(whitespace_count++));
    }
    // Format the output
    void Format(XmlTextReader* reader, String* NodeType)
    {
        // Format the output
        Console::Write(String::Concat(__box(reader->Depth), S" "));
        Console::Write(String::Concat(__box(reader->AttributeCount), S" "));
        for (int i=0; i < reader->Depth; i++)
        {
            Console::Write(S"\t");
        }

        Console::Write(String::Concat(NodeType, S"<", reader->Name, S">", reader->Value));
        // Display the attributes values for the current node
        if (reader->HasAttributes)
        {
            Console::Write(S" Attributes:");

            for (int j=0; j < reader->AttributeCount; j++)
            {
                Console::Write(String::Concat(S" [" , __box(j) , S"] " , reader->Item[j]));
            }
        }

        Console::WriteLine();
    }

}; // End class XmlReadFromURLSample
} // End namespace HowToSamplesXML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    XmlReadFromURLSample* myXmlReadFromURLSample = new XmlReadFromURLSample();
    myXmlReadFromURLSample->Main();      

}
       
