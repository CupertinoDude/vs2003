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
using namespace System::Data;
using namespace System::Xml;
using namespace System::Xml::Xsl;
using namespace System::Xml::XPath;

namespace HowToSamplesXML
{
__gc public class SaveDataSetXMLDataSample
{
protected:
    static String *m_XmlFile = S"PersonPet.xml";
    static String *m_SchemaFile = S"PersonPet.xsd";

public: 
    void Main()
    {
        SaveDataSetXMLDataSample* mySaveDataSetXMLDataSample = new SaveDataSetXMLDataSample();
        mySaveDataSetXMLDataSample->Run();
    }

    void Run()
    {
        try
        {
            // Load the DataSet with relation data
            DataSet* myDataSet = new DataSet();
            LoadDataSet(myDataSet);

            DisplayTables(myDataSet);

            // Write out schema representation
            myDataSet->WriteXmlSchema(m_SchemaFile);

            // Write out XML data form relational data
            myDataSet->WriteXml(m_XmlFile, XmlWriteMode::IgnoreSchema);

            // Create an XmlDataDocument for the DataSet
            XmlDataDocument* datadoc = new XmlDataDocument(myDataSet);

            // Display the XML
            DisplayXMLData(datadoc);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    // Load a DataSet with relational data
private:
    void LoadDataSet(DataSet* myDataSet)
    {
        try
        {
            Console::WriteLine(S"Loading the DataSet ...");

            // Set DataSet name
            myDataSet->DataSetName = S"PersonPet";

            // Create tables for people and pets
            DataTable* people = new DataTable(S"Person");
            DataTable* pets = new DataTable(S"Pet");

            // Set up the columns in the Tables
            DataColumn* personname = new DataColumn(S"Name", __typeof(String));
            DataColumn* personAge = new DataColumn(S"Age", __typeof(Int32));

            DataColumn* petname = new DataColumn(S"Name", __typeof(String));
            DataColumn* pettype = new DataColumn(S"Type",__typeof(String));

            // Add columns to person table
            DataColumn* id = people->Columns->Add(S"ID", __typeof(Int32));
            id->AutoIncrement = true;
            DataColumn* primarykey[] = new DataColumn*[1];
            primarykey[0] = id;
            people->PrimaryKey = primarykey; //new DataColumn*[];// {id};
            people->Columns->Add (personname);
            people->Columns->Add (personAge);

            // Add columns to pet table
            id = pets->Columns->Add(S"ID", __typeof(Int32));
            id->AutoIncrement = true;
            primarykey[0] = id;
            pets->PrimaryKey = primarykey;//new DataColumn[] {id};
            id->AutoIncrement = true;
            DataColumn* ownerid = pets->Columns->Add(S"OwnerID", __typeof(Int32));
            DataColumn* foreignkey[] = new DataColumn*[1];
            foreignkey[0] = ownerid;
            pets->Columns->Add (petname);
            pets->Columns->Add (pettype);

            // Add tables to the DataSet
            myDataSet->Tables->Add (people);
            myDataSet->Tables->Add (pets);

            // Add people
            DataRow* mark = people->NewRow();
            mark->set_Item(personname, S"Mark");
            mark->set_Item(personAge, __box(18));
            people->Rows->Add(mark);

            DataRow* william = people->NewRow();
            william->set_Item(personname, S"William");
            william->set_Item(personAge, __box(12));
            people->Rows->Add(william);

            DataRow* james = people->NewRow();
            james->set_Item(personname, S"James");
            james->set_Item(personAge, __box(7));
            people->Rows->Add(james);

            DataRow* levi = people->NewRow();
            levi->set_Item(personname, S"Levi");
            levi->set_Item(personAge, __box(4));
            people->Rows->Add(levi);

            // Add relationships
            Console::WriteLine(S"Creating relationships between people and pets ...");
            DataRelation* personpetrel = new DataRelation (S"PersonPet",people->PrimaryKey, foreignkey);
            myDataSet->Relations->Add (personpetrel);

            // Add pets
            DataRow* row = pets->NewRow();
            row->set_Item(S"OwnerID", mark->get_Item(S"ID"));
            row->set_Item(petname, S"Frank");
            row->set_Item(pettype, S"cat");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", william->get_Item(S"ID"));
            row->set_Item(petname, S"Rex");
            row->set_Item(pettype, S"dog");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", james->get_Item(S"ID"));
            row->set_Item(petname, S"Cottontail");
            row->set_Item(pettype, S"rabbit");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", levi->get_Item(S"ID"));
            row->set_Item(petname, S"Sid");
            row->set_Item(pettype, S"snake");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", levi->get_Item(S"ID"));
            row->set_Item(petname, S"Tickles");
            row->set_Item(pettype, S"spider");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", william->get_Item(S"ID"));
            row->set_Item(petname, S"Tweetie");
            row->set_Item(pettype, S"canary");
            pets->Rows->Add(row);

            // commit changes
            myDataSet->AcceptChanges();
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    // Display the contents of the DataSet
    void DisplayTables(DataSet* myDataSet)
    {
        try
        {
            if (myDataSet == 0)
            {
                Console::WriteLine(S"The DataSet is null");
                return;
            }

            Console::WriteLine(String::Concat(S"\r\nDataSet: \r\n", myDataSet->DataSetName, S" contains ..."));

            // Navigate Dataset
            Console::WriteLine(S"No of Tables: {0}  Table content ...\r\n", __box(myDataSet->Tables->Count));
            DataTable* table;
            DataColumn* column;
            DataRow* row;
            DataRelation* relation;

            for(int i = 0; i < myDataSet->Tables->Count; i++)
            {
                table = myDataSet->Tables->Item[i];
                Console::WriteLine(S"TableName = {0}" ,table->TableName);
                Console::WriteLine(S"---------");
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

            // What relationships are there?

            for (int i = 0; i < myDataSet->Relations->Count; i++)
            {
                relation = myDataSet->Relations->Item[i];
                Console::WriteLine(relation->RelationName);
            }

            Console::WriteLine();

            // Who owns which pets ?
            //foreach (DataRow person in myDataSet->Tables["Person"].Rows)
            table = myDataSet->Tables->Item[S"Person"];
            for (int i = 0; i < table->Rows->Count; i++)
            {
                row = table->Rows->Item[i];
                Console::WriteLine (S"Name = {0} owns ", row->Item[S"Name"]);

                DataRow* childrows[] = row->GetChildRows(myDataSet->Relations->Item[S"PersonPet"]);
                for (int j = 0; j < childrows->Count; j++)
                {
                    DataRow* childrow = childrows[j]; //- or - childrows->Item[j]
                    Console::WriteLine(S"\tPet = {0} the {1}", childrow->Item[S"Name"], childrow->Item[S"Type"]);
                }
                Console::WriteLine();
            }
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

    
    // Display data as XML
    void DisplayXMLData(XmlDataDocument* datadoc)
    {
        XmlNodeReader* myXmlNodeReader = 0;

        try
        {
            Console::WriteLine(S"Displaying the XML ...\r\n");
            myXmlNodeReader = new XmlNodeReader (datadoc->SelectSingleNode("/"));
            FormatXml (myXmlNodeReader);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
        __finally
        {
            if (myXmlNodeReader != 0)
                myXmlNodeReader->Close();
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
                    Format (reader, S"Text");
                    break;
            case XmlNodeType::Whitespace:
                    Format (reader, S"Whitespace");
                    break;
            }
        }
    }

    // Format the output
    void Format(XmlReader* reader, String* NodeType)
    {
        // Format the output
        for (int i=0; i < reader->Depth; i++)
        {
            Console::Write(S"\t");
        }

        Console::Write(String::Concat(NodeType, S"<", reader->Name, S">", reader->Value));
        Console::WriteLine();
    }

}; // End class SaveDataSetXMLDataSample
} // End namespace HowTo.Samples.XML

//Run the program
static void main()
{
    //Import the new package
    using namespace HowToSamplesXML;
    //Create the SaveDataSetXMLDataSample class
    SaveDataSetXMLDataSample* mySaveDataSetXMLDataSample = new SaveDataSetXMLDataSample();
    mySaveDataSetXMLDataSample->Main();      

}
