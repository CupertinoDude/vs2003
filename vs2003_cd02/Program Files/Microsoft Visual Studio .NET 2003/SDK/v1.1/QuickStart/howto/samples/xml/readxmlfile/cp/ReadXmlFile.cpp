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
__gc public class ReadXmlFileSample
{
protected:
    static String *document = "books.xml";

public:
    void Main()
    {
        ReadXmlFileSample* myReadXmlFileSample = new ReadXmlFileSample();
        myReadXmlFileSample->Run(document);
    }

    void Run(String* args)
    {
        XmlTextReader* reader = 0;

        try
        {
            // Load the file with an XmlTextReader
            Console::WriteLine (S"Reading file {0} ...", args);
            reader = new XmlTextReader (args);
            Console::WriteLine (S"File {0} read sucessfully ...", args);

            // Process the supplied XML file
            Console::WriteLine (S"Processing ...");
            Console::WriteLine ();
            FormatXml(reader, args);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Failed to read the file {0}", args);
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

        __finally
        {
            Console::WriteLine();
            Console::WriteLine(S"Processing of the file {0} complete.", args);
            // Finished with XmlTextReader
            if (reader != 0)
                reader->Close();
        }
    }

private:
    void FormatXml (XmlReader* reader, String* filename)
    {
        int declarationCount=0, piCount=0, docCount=0, commentCount=0, elementCount=0, attributeCount=0, textCount=0, whitespaceCount=0;

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
                piCount++;
                break;
            case XmlNodeType::DocumentType:
                Format (reader, S"DocumentType");
                docCount++;
                break;
            case XmlNodeType::Comment:
                Format (reader, S"Comment");
                commentCount++;
                break;
            case XmlNodeType::Element:
                Format (reader, S"Element");
                while(reader->MoveToNextAttribute())
                {
                    Format (reader, S"Attribute");
                }
                elementCount++;
                if (reader->HasAttributes)
                    attributeCount += reader->AttributeCount;
                break;
            case XmlNodeType::Text:
                Format (reader, S"Text");
                textCount++;
                break;
            case XmlNodeType::Whitespace:
                whitespaceCount++;
                break;
            }
        }

        // Display the Statistics
        Console::WriteLine ();
        Console::WriteLine(S"Statistics for stream");
        Console::WriteLine();
        Console::WriteLine(S"XmlDeclaration: {0}",__box(declarationCount++));
        Console::WriteLine(S"ProcessingInstruction: {0}",__box(piCount++));
        Console::WriteLine(S"DocumentType: {0}",__box(docCount++));
        Console::WriteLine(S"Comment: {0}",__box(commentCount++));
        Console::WriteLine(S"Element: {0}",__box(elementCount++));
        Console::WriteLine(S"Attribute: {0}",__box(attributeCount++));
        Console::WriteLine(S"Text: {0}",__box(textCount++));
        Console::WriteLine(S"Whitespace: {0}",__box(whitespaceCount++));
    }

    // Format the output
    void Format(XmlReader* reader, String* NodeType)
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
            Console::Write(" Attributes:");

            for (int j=0; j < reader->AttributeCount; j++)
            {
                Console::Write(String::Concat(S" [" , __box(j) , S"] " , reader->Item[j]));
            }
        }

        Console::WriteLine();
    }

}; // End class ReadXmlFileSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    ReadXmlFileSample* myReadXmlFileSample = new ReadXmlFileSample();
    myReadXmlFileSample->Main();      

}




