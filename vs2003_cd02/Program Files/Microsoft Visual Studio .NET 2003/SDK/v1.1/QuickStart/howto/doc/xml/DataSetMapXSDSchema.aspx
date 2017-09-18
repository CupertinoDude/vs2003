<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Create DataSet mappings from an XSD schema?</h4>

<p>
This sample illustrates how to create DataSet mappings from a supplied XML Schema Definition language (XSD) schema. Generally, schemas are metadata, or data about data, but XSD schemas also cover the relationships between data types. From a schema, you can create a relational structure of tables and columns to store data that fits the supplied schema. This is the DataSet relational mapping of the schema.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/DataSetMapXSDSchema/CS/DataSetMapXSDSchema.aspx"
ViewSource="/quickstart/howto/samples/Xml/DataSetMapXSDSchema/DataSetMapXSDSchema.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# DataSetMapXSDSchema.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/DataSetMapXSDSchema/DataSetMapXSDSchema.src"
RunSample="/quickstart/howto/samples/Xml/DataSetMapXSDSchema/VB/DataSetMapXSDSchema.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB DataSetMapXSDSchema.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/DataSetMapXSDSchema/DataSetMapXSDSchema.src"
RunSample="/quickstart/howto/samples/Xml/DataSetMapXSDSchema/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ DataSetMapXSDSchema.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The DataSet class has a close affiliation with the XmlDataDocument class. The DataSet class provides a relational view of the XML data loaded through the XmlDataDocument. To build a relational mapping between these two views, you need to use the ReadXmlSchema method of the DataSet. You use this method when you create the XmlDataDocument as in the following call, XmlDataDocument.DataSet.ReadXmlSchema. Now, any changes made to the DataSet are reflected in the XmlDataDocument and vice versa.
<p>
To illustrate this relationship, the following sample code reads and loads the <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/DataSetMapXSDSchema/cs/&file=books.xsd">books.xsd</a> schema file into the DataSet property on an XmlDataDocument. Notice how the ReadXmlSchema method takes the schema loaded into a StreamReader and generates the relational mappings. If there is already a relational view defined in the XmlDataDocument, the sample throws an exception.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
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
</Tab>
<Tab Name="VB">
Dim myStreamReader as StreamReader = nothing
try
    myStreamReader = new StreamReader(schema)
    Console.WriteLine("Reading Schema file ...")
    myXmlDataDocument.ReadXmlSchema(myStreamReader)
catch e as exception
    Console.WriteLine ("Exception: " & e.ToString())
finally
    If Not myStreamReader Is Nothing
        myStreamReader.Close()
    end if
end try
</Tab>
<Tab Name="C++">
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
</Tab>
</Acme:TabControl>

<p>
So how do you know what the internal tables generated from the schema look like? Well, the DataSet has a Tables property that is a collection of the internal tables. Each table has a Columns collection and each column has a ColumnName and a DataType. You can simply iterate over these collections and format the output to display the internal table structure built from the supplied schema, as shown in the following code.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Displays the DataSet tables structure
private void DisplayTableStructure()
{
    Console.WriteLine("\r\nTable structure \r\n");
    Console.WriteLine("Tables count=" + myXmlDataDocument.DataSet.Tables.Count.ToString());
    for (int i = 0; i < myXmlDataDocument.DataSet.Tables.Count; i++)
    {
        Console.WriteLine("\tTableName='" + myXmlDataDocument.DataSet.Tables[i].TableName + "'.");
        Console.WriteLine("\tColumns count=" + myXmlDataDocument.DataSet.Tables[i].Columns.Count.ToString());

        for (int j = 0; j < myXmlDataDocument.DataSet.Tables[i].Columns.Count; j++)
        {
            Console.WriteLine("\t\tColumnName='" +
                              myXmlDataDocument.DataSet.Tables[i].Columns[j].ColumnName + "', type = "
                              + myXmlDataDocument.DataSet.Tables[i].Columns[j].DataType.ToString());
        }
    }
}
</Tab>
<Tab Name="VB">
' Displays the DataSet tables structure
private sub DisplayTableStructure()
    Console.WriteLine()
    Console.WriteLine("Table structure")
    Console.WriteLine()
    Console.WriteLine("Tables count=" & myXmlDataDocument.Tables.Count.ToString())

    Dim i,j as integer

    for i = 0 to (myXmlDataDocument.Tables.Count - 1)
        Console.WriteLine("TableName='" & myXmlDataDocument.Tables(i).TableName & "'.")
        Console.WriteLine("Columns count=" & myXmlDataDocument.Tables(i).Columns.Count.ToString())

        for j = 0 to (myXmlDataDocument.Tables(i).Columns.Count - 1)
            Console.WriteLine(Strings.chr(9) & "ColumnName='" & _
                              myXmlDataDocument.Tables(i).Columns(j).ColumnName & _"', type = " & _
                              myXmlDataDocument.Tables(i).Columns(j).DataType.ToString())
        next
        Console.WriteLine()
    next
end sub
</Tab>
<Tab Name="C++">
// Displays the DataSet tables structure
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
</Tab>
</Acme:TabControl>

<p>
The following output shows the table names, column names, and the column types displayed by the DisplayTableStructure method for the books.xsd schema.
<p>

<div class="code"><pre>
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
</pre></div>

<H4>Summary</H4>
<OL>
<LI>Generally, schemas are metadata, or data about data, but XSD schemas also cover the relationships between types of data.
<LI>From an XSD schema, you can create a relational structure of tables and columns to store data that fits the supplied schema. This is the DataSet mapping.
<LI>The ReadXmlSchema method of the DataSet generates the internal mappings from the supplied schema.
</OL>

  <!-- #include virtual="/quickstart/howto/include/footer.inc" -->
