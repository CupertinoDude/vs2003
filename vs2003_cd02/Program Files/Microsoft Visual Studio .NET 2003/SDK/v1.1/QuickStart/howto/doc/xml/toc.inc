<%@ Register TagPrefix="Acme" TagName="UrlMaker" Src="/quickstart/howto/util/UrlMaker.ascx"%>
<table>
<tr>
<td nowrap style="padding-right:15">

<div class="toc" style="color:darkred;">
<!--
		<div style="padding:0,0,4,0"><a class="outer" style="color:darkred" href="/quickstart/howto/doc/Xml/OverviewofXML.aspx"><b>Introduction</a></b></a><br></div>
         <p>
		<div style="padding:0,0,4,0"><b>XML Readers and Writers</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/ReadXMLFile.aspx">Read XML from a file</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/ReadXMLStream.aspx">Read XML from a stream</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlReadFromUrl.aspx">Read XML from a URL</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/WriteXMLFile.aspx">Write XML to a file</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/ValidationReadingXML.aspx">Apply validation to XML</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/MultipleXmlReader.aspx">Use multiple XmlReaders</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML Document Object Model</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/DOMInterfaceXmlDocument.aspx">Load XML with XmlDocument</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SaveXmlDocument.aspx">Save XML with XmlDocument</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlDocumentEvent.aspx">Handle Events from XmlDocument</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlNodeReader.aspx">Use an XmlNodeReader</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XmlDataDocument</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/LoadXmlDocument.aspx">Load the XmlDataDocument</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/StreamXmlDocument.aspx">Read XML from XmlDataDocument</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XPath and XSL Transformations</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/QueryXmlDocumentXPath.aspx">Query XML with an XPath Expression</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/TransformXml.aspx">Apply XSL transformations</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XPathExpression.aspx">XPathExpression Query</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/NavigateXmlDocument.aspx">Navigate with XPathNavigator</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML and Relational Data</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XMLDataSet.aspx">Use XML and the DataSet</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/DataSetMapXSDSchema.aspx">Create DataSet mappings</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/LoadDataSetXMLData.aspx">Load a DataSet with XML</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/DataSetMapXMLData.aspx">Infer DataSet mappings</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SaveDataSetMapXSDSchema.aspx">Save DataSet mappings</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SaveDataSetXML.aspx">Save a DataSet as XML</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML Schema</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlReadWriteSchema.aspx">Read and Write a Schema</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlSchemaObjectModel.aspx">Use the Schema Object Model</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SchemaCollection.aspx">Use XML Schema Collection</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML Namespace</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlNameSpace.aspx">XmlNameSpace Manager & NameTable</a><br>
		<p>
-->

		<div style="padding:0,0,4,0"><b>XML Data</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/OverviewofXML.aspx">Overview of XML</a><p>

		<div style="padding:0,0,4,0"><b>XML Readers and Writers</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/ReadXMLFile.aspx">Read XML from a file</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/ReadXMLStream.aspx">Read XML from a stream</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlReadFromUrl.aspx">Read XML from a URL</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/WriteXMLFile.aspx">Write XML to a file</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/ValidationReadingXML.aspx">Apply validation when reading XML</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/MultipleXmlReader.aspx">Use multiple XmlReaders</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML Document Object Model</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/DOMInterfaceXmlDocument.aspx">Load and use the XmlDocument (w3c DOM)</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SaveXmlDocument.aspx">Save XML with the XmlDocument (w3c DOM)</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlDocumentEvent.aspx">Handle Events from XmlDocument</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlNodeReader.aspx">Use an XmlNodeReader</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XmlDataDocument</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/LoadXmlDocument.aspx">Load and use the XmlDataDocument</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/StreamXmlDocument.aspx">Read XML from XmlDataDocument</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XPath and XSL Transformations</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/NavigateXmlDocument.aspx">Navigate with XPathNavigator</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/QueryXmlDocumentXPath.aspx">Query XML with an XPath Expression</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/TransformXml.aspx">Apply an XSL transformation to XML</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XPathExpression.aspx">Use an XPathExpression class</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML and Relational Data</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XMLDataSet.aspx">Use XML and the DataSet class</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/DataSetMapXSDSchema.aspx">Create DataSet mappings from an XSD schema</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/LoadDataSetXMLData.aspx">Load a DataSet with XML</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/DataSetMapXMLData.aspx">Infer DataSet mappings from XML</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SaveDataSetMapXSDSchema.aspx">Save DataSet mappings to an XSD schema file</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SaveDataSetXML.aspx">Save a DataSet as XML</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML Schema</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlReadWriteSchema.aspx">Read and Write a Schema</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlSchemaObjectModel.aspx">Use the Xml Schema Object Model</a><br>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/SchemaCollection.aspx">Use XML Schema Collection</a><br>
		<p>
		<div style="padding:0,0,4,0"><b>XML Namespace</b><br></div>
		&nbsp; <a class="outer" href="/quickstart/howto/doc/Xml/XmlNameSpace.aspx">XmlNameSpace Manager and NameTable</a><br>
		<p>

    <div style="padding:0,0,4,0"><a target="_top" style="color:darkred" href="/quickstart/howto"><b>Back to Index</b></a><br></div>

    <p>

    <Acme:UrlMaker runat="server" />
<p>


</div>

</td>
</tr>
</table>