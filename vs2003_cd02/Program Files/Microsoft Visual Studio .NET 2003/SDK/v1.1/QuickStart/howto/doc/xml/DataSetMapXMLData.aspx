<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Infer DataSet mappings from XML?</h4>

<p>
This sample illustrates how to create DataSet mappings from XML Data. This sample uses the concept of inference, whereby the actual structure of the XML data itself is the basis for a relational schema. The sample then creates a relational structure of tables and columns to store data in a DataSet that conforms to the inferred schema.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/DataSetMapXMLData/CS/DataSetMapXMLData.aspx"
ViewSource="/quickstart/howto/samples/Xml/DataSetMapXMLData/DataSetMapXMLData.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# DataSetMapXMLData.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/DataSetMapXMLData/DataSetMapXMLData.src"
RunSample="/quickstart/howto/samples/Xml/DataSetMapXMLData/VB/DataSetMapXMLData.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB DataSetMapXMLData.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/DataSetMapXMLData/CP"
ViewSource="/quickstart/howto/samples/Xml/DataSetMapXMLData/DataSetMapXMLData.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ DataSetMapXMLData.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>


<p>
In order to infer a schema from the XML data structure, the following sample code demonstrates how you should call DataSet.ReadXml using InferSchema for the XmlReadMode. If you do not specify an XmlReadMode, the ReadXml method infers a schema if both the dataset does not already have a schema and the document does not contain an inline schema.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Infer the DataSet schema from the XML data and load the XML Data
datadoc.DataSet.ReadXml(new StreamReader("books.xml"), XmlReadMode.InferSchema);
</Tab>
<Tab Name="VB">
' Infer the DataSet schema from the XML data and load the XML Data
datadoc.DataSet.ReadXml(new StreamReader("books.xml"), XmlReadMode.InferSchema)
</Tab>
<Tab Name="C++">
// Infer the DataSet schema from the XML data and load the XML Data
datadoc->DataSet->ReadXml(new StreamReader(args), XmlReadMode::InferSchema);
</Tab>
</Acme:TabControl>

<p>
As in <a href="/quickstart/howto/doc/Xml/LoadDataSetXMLData.aspx">How Do I...Load a DataSet with XML?</a>, this sample also uses the DisplayTables method to display the structure and contents of the DataSet. The following output shows the table names, column names, and row contents generated when the DisplayTables method uses the schema inferred from the <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/DataSetMapXMLData/cs/&file=books.xml">books.xml</a> file.

<div class="code"><pre>
Creating an XmlDataDocument ...
Content of Tables ...

TableName = book
---------
Columns ...

title                 book_Id               price                 genre                 publicationdate       ISBN

Number of rows = 3
Rows ...

The Autobiography of Benjamin Franklin 0                     8.99                  autobiography         1981                  1-861003-11-0
The Confidence Man    1                     11.99                 novel                 1967                  0-201-63361-2
The Gorgias           2                     9.99                  philosophy            1991                  1-861001-57-6

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
<LI>Inference is the mechanism whereby the structure of the XML data is the basis for a relational schema.
<LI>The ReadXml method of the DataSet builds relational mapping using the supplied XML file in a StreamReader.
</LI></OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->