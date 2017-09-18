<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>XML in the .NET Framework</h4>
Extensible Markup Language (XML) is a meta-markup language that provides a format for describing structured data. XML enables a new generation of Web-based data viewing and manipulation applications. XML is the universal language for data on the Web. XML gives developers the power to deliver structured data from a wide variety of applications to the desktop for local computation and presentation.

<h4>System.Xml Namespace</h4>
This set of topics cover the usage of the XML classes in the System.Xml namespace.
<p>
This namespace has a comprehensive set of XML classes for parsing, validation, and manipulation of XML data using readers, writers, and World Wide Web Consortium (W3C) DOM-compliant components. It also covers XML Path Language (XPath) queries and Extensible Stylesheet Language Transformations (XSLT). The following list contains the main classes in the XML namespace:

<ul>
<LI>The <b>XmlTextReader</b> class provides fast, non-cached, forward only read access to XML data.
<LI>The <b>XmlNodeReader</b> class provides an XmlReader over the given DOM node subtree.
<LI>The <b>XmlValidatingReader</b> class provides DTD, XDR and XSD Schema validation.
<LI>The <b>XmlTextWriter</b> class provides a fast, forward only way of generating XML.
<LI>The <b>XmlDocument</b> class implements the <A href="http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html">W3C Document Object Model level 1 Core</A> and the
<A href="http://www.w3.org/TR/DOM-Level-2/core.html">Core DOM Level 2</A>
<LI>The <b> XmlDataDocument</b> class provides an implementation of an
  XmlDocument that can be associated with a DataSet. Structured XML can be
  viewed and manipulated simultaneously through the DataSet's relational
  representation or the XmlDataDocument's tree representation. See the topic <A target=content href="XMLDataSet.aspx">How Do I...Use XML and the DataSet class?</A>
<LI>The <b>XPathDocument</b> class provides a fast and performant cache for XML document processing for XSLT.
<LI>The <b>XPathNavigator</b> class provides a W3C XPath 1.0 data model over a store with a cursor style model for navigation.
<LI>The <b>XslTransform</b> class is a W3C XSLT 1.0 specification compliant XSLT processor for transforming XML documents. </LI>
<LI>The <b> XmlSchema </b> Object Model classes provide a navigable set of classes which directly reflect the W3C XSD specification. They provide the ability to programmatically create an XSD schema.
<LI>The <b> XmlSchemaCollection</b> class provides a library of XDR and XSD schemas. These schemas, cached in memory provide fast, parse-time validation for the XmlValidatingReader.
</LI>
</ul>

<h4>World Wide Web Consortium (W3C) Conformance</h4>
The classes in this namespace conform to the <A href="http://www.w3.org">World Wide Web Consortium (W3C)</A> specifications and so provide a comprehensive set of XML tools for building Web applications and any scenario which relies upon XML data exchange.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

