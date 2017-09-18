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
__gc public class ReadXmlStreamSample
{

public:
    void Main()
    {
        ReadXmlStreamSample* myReadXmlStreamSample = new ReadXmlStreamSample();
        myReadXmlStreamSample->Run();
    }

    void Run()
    {
        StringReader* stream;
        XmlTextReader* reader = 0;

        try
        {
            Console::WriteLine ("Initializing StringReader ...");

            stream = new StringReader(String::Concat(S"<?xml version='1.0'?>",
                                      S"<!-- This file represents a fragment of a book store inventory database -->",
                                      S"<bookstore>",
                                      S" <book genre=\"autobiography\" publicationdate=\"1981\" ISBN=\"1-861003-11-0\">",
                                      S"   <title>The Autobiography of Benjamin Franklin</title>",
                                      S"   <author>",
                                      S"       <first-name>Benjamin</first-name>",
                                      S"       <last-name>Franklin</last-name>",
                                      S"   </author>",
                                      S"   <price>8.99</price>",
                                      S" </book>",
                                      S" <book genre=\"novel\" publicationdate=\"1967\" ISBN=\"0-201-63361-2\">",
                                      S"   <title>The Confidence Man</title>",
                                      S"   <author>",
                                      S"       <first-name>Herman</first-name>",
                                      S"       <last-name>Melville</last-name>",
                                      S"   </author>",
                                      S"   <price>11.99</price>",
                                      S" </book>",
                                      S"  <book genre=\"philosophy\" publicationdate=\"1991\" ISBN=\"1-861001-57-6\">",
                                      S"   <title>The Gorgias</title>",
                                      S"   <author>",
                                      S"       <name>Plato</name>",
                                      S"   </author>",
                                      S"   <price>9.99</price>",
                                      S" </book>",
                                      S"</bookstore>"));

            // Load the XmlTextReader from the stream
            reader = new XmlTextReader (stream);

            Console::WriteLine ("Processing ...");
            Console::WriteLine ();
            FormatXml(reader);
        }

        catch (Exception* e)
        {
            Console::WriteLine ("Exception: {0}", e->ToString());
        }

        __finally
        {
            Console::WriteLine();
            Console::WriteLine("Processing of stream complete.");
            // Finished with XmlTextReader
            if (reader != 0)
                reader->Close();
        }
    }

private:
    void FormatXml (XmlReader* reader)
    {
        int piCount=0, docCount=0, commentCount=0, elementCount=0, attributeCount=0, textCount=0, whitespaceCount=0;

        while (reader->Read())
        {
            switch (reader->NodeType)
            {
            case XmlNodeType::ProcessingInstruction:
                Format (reader, "ProcessingInstruction");
                piCount++;
                break;
            case XmlNodeType::DocumentType:
                Format (reader, "DocumentType");
                docCount++;
                break;
            case XmlNodeType::Comment:
                Format (reader, "Comment");
                commentCount++;
                break;
            case XmlNodeType::Element:
                Format (reader, "Element");
                while(reader->MoveToNextAttribute())
                {
                    Format (reader, "Attribute");
                }
                elementCount++;
                if (reader->HasAttributes)
                    attributeCount += reader->AttributeCount;
                break;
            case XmlNodeType::Text:
                Format (reader, "Text");
                textCount++;
                break;
            case XmlNodeType::Whitespace:
                whitespaceCount++;
                break;
            }
        }

        // Display the Statistics
        Console::WriteLine ();
        Console::WriteLine("Statistics for stream");
        Console::WriteLine ();
        Console::WriteLine("ProcessingInstruction: {0}",__box(piCount++));
        Console::WriteLine("DocumentType: {0}",__box(docCount++));
        Console::WriteLine("Comment: {0}",__box(commentCount++));
        Console::WriteLine("Element: {0}",__box(elementCount++));
        Console::WriteLine("Attribute: {0}",__box(attributeCount++));
        Console::WriteLine("Text: {0}",__box(textCount++));
        Console::WriteLine("Whitespace: {0}",__box(whitespaceCount++));
    }

    // Format the output
   void Format(XmlReader* reader, String* nodeType)
    {
        // Format the output
        Console::Write("{0} ",__box(reader->Depth));
        Console::Write("{0} ",__box(reader->AttributeCount));
        for (int i=0; i < reader->Depth; i++)
        {
            Console::Write("\t");
        }

        Console::Write(String::Concat(nodeType, S"<", reader->Name, S">" ,reader->Value));
        Console::WriteLine();
    }

}; // End class ReadXmlStreamSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the ReadXmlStreamSample class
    ReadXmlStreamSample* myReadXmlStreamSample = new ReadXmlStreamSample();
    myReadXmlStreamSample->Main();      

}
