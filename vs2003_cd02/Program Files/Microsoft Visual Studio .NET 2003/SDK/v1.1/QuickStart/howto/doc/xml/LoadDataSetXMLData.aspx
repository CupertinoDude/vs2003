<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Load a DataSet with XML?</h4>

<p>
This sample illustrates how to load a DataSet with XML Data. The sample builds on the topic, <a href="/quickstart/howto/doc/Xml/DataSetMapXSDSchema.aspx">How Do I...Create DataSet mappings from an XSD schema?</a>, by first loading XML data into an XmlDataDocument and then accessing this data from the DataSet. The DataSet has previously loaded a schema in order to create the internal mappings. This sample in effect shows the transition between XML data and the creation of relational objects to access that XML data.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/LoadDataSetXMLData/CS/LoadDataSetXMLData.aspx"
ViewSource="/quickstart/howto/samples/Xml/LoadDataSetXMLData/LoadDataSetXMLData.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# LoadDataSetXMLData.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/LoadDataSetXMLData/LoadDataSetXMLData.src"
RunSample="/quickstart/howto/samples/Xml/LoadDataSetXMLData/VB/LoadDataSetXMLData.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB LoadDataSetXMLData.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/LoadDataSetXMLData/LoadDataSetXMLData.src"
RunSample="/quickstart/howto/samples/Xml/LoadDataSetXMLData/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ LoadDataSetXMLData.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
As shown in the following code, this sample implements the ParseSchema function to load the XML Schema Definition 
language (XSD) schema, <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/LoadDataSetXMLData/cs/&file=books.xsd">books.xsd</a>, 
into the DataSet property on the XmlDataDocument. Then, the sample uses the Load method of the XmlDataDocument to 
load the XML file, <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/LoadDataSetXMLData/cs/&file=books.xml">books.xml</a>.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private const String document = "books.xml";
private const String myLoadSchema = "books.xsd";
private XmlDataDocument myXmlDataDocument;

public static void Main()
{
    String[] args = {document, myLoadSchema};
    LoadDataSetXMLDataSample myLoadDataSetXMLDataSample = new LoadDataSetXMLDataSample();
    myLoadDataSetXMLDataSample.Run(args);
}

public void Run(String[] args)
{
    try
    {
        Console.WriteLine("Creating an XmlDataDocument ...");
        myXmlDataDocument = new XmlDataDocument();
        ParseSchema(args[1]);
        DisplayTableStructure();

        myXmlDataDocument.Load(args[0]);

        DisplayTables(myXmlDataDocument.DataSet);
    }
    catch (Exception e)
    {
        Console.WriteLine ("Exception: {0}", e.ToString());
    }
}

// Loads a specified schema into the DataSet
public void ParseSchema(String schema)
{
    StreamReader myStreamReader = null;

    try
    {
        Console.WriteLine("Reading Schema file ...");
        myStreamReader = new StreamReader(schema);
        myXmlDataDocument.DataSet.ReadXmlSchema(myStreamReader);
    }
    catch (Exception e)
    {
        Console.WriteLine ("Exception: {0}", e.ToString());
    }
    finally
    {
        if (myStreamReader != null)
            myStreamReader.Close();
    }
}
</Tab>
<Tab Name="VB">
private const document as string = "books.xml"
private const myLoadSchema as string = "books.xsd"
private myXmlDataDocument as XmlDataDocument

shared sub Main()
    Dim args As String() = {document, myLoadSchema}
    Dim myLoadDataSetXMLDataSample as LoadDataSetXMLDataSample
    myLoadDataSetXMLDataSample = new LoadDataSetXMLDataSample()
    myLoadDataSetXMLDataSample.Run(args)
end sub

public sub Run(args As String())
    try
        Console.WriteLine("Creating an XmlDataDocument ...")
        myXmlDataDocument = new XmlDataDocument()
        ParseSchema(args(1))
        DisplayTableStructure()

        myXmlDataDocument.Load(args(0))

        DisplayTables(myXmlDataDocument.DataSet)

    catch e as exception
        Console.WriteLine ("Exception: " & e.ToString())
    end try
end sub

' Loads a specified schema into the DataSet
public sub ParseSchema(schema as string)
    Dim myStreamReader as StreamReader = nothing
    try
        myStreamReader = new StreamReader(schema)
        Console.WriteLine("Reading Schema file ...")
        myXmlDataDocument.DataSet.ReadXmlSchema(myStreamReader)
    catch e as exception
        Console.WriteLine ("Exception: " & e.ToString())
    finally
        If Not myStreamReader Is nothing
            myStreamReader.Close()
        end if
    end try
end sub
</Tab>
<Tab Name="C++">
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
</Tab>
</Acme:TabControl>

<p>
As in <a href="http://localhost/quickstart/howto/doc/Xml/DataSetMapXSDSchema.aspx">How Do I...Create DataSet Mappings from an XSD schema?</a>, the DisplayTableStructure method (built with the <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/LoadDataSetXMLData/cs/&file=books.xsd">books.xsd</a> schema file) enables the sample to display the internal table structure by simply iterating over the collections of Tables, Columns, and Rows, and then formatting the output. This sample extends this concept with the DisplayTables method (shown in the following code) which enables the sample to display the contents of the XML file. This sample uses the For Each keyword instead of a For loop to illustrate an alternative mechanism for iterating over the collections.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Displays the contents of the DataSet tables
private void DisplayTables(DataSet dataset)
{
    // Navigate Dataset
    Console.WriteLine("Content of Tables ...\r\n");

    foreach(DataTable table in dataset.Tables)
    {
        Console.WriteLine("TableName = " + table.TableName);
        Console.WriteLine ("{0}", "---------");
        Console.WriteLine("Columns ...\r\n");

        foreach(DataColumn column in table.Columns)
        {
            Console.Write("{0,-22}",column.ColumnName);
        }
        Console.WriteLine();
        Console.WriteLine("\r\nNumber of rows = {0}", table.Rows.Count.ToString());
        Console.WriteLine("Rows ...\r\n");

        foreach(DataRow row in table.Rows)
        {
            foreach(Object value in row.ItemArray)
            {
                Console.Write("{0,-22}",value.ToString());
            }
            Console.WriteLine();
        }
        Console.WriteLine();
    }
}
</Tab>
<Tab Name="VB">
' Displays the contents of the DataSet tables
private sub DisplayTables(myDataset as DataSet)

    ' Navigate Dataset
    Console.WriteLine()
    Console.WriteLine("Content of Tables ...")

    Dim table as DataTable
    for each table in myDataset.Tables

        Console.WriteLine("TableName = " & table.TableName.ToString())
        Console.WriteLine ("---------")
        Console.WriteLine("Columns ...")

        Dim column as DataColumn
        for each column in table.Columns

            Console.Write("{0,-22}",column.ColumnName.ToString())
        next
        Console.WriteLine()
        Console.WriteLine("Number of rows = {0}", table.Rows.Count.ToString())
        Console.WriteLine("Rows ...")

        Dim row as DataRow
        for each row in table.Rows

        Dim value as object
            for each value in row.ItemArray
                Console.Write("{0,-22}",value.ToString())
            Next
            Console.WriteLine()
        Next
        Console.WriteLine()
    Next
end sub
</Tab>
<Tab Name="C++">
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
</Tab>
</Acme:TabControl>

<p>
The following output shows the table names, column names, and row contents of books.xml as displayed by the DisplayTables method.

<p>
<div class="code"><pre>
Creating an XmlDataDocument ...
Reading Schema file ...

Table structure

Tables count=3
	TableName='bookstore'.
	Columns count=1
		ColumnName='bookstore_Id', type = System.Int32
	TableName='book'.
	Columns count=5
		ColumnName='title', type = System.String
		ColumnName='price', type = System.Decimal
		ColumnName='genre', type = System.String
		ColumnName='book_Id', type = System.Int32
		ColumnName='bookstore_Id', type = System.Int32
	TableName='author'.
	Columns count=3
		ColumnName='first-name', type = System.String
		ColumnName='last-name', type = System.String
		ColumnName='book_Id', type = System.Int32
Content of Tables ...

TableName = bookstore
---------
Columns ...

bookstore_Id

Number of rows = 1
Rows ...

0

TableName = book
---------
Columns ...

title                 price                 genre                 book_Id               bookstore_Id

Number of rows = 3
Rows ...

The Autobiography of Benjamin Franklin8.99                  autobiography         0                     0
The Confidence Man    11.99                 novel                 1                     0
The Gorgias           9.99                  philosophy            2                     0

TableName = author
---------
Columns ...

first-name            last-name             book_Id

Number of rows = 3
Rows ...

Benjamin              Franklin              0
Herman                Melville              1
Sidas                 Plato                 2
</pre></div>

<H4>Summary</H4>
<OL>
<LI>XML data that has been loaded into an XmlDataDocument can be accessed via the relational methods on the DataSet property.
<LI>XML data can also be read when relational data has been entered through the DataSet property of XmlDataDocument.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->