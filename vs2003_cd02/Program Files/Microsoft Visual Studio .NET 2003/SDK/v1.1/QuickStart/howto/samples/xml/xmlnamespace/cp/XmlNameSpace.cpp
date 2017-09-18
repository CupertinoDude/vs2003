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
using namespace System::Xml::XPath;

namespace HowToSamplesXML
{
__gc public class XmlNameSpaceSample
{
protected:
    static String *document = S"orders.xml";

public:
    void Main()
    {
        XmlNameSpaceSample* myXmlNameSpaceSample = new XmlNameSpaceSample();
        myXmlNameSpaceSample->Run(document);
    }

    void Run(String* args) {

        try
        {
            String* exprString = String::Empty;

            //Create a new XmlDocument for the specified source file and load it.
            XmlDocument* myXmlDocument = new XmlDocument();
            myXmlDocument->Load(args);

            //Create a string containing the XPATH expression to evaluate.
            exprString = String::Format(S"//{0}:item", S"yourns1");

            //Create an XmlNamespaceManager and add the namespaces for the document.
            XmlNamespaceManager* nsmanager = new XmlNamespaceManager(myXmlDocument->NameTable);

            //Map namespaces to prefixes for querying purposes.
            nsmanager->AddNamespace(S"defaultns", S"http://tempuri.org/myUSordersnamespace");
            nsmanager->AddNamespace(S"myns", S"http://tempuri.org/myUSorderprocessornamespace");
            nsmanager->AddNamespace(S"yourns1", S"http://tempuri.org/USvendor1namespace");
            nsmanager->AddNamespace(S"yourns2", S"http://tempuri.org/USvendor2namespace");


            XmlNodeList* nodelist = myXmlDocument->SelectNodes(exprString, nsmanager);

            for (int i = 0; i < nodelist->Count; i++)
            {
                DisplayTree(nodelist->Item(i));
            }
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

    }

    void DisplayTree(XmlNode* node)
    {
        if (node != 0)
            Format (node);

        if (node->HasChildNodes)
        {
            node = node->FirstChild;
            while (node != 0)
            {
                DisplayTree(node);
                node = node->NextSibling;
            }
        }
    }

    // Format the output
    void Format (XmlNode* node)
    {
        if (!node->HasChildNodes)
            Console::WriteLine(String::Concat(S"\t", node->Value));

        else
        {
            Console::Write(node->Name);
            if (XmlNodeType::Element == node->NodeType)
            {
                XmlNamedNodeMap* map = node->Attributes;
                XmlNode* attrnode;
                for (int i = 0; i < map->Count; i++)
                {
                    attrnode = map->Item(i);
                    Console::Write(String::Concat(S" ", attrnode->Name, S"<", attrnode->Value, S"> "));
                }
            }
            Console::WriteLine();
        }
    }

}; // End class XmlNameSpaceSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;

    XmlNameSpaceSample* myXmlNameSpaceSample = new XmlNameSpaceSample();
    myXmlNameSpaceSample->Main();      

}
       




