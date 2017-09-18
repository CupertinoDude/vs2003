<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Read and Write a Schema?</h4>

<p>
This sample illustrates how to read an XML Schema Definition language (XSD) file into the Schema Object Model (SOM). Then, the sample writes the XSD schema which has been loaded into memory to a StringWriter for display to the screen. The schema could also be written to a file using an XmlWriter.

<p>
This SOM provides a set of classes which directly reflect the World Wide Web Consortium (W3C) XSD specification. The classes, methods, and properties of XmlSchema provide the ability to create an in-memory version of the schema that can be complied and used in validation through XmlSchemaCollection.

<p>
XmlSchema can load and save valid XSD schemas. It also has strongly typed classes which can be used to create in-memory schemas. For validation purposes, XmlSchema can be used by the XmlSchemaCollection and XmlValidatingReader classes.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/XmlReadWriteSchema/CS/XmlReadWriteSchema.aspx"
ViewSource="/quickstart/howto/samples/Xml/XmlReadWriteSchema/XmlReadWriteSchema.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# XmlReadWriteSchema.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlReadWriteSchema/XmlReadWriteSchema.src"
RunSample="/quickstart/howto/samples/Xml/XmlReadWriteSchema/VB/XmlReadWriteSchema.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB XmlReadWriteSchema.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlReadWriteSchema/XmlReadWriteSchema.src"
RunSample="/quickstart/howto/samples/Xml/XmlReadWriteSchema/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ XmlReadWriteSchema.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
Typically, you use the XmlSchema if you need to load and/or create a valid schema. This sample simply loads a simple schema from a file.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private const String document = "sample.xsd";
...
XmlSchema mySchema = XmlSchema.Read(new XmlTextReader(document));
</Tab>
<Tab Name="VB">
private const document as String = "sample.xsd"
...
Dim mySchema as XmlSchema  = XmlSchema.Read(new XmlTextReader(document))
</Tab>
<Tab Name="C++">
static String* document = S"sample.xsd";
...
XmlSchema* mySchema = XmlSchema::Read(new XmlTextReader(document));
</Tab>
</Acme:TabControl>
<p>

Once loaded, the sample writes the schema to a StringWriter and displays the StringWriter on the screen.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
mySchema.Write(myXmlWriter);
Console.WriteLine(myStringWriter.ToString());
</Tab>
<Tab Name="VB">
mySchema.Write(myXmlWriter)
Console.WriteLine(myStringWriter.ToString())
</Tab>
<Tab Name="C++">
mySchema->Write(myXmlWriter);
Console::WriteLine(myStringWriter->ToString());
</Tab>
</Acme:TabControl>
<p>

<p>

<H4>Summary</H4>
<OL>
<LI>The Schema Object Model (SOM) provides a navigatable set of classes which directly reflect the W3C XSD specification.
<LI>A SOM is built for each of the imported and included schemas and these are held in the includes collection
<LI>The items collection is a list of all the schema element types at the schema level from the loaded schema. This is used for persistence.
<LI>Hashtables from Elements, Attributes, and so on, are built which reference all the schema element types at the schema level for all referenced schemas (that is, those in the includes collection), as well as this one. This provides an easy lookup mechanism on the element name.
</OL>
<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->



































































































