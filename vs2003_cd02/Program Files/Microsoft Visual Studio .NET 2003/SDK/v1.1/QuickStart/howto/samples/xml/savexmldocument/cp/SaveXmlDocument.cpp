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
__gc public class SaveXmlDocumentSample
{
protected:
    static String *document = S"books.xml";
    static String *updatedDocument = S"updatebooks.xml";

public:
    void Main()
    {
        String* args[] = {document, updatedDocument};
        SaveXmlDocumentSample* mySaveXmlDocumentSample = new SaveXmlDocumentSample();
        mySaveXmlDocumentSample->Run(args);
    }

    void Run(String* args[])
    {
        try
        {
            // Create XmlDocument and load the XML from file
            XmlDocument* myXmlDocument = new XmlDocument();
            myXmlDocument->Load (new XmlTextReader (args[0]));
            Console::WriteLine (S"XmlDocument loaded with XML data successfully ...");
            Console::WriteLine();

            IncreasePrice(myXmlDocument->DocumentElement);

            // Write out data as XML
            myXmlDocument->Save(args[1]);
            Console::WriteLine();
            Console::WriteLine(S"Updated prices saved in file {0}", args[1]);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    void IncreasePrice(XmlNode* node)
    {
        if (node->Name == S"price")
        {
            node = node->FirstChild;
            Decimal price = Decimal::Parse(node->Value);
            // Increase all the book prices by 2%
            String* newprice = String::Format(S"{0:c}",__box(price * 1.02));
            Console::WriteLine(String::Concat(S"Old Price = ", node->Value, S"\tNew price = ", newprice));
            node->Value = newprice;
        }

        node = node->FirstChild;
        while (node != 0)
        {
            IncreasePrice(node);
            node = node->NextSibling;
        }
    }

}; // End class SaveXmlDocumentSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the SaveXmlDocumentSample class
    SaveXmlDocumentSample* MySaveXmlDocumentSample = new SaveXmlDocumentSample();
    MySaveXmlDocumentSample->Main();      

}





