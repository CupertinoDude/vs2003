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
__gc public class WriteXmlFileSample
{
protected:
    static String *document = S"newbooks.xml";

public:
    void Main()
    {
        WriteXmlFileSample* myWriteXmlFileSample = new WriteXmlFileSample();
        myWriteXmlFileSample->Run(document);
    }

    void Run(String* args)
    {
        XmlTextWriter* myXmlTextWriter = 0;
        XmlTextReader* myXmlTextReader = 0;

        try
        {

            myXmlTextWriter = new XmlTextWriter (args, 0);

            myXmlTextWriter->Formatting = Formatting::Indented;
            myXmlTextWriter->WriteStartDocument(false);
            myXmlTextWriter->WriteDocType(S"bookstore", 0, S"books.dtd", 0);
            myXmlTextWriter->WriteComment(S"This file represents another fragment of a book store inventory database");
            myXmlTextWriter->WriteStartElement(S"bookstore");
            myXmlTextWriter->WriteStartElement(S"book", 0);
            myXmlTextWriter->WriteAttributeString(S"genre",S"autobiography");
            myXmlTextWriter->WriteAttributeString(S"publicationdate",S"1979");
            myXmlTextWriter->WriteAttributeString(S"ISBN",S"0-7356-0562-9");
            myXmlTextWriter->WriteElementString(S"title", 0, S"The Autobiography of Mark Twain");
            myXmlTextWriter->WriteStartElement(S"Author", 0);
            myXmlTextWriter->WriteElementString(S"first-name", S"Mark");
            myXmlTextWriter->WriteElementString(S"last-name", S"Twain");
            myXmlTextWriter->WriteEndElement();
            myXmlTextWriter->WriteElementString(S"price", S"7.99");
            myXmlTextWriter->WriteEndElement();
            myXmlTextWriter->WriteEndElement();

            //Write the XML to file and close the writer
            myXmlTextWriter->Flush();
            myXmlTextWriter->Close();

            // Read the file back in and parse to ensure well formed XML
            myXmlTextReader = new XmlTextReader (args);
            FormatXml (myXmlTextReader, args);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());

        }

        __finally
        {
            Console::WriteLine();
            Console::WriteLine(S"Processing of the file {0} complete.", args);
            if (myXmlTextReader != 0)
                myXmlTextReader->Close();
            //Close the writer
            if (myXmlTextWriter != 0)
                myXmlTextWriter->Close();
        }
    }

private:
    void FormatXml (XmlTextReader* reader, String* filename)
    {
        int piCount=0, docCount=0, commentCount=0, elementCount=0, attributeCount=0, textCount=0, whitespaceCount=0;

        while (reader->Read())
        {
            switch (reader->NodeType)
            {
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

        // Display the Statistics for the file
        Console::WriteLine ();
        Console::WriteLine(S"Statistics for {0} file", filename);
        Console::WriteLine();
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
        Console::WriteLine();
    }

}; // End class WriteXmlFileSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the WriteXmlFileSample class
    WriteXmlFileSample* myWriteXmlFileSample = new WriteXmlFileSample();
    myWriteXmlFileSample->Main();      

}


