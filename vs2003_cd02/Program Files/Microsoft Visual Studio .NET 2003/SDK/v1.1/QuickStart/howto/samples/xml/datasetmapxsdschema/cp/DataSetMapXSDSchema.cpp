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
#using <System.Dll>
#using <System.Xml.Dll>
#using <System.Data.Dll>

using namespace System;
using namespace System::IO;
using namespace System::Data;
using namespace System::Xml;

namespace HowToSamplesXML
{
__gc public class DataSetMapXSDSchemaSample
{
protected:
    static String *myLoadSchema = "books.xsd";
    XmlDataDocument* myXmlDataDocument;

public:
    void Main()
    {
        DataSetMapXSDSchemaSample* myDataSetMapXSDSchemaSample = new DataSetMapXSDSchemaSample();
        myDataSetMapXSDSchemaSample->Run(myLoadSchema);
    }

    void Run(String* args)
    {
        try
        {
            Console::WriteLine(S"Creating an XmlDataDocument ...");
            myXmlDataDocument = new XmlDataDocument();
            ParseSchema(args);
            DisplayTableStructure();
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    // Loads a specified schema into the DataSet
    void ParseSchema(String* schema)
    {
        StreamReader* myStreamReader = 0;

        try
        {
            Console::WriteLine(S"Reading Schema file ...");
            myStreamReader = new StreamReader(schema);
            myXmlDataDocument->DataSet->ReadXmlSchema(myStreamReader);
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

        __finally
        {
            if (myStreamReader != 0)
                myStreamReader->Close();
        }
    }

    // Displays the DataSet tables structure
private:
    void DisplayTableStructure()
    {
        DataTable* table;
        DataColumn* column;

        Console::WriteLine(S"\r\nTable structure\r\n");
        Console::WriteLine(S"Tables count={0}", __box(myXmlDataDocument->DataSet->Tables->Count));
        for (int i = 0; i < myXmlDataDocument->DataSet->Tables->Count; i++)
        {
            table = myXmlDataDocument->DataSet->Tables->Item[i];
            Console::WriteLine(S"TableName='{0}'.", table->TableName);
            Console::WriteLine(S"Columns count={0}", __box(table->Columns->Count));

            for (int j = 0; j < table->Columns->Count; j++)
            {
                column = table->Columns->Item[j];
                Console::WriteLine(S"\tColumnName='{0}', type = {0} ",column->ColumnName , column->DataType->ToString());
            }
            Console::WriteLine();
        }
    }

}; // End class DataSetMapXSDSchemaSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the XPathExpressionSample class
    DataSetMapXSDSchemaSample* MyDataSetMapXSDSchemaSample = new DataSetMapXSDSchemaSample();
    MyDataSetMapXSDSchemaSample->Main();      

}

