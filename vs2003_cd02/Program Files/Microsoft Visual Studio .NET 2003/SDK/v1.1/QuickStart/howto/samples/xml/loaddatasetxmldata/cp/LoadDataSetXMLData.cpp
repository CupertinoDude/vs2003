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
using namespace System::Xml;
using namespace System::Data;

namespace HowToSamplesXML
{
__gc public class LoadDataSetXMLDataSample
{
protected:
    static String *document = S"books.xml";
    static String *myLoadSchema = S"books.xsd";
    XmlDataDocument* myXmlDataDocument;

public:
    void Main()
    {
        String* args[] = {document, myLoadSchema};
        LoadDataSetXMLDataSample* myLoadDataSetXMLDataSample = new LoadDataSetXMLDataSample();
        myLoadDataSetXMLDataSample->Run(args);
    }

    void Run(String* args[])
    {
        try
        {
            Console::WriteLine(S"Creating an XmlDataDocument ...");
            myXmlDataDocument = new XmlDataDocument();
            ParseSchema(args[1]);
            DisplayTableStructure();

            myXmlDataDocument->Load(args[0]);

            DisplayTables(myXmlDataDocument->DataSet);
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
        DataTable* localTable;
        DataColumn* localColumn;
        int tableCount = myXmlDataDocument->DataSet->Tables->Count;

        Console::WriteLine(S"Table structure \r\n");
        Console::WriteLine(S"Tables count={0}", __box(tableCount));
        for (int i = 0; i < tableCount; i++)
        {
            localTable = myXmlDataDocument->DataSet->Tables->Item[i];
            Console::WriteLine(S"\r\nTableName='{0}'." , localTable->TableName );
            Console::WriteLine(S"Columns count={0}", __box(localTable->Columns->Count));

            for (int j = 0; j < localTable->Columns->Count; j++)
            {
                localColumn = localTable->Columns->Item[j];
                Console::Write(S"\tColumnName='{0},", localColumn->ColumnName->ToString());
                Console::Write(S" type = {0}", localColumn->DataType->ToString());
                Console::WriteLine();
            }
        }
    }

    // Displays the contents of the DataSet tables
private:
    void DisplayTables(DataSet* dataset)
    {
        // Navigate Dataset
        Console::WriteLine(S"\r\nContent of Tables ...");

        DataTable* table;
        DataColumn* column;
        DataRow* row;
        
        for(int i = 0; i < dataset->Tables->Count; i++)
        {
            table = dataset->Tables->Item[i];
            Console::WriteLine(S"TableName = {0}" ,table->TableName);
            Console::WriteLine (S"---------");
            Console::WriteLine(S"Columns ...");

            for(int j = 0; j < table->Columns->Count; j++)
            {
                column = table->Columns->Item[j];
                Console::Write(S"{0,-22}",column->ColumnName);
            }
            Console::WriteLine(S"\r\nNumber of rows = {0}", __box(table->Rows->Count));
            Console::WriteLine(S"Rows ...");

            for(j = 0; j < table->Rows->Count; j++)
            {
                DataRow* row;
                row = table->Rows->Item[j];
                for(int k = 0;k < table->Columns->Count; k++)
                {
                    Object* value = row->Item[k];
                    Console::Write(S"{0,-22}",value->ToString());
                }
                Console::WriteLine();
            }
            Console::WriteLine();
        }
    }

}; // End class LoadDataSetXMLDataSample
} // End namespace HowTo.Samples.XML


//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the LoadDataSetXMLDataSample class
    LoadDataSetXMLDataSample* MyLoadDataSetXMLDataSample = new LoadDataSetXMLDataSample();
    MyLoadDataSetXMLDataSample->Main();      

}
