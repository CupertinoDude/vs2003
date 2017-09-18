<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Save a DataSet as XML?</h4>

<p>
This sample illustrates how to use XmlDataDocument to save relational data from a DataSet to an XML file. This demonstrates the transition from relational data to XML data.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SaveDataSetXMLData/CS/SaveDataSetXMLData.aspx"
ViewSource="/quickstart/howto/samples/Xml/SaveDataSetXMLData/SaveDataSetXMLData.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# SaveDataSetXMLData.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/SaveDataSetXMLData/SaveDataSetXMLData.src"
RunSample="/quickstart/howto/samples/Xml/SaveDataSetXMLData/VB/SaveDataSetXMLData.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB SaveDataSetXMLData.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/SaveDataSetXMLData/SaveDataSetXMLData.src"
RunSample="/quickstart/howto/samples/Xml/SaveDataSetXMLData/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ SaveDataSetXMLData.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
Having built the relational tables for the DataSet in <a href="http://localhost/quickstart/howto/doc/Xml/SaveDataSetMapXSDSchema.aspx">How Do I...Save DataSet Mappings to an XSD schema file?</a>, this sample now saves these tables as XML data. This is the process of generating hierarchical XML based upon and validated against the internally generated XML Schema Definition language (XSD) schema.
<p>
As shown in the following code, the sample first creates an XmlDataDocument for the DataSet.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Load the DataSet with relation data
DataSet dataset = new DataSet();
LoadDataSet(dataset);
// Create an XmlDataDocument for the DataSet
XmlDataDocument datadoc = new XmlDataDocument(dataset);
</Tab>
<Tab Name="VB">
' Load the DataSet with relation data
Dim dataset As New DataSet
LoadDataSet(dataset)
' Create an XmlDataDocument for the DataSet
Dim datadoc As XmlDataDocument = New XmlDataDocument(dataset)
</Tab>
<Tab Name="C++">
// Load the DataSet with relation data
DataSet* myDataSet = new DataSet();
LoadDataSet(myDataSet);
// Create an XmlDataDocument for the DataSet
XmlDataDocument* datadoc = new XmlDataDocument(myDataSet);
</Tab>
</Acme:TabControl>

<p>
This example creates a DataSet using the LoadDataSet function. To ensure the correct loading of the DataSet, the sample displays the DataSet to the screen. The sample then uses the WriteXmlSchema method of the DataSet to write out the schema created by the DataSet. To output the contents of the DataSet as XML, the sample calls the WriteXml method of the DataSet using a file name. Then, the sample reads in the XML that it just wrote and display the data on the screen.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
    // Load the DataSet with relation data
    DataSet myDataSet = new DataSet();
    LoadDataSet(myDataSet);

    DisplayTables(myDataSet);

    String xmlFile = Environment.GetEnvironmentVariable("TEMP") + 
        "\\PersonPetCS.xml";
    String schemaFile = Environment.GetEnvironmentVariable("TEMP") +
        "\\PersonPetCS.xsd";

    // Write out schema representation
    myDataSet.WriteXmlSchema(m_SchemaFile);

    // Write out XML data form relational data
    myDataSet.WriteXml(m_XmlFile, XmlWriteMode.IgnoreSchema);

    // Create an XmlDataDocument for the DataSet
    XmlDataDocument datadoc = new XmlDataDocument(myDataSet);

    // Display the XML
    DisplayXMLData(datadoc);
</Tab>
<Tab Name="VB">
    'Load the DataSet with relation data
    Dim myDataSet as DataSet = new DataSet()
    LoadDataSet(myDataSet)

    DisplayTables(myDataSet)

    Dim xmlFile As String = _
        Environment.GetEnvironmentVariable("TEMP") & "\\PersonPetVB.xml"
    Dim schemaFile As String = _
        Environment.GetEnvironmentVariable("TEMP") & "\\PersonPetVB.xsd"

    'Write out schema representation
    myDataSet.WriteXmlSchema(schemaFile)

    'Write out XML data form relational data
    myDataSet.WriteXml(xmlFile, XmlWriteMode.IgnoreSchema)

    'Create an XmlDataDocument for the DataSet
    Dim datadoc as XmlDataDocument = new System.Xml.XmlDataDocument(myDataSet)

    'Display the XML
    DisplayXMLData(datadoc)
</Tab>
<Tab Name="C++">
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
</Tab>
</Acme:TabControl>

<p>
The sample writes the XML data to the file <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/SaveDataSetXMLData/cs/&file=PersonPet.xml">PersonPet.xml</a>. The XML data in XmlDataDocument can now be read with an XmlReader and displayed, showing the XML for the relational data. For more information about reading XML documents, see <A target=content href="StreamXmlDocument.aspx">How do I...Read XML from an XmlDataDocument?</A>.

<p>
<H4>Summary</H4>
<OL>
<LI>You can construct the XmlDataDocument from a DataSet. This provides an XML API onto the relational data.
<LI>You can access data entered through the relational methods of the DataSet by using the XML methods of the XmlDataDocument.
<LI>You can save XML data by either using the WriteXml method of the DataSet or the Save method of the XmlDataDocument. The former saves a normalized view of the relationally mapped data, while the latter saves the XML with full fidelity. If the data has only been entered through the DataSet, then these methods are equivalent.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->












