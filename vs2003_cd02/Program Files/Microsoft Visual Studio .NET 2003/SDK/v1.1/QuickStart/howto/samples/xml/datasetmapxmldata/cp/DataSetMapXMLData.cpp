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
__gc public class DataSetMapXMLDataSample
{
protected:
    static String *document = S"books.xml";

public:
    void Main()
    {
        DataSetMapXMLDataSample* myDataSetMapXMLDataSample = new DataSetMapXMLDataSample();
        myDataSetMapXMLDataSample->Run(document);
    }

    void Run(String* args)
    {
        try
        {
            Console::WriteLine(S"Creating an XmlDataDocument ...");
            XmlDataDocument* datadoc = new XmlDataDocument();

            // Infer the DataSet schema from the XML data and load the XML Data
            datadoc->DataSet->ReadXml(new StreamReader(args), XmlReadMode::InferSchema);

            DisplayTables(datadoc->DataSet);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

private:
    // Displays the contents of the DataSet tables
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
}; // End class DataSetMapXMLDataSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the LoadDataSetXMLDataSample class
    DataSetMapXMLDataSample* MyDataSetMapXMLDataSample = new DataSetMapXMLDataSample();
    MyDataSetMapXMLDataSample->Main();      

}


