<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Use XML and the DataSet?</h4>

These topics provide an introduction to the interaction between the DataSet and XMLDataDocument objects.
<p>

<span class="subhead">XML and Relational Data. Same Data, Two Views.</span>
<p>
XML often has a relational structure (the fictional books in a bookstore for example), as well as being unstructured. This set of topics cover the concept of storing this data centrally and providing different views on this data, either as XML or relationally as tables, columns and rows with relationships. This disconnected store of data which, for example, could represent a business object in the middle tier that enforces business rules, could provide its data as XML to a browser via Extensible Stylesheet Language Transformations (XSLT), across the Internet to another Web site, or to a local application via the relational tables. However, the data gets amended, you can update that data to a database on a transaction basis.
<p>
A DataSet represents an in-memory cache of data as a collection of tables and relationships between those tables. It is, in effect, a locally cached database. This provides a disconnected cache of data, like a message, that enables dealing with chunks of data. The DataSet has no knowledge of where the data came from. It may have come from a file, a database connection, or from a stream. A DataSet provides a relational view onto this stored data.
<p>
The XmlDataDocument provides XML APIs for accessing this in-memory cache of data, as well as supporting reading and writing XML. The XmlDataDocument is a DataSet-aware object. Creation of an XmlDataDocument implicitly creates a DataSet (accessed as a property) that provides a relational view onto the data XML data. This symbiotic relationship between these two objects provides a powerful technique for accessing data either relationally or as XML, irrespective of the mechanism by which the data was sourced.

<p>
<span class="subhead">XmlDataDocument and DataSet Differences</span>

<p>
There are differences between these two objects and their views. XML loaded via the Load method on the XmlDataDocument maintains full fidelity-that is, all the XML structure is maintained and can be accessed via the XML API. The ReadXml method on the DataSet, however, only loads the XML that conforms to the internally created mappings (schema). You lose white space and element ordering, as well as data that does not conform to the relational mapping. Hence, the DataSet does not retain XML fidelity. Also data which has been loaded through an XmlDataDocument and which does not conform to the internal mappings on the DataSet cannot be viewed using the relational API. Whereas, relational data can always be viewed via the XML API.
<p>
Both the DataSet and XmlDataDocument can save data. However, they do not save the data identically. Using the WriteXml method, the DataSet is able to save a normalized view of the relationally mapped data (that is, the XML data that conforms to the internal schema, with elements ordered according to the relational schema). This contrasts to the Save method of the XmlDataDocument that saves the XML data with full fidelity -all the XML that has been loaded into the XmlDataDocument, including the preservation of white space and element ordering.
<p>

<span class="subhead">Topics</span>

<p>
The following topics work with XML data, DataSets and the XmlDataDocument:
<p>

<OL>
<LI><A target=content href="DataSetMapXSDSchema.aspx">How do I...Create DataSet mappings from an XSD schema?</A> covers how a DataSet can build a relational view according to a supplied XML Schema Definition language (XSD) schema
<LI><A target=content href="LoadDataSetXMLData.aspx">How do I...Load a DataSet with XML?</A> covers how XML data gets loaded into the DataSet and accessed as relational data.
<LI><A target=content href="DataSetMapXMLData.aspx">How do I...Infer DataSet mappings from XML?</A> covers how to infer a relational mapping from XML data, rather than an XSD schema.
<LI><A target=content href="SaveDataSetMapXSDSchema.aspx">How do I...Save DataSet mappings to an XSD schema file?</A> shows how to save an inferred schema generated from loaded XML data.
<LI><A target=content href="SaveDataSetXML.aspx">How do I...Save a DataSet as XML?</A> covers how to access and save XML that has been loaded into the DataSet relationally.
</OL>

<span class="subhead">Related Topics</span>
<p>
The following topics cover many of the features of the XmlDataDocument object that utilize the XML API. Refer to these topics for information about those scenarios in which you want to access data as XML.
<p>

<OL>
<LI class="indent"><A target=content href="LoadXmlDocument.aspx">How do I...Load and use the XmlDataDocument?</A>
<br clear="left"><br>
<LI><A target=content href="StreamXmlDocument.aspx">How do I...Read XML from an XmlDataDocument?</A>
<br clear="left"><br>
</OL>

<p>
For coverage of the interaction between the DataSet and databases using the .NET data providers, see <A target=content href="/quickstart/howto/doc/adoplus/adoplusoverview.aspx">How do I...Get an Overview of ADO.NET?</A>
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->









