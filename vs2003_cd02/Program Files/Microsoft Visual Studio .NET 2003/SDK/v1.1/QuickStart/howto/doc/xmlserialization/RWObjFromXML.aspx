<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/xmlserializationheader.inc" -->

<h4>How do I read/write objects into xml?</h4>

This topic describes how to automatically map a particular XML stream into a set of objects designed to hold the XML using the XML Serialization classes.<p>

<ol>
<li>First, you will need classes designed to work with the XML Serialization classes.  If you have an XSD schema that describes the format of the XML file you want to load or save, you are almost there.  <a href="XsdToCls.aspx">Use the XSD.exe tool</a> to create these classes automatically. You can also build the classes manually. You can find more information on how to do this in the <a href="XsdFromCls.aspx">"How do I Create an XSD schema from a class?"</a> topic. <p>
This example will be using the <b>PurchaseOrder</b> classes that were generated to read XML in the format defined by the purchase order schema.  Both the classes and the schema are shown below.<p>

<table border=0>
<tr><td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrder.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C# PurchaseOrder.cs"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrder.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="VB PurchaseOrder.vb"
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrder.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C++ PurchaseOrder.cs"
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

</td>
<td>
        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrderXsd.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="PurchaseOrder.XSD"
        runat="server" />
</td></tr>
</table>
<p>

<li>Create an instance of the <b>XmlSerializer</b>, passing the type of the object you would like to deserialize.  Here we will use the <b>PurchaseOrder</b> type that was defined earlier.<p>
<div class="code"><xmp>
XmlSerializer serializer = new XmlSerializer(typeof(PurchaseOrder));
</xmp></div>
<li>To read the file, call the Deserialize method passing in a Stream, TextReader, or XmlReader.  A purchase order will be returned.
<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
TextReader reader = new StreamReader("po.xml");
PurchaseOrder po = (PurchaseOrder)serializer.Deserialize(reader);
reader.Close();
</Tab>
<Tab Name="VB">
Dim reader As TextReader = New StreamReader("po.xml")
Dim po As PurchaseOrder = CType(serializer.Deserialize(reader), PurchaseOrder)
reader.Close()
</Tab>
<Tab Name="C++">
TextReader * reader = new StreamReader(S"..\\PurchaseOrder.xml");
PurchaseOrder * po = __try_cast<PurchaseOrder*>(serializer->Deserialize(reader));
reader->Close();
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>


<li>To write the file, call the Serialize method passing in a <b>Stream</b>, <b>TextReader</b>, or <b>XmlReader</b> as well as an instance of the purchase order.


<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
TextWriter writer = new StreamWriter("po2.xml");
serializer.Serialize(writer, po);
writer.Close();
</Tab>
<Tab Name="VB">
Dim writer As TextWriter = New StreamWriter("po2.xml")
serializer.Serialize(writer, po)
writer.Close()
</Tab>
<Tab Name="C++">
TextWriter * writer = new StreamWriter(S"PurchaseOrder2.xml");
serializer->Serialize(writer, po);
writer->Close();
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>


</ol>

The following example puts these ideas together by reading the purchase order XML file shown below, and then writing it back out to another file.<p>

<table border=0>
<tr><td>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/XMLSerialization/CS"
        ViewSource="/quickstart/howto/samples/Xmlserialization/ReadWriteXml.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C# ReadWriteXML"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/XMLSerialization/VB"
        ViewSource="/quickstart/howto/samples/Xmlserialization/ReadWriteXml.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="VB ReadWriteXML"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/XMLSerialization/CP"
        ViewSource="/quickstart/howto/samples/Xmlserialization/ReadWriteXml.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C++ ReadWriteXML"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

</td><td>
        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrderXml.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="PurchaseOrder.xml"
        runat="server" />

</td></tr>
</table>



<!-- #include virtual="/quickstart/howto/include/footer.inc" -->