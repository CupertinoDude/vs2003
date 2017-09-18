<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Use XML Schema Collection?</h4>

<p>
This sample illustrates how to use the XmlSchemaCollection class used by the XmlValidatingReader for efficient data validation. The XmlSchemaCollection class allows you to maintain a cache of multiple XML Schema Definition language (XSD) and XML-Data Reduced (XDR) schemas which can then be used when a schema is required. However, while this class stores both XSD and XDR schemas, only XSD schemas apply to any method or property which takes or returns an XmlSchema.
<p>
Schemas in the XmlSchemaCollection can be used to validate XML data. When reading XML data, you can use an XmlValidatingReader to apply this validation. For information on how to use the features of the XmlValidatingReader, refer to <a href="/quickstart/howto/doc/Xml/ValidationReadingXML.aspx">How Do I...Apply validation when reading XML?</a>.
<p>
Validation is the process of enforcing rules on the XML content either via a Document Type Definition (DTD) or a schema. At its simplest, a schema is an XML representation of a DTD, but it can also infer relationships within the XML data and type information. The XmlValidatingReader class layers validation support onto the XmlTextReader.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SchemaCollection/CS/SchemaCollection.aspx"
ViewSource="/quickstart/howto/samples/Xml/SchemaCollection/SchemaCollection.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# SchemaCollection.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SchemaCollection/VB/SchemaCollection.aspx"
ViewSource="/quickstart/howto/samples/Xml/SchemaCollection/SchemaCollection.src"
Icon = "/quickstart/images/genicon.gif"
Caption="VB SchemaCollection.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SchemaCollection/CP"
ViewSource="/quickstart/howto/samples/Xml/SchemaCollection/SchemaCollection.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ SchemaCollection.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
This sample shows how an XmlValidatingReader can use an XmlSchemaCollection for efficient data validation. To the schema collection, the sample adds the XSD schema, <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/SchemaCollection/cs/&file=xmlsc.xsd">xmlsc.xsd</a>, that is to be used for validation. Then, the sample creates an XmlValidatingReader and adds the schema from the schema collection to the reader. Finally, the sample uses the reader to read through the data and formats the output for display.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
...
XmlValidatingReader reader = null;
XmlSchemaCollection xsc = new XmlSchemaCollection();

try
{
    xsc.Add(args[1], new XmlTextReader(args[1]));
    reader = new XmlValidatingReader(new XmlTextReader(args[0]));
    reader.Schemas.Add(xsc);
    reader.ValidationType = ValidationType.Schema;

    while (reader.Read())
    {
      ...
    }
}
</Tab>
<Tab Name="VB">
...
Dim reader as XmlValidatingReader
Dim xsc as XmlSchemaCollection = new XmlSchemaCollection()

try
    xsc.Add(args(1), new XmlTextReader(args(1)))
    reader = new XmlValidatingReader(new XmlTextReader(args(0)))
    reader.Schemas.Add(xsc)
    reader.ValidationType = ValidationType.Schema

    while (reader.Read())
      ...
    end while
    ...
end try
</Tab>
<Tab Name="C++">
...
XmlValidatingReader* reader = 0;
XmlSchemaCollection* xsc = new XmlSchemaCollection();

try 
{
    xsc->Add(xsdDocument , new XmlTextReader(args[1]));
    reader = new XmlValidatingReader(new XmlTextReader(args[0]));
    reader->ValidationEventHandler += new ValidationEventHandler (this,&SchemaCollectionSample::ValidationEventHandle);
    reader->Schemas->Add(xsc);
    reader->ValidationType = ValidationType::Schema;

    while (reader->Read())
    {
      ...
    }
}
</Tab>
</Acme:TabControl>


<H4>Summary</H4>
<OL>
<LI>You can use the XMLSchemaCollection as a cache of preloaded schemas.
<LI>These preloaded schemas get loaded once, then reused. This results in much better parsing performance.
<LI>The XmlSchemaCollection supports both XDR and XSD schemas.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

