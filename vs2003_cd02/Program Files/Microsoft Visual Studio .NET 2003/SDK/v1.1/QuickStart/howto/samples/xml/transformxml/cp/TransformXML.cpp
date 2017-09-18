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
using namespace System::Xml::Xsl;
using namespace System::Xml::XPath;

namespace HowToSamplesXML
{
__gc public class TransformXMLSample
{
protected:
    static String *document1 = S"books.xml";
    static String *document2 = S"ProcessParametersA.xml";
    static String *document3 = S"ProcessParametersB.xml";
    static String *styleSheet1 = S"books.xsl";
    static String *styleSheet2 = S"StyleSheetGenerator.xsl";

public:
    void Main()
    {
        TransformXMLSample* myTransformXMLSample = new TransformXMLSample();
        Console::WriteLine(S"\n\n*********Output from the first transform:*********\n\n");
        String* args1[] = {document1, styleSheet1};
        myTransformXMLSample->Run(args1);
        Console::WriteLine(S"\n\n*********Output from the second transform:*********\n\n");
        String* args2[] = {document2, styleSheet2};
        myTransformXMLSample->Run(args2);
        Console::WriteLine(S"\n\n*********Output from the third transform:*********\n\n");
        String* args3[] = {document3, styleSheet2};
        myTransformXMLSample->Run(args3);
    }

    void Run(String* args[])
    {
        Console::WriteLine();
        Console::WriteLine(S"Read XML data file, transform and format display ...");
        Console::WriteLine();

        ReadTransform(args);

        Console::WriteLine();
        Console::WriteLine(S"Read XML data file, transform and write ...");
        Console::WriteLine();

        ReadTransformWrite(args);
        Console::WriteLine();
    }

    void ReadTransform(String* args[])
    {
        try
        {
            XPathDocument* myXPathDocument = new XPathDocument (args[0]);
            XslTransform* myXslTransform = new XslTransform();
            myXslTransform->Load(args[1]);
            XmlReader* reader = myXslTransform->Transform(myXPathDocument, 0, (XmlResolver*)0);

            FormatXml(reader);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    void ReadTransformWrite(String* args[])
    {
        StreamReader* stream = 0;

        try
        {
            XPathDocument* myXPathDocument = new XPathDocument (args[0]);
            XslTransform* myXslTransform = new XslTransform();
            XmlTextWriter* writer = new XmlTextWriter(S"transform.xml", 0);
            myXslTransform->Load(args[1]);
            myXslTransform->Transform(myXPathDocument, 0, writer, 0);

            writer->Close();

            stream = new StreamReader (S"transform.xml");
            Console::Write(stream->ReadToEnd());
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

        __finally
        {
            if (stream != 0)
                stream->Close();
        }
    }

private:
    void FormatXml (XmlReader* reader)
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
                Boolean flag = false;
                // Do not display whitespace text nodes
                 String* s = reader->Value;
                for (int i=0; i < reader->Value->Length; i++)
                {
                    if (!Char::IsWhiteSpace(reader->Value->Chars[i]))
                        flag = true;
                }
                if(flag)
                    Format (reader, S"Text");
                break;
            }
        }
    }

    // Format the output
    void Format(XmlReader* reader, String* nodeType)
    {
        // Format the output
        for (int i=0; i < reader->Depth; i++)
        {
            Console::Write(S"\t");
        }

        Console::Write(String::Concat(nodeType, S"<", reader->Name, S">", reader->Value));
        Console::WriteLine();
    }

}; // End class TransformXMLSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the TransformXMLSample class
    TransformXMLSample* MyTransformXMLSample = new TransformXMLSample();
    MyTransformXMLSample->Main();      

}
