<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/xmlserializationheader.inc" -->

<h4>How do I create classes from an XSD schema?</h4>

This topic describes how to create classes that can be used to read and write XML that is defined by an XML Schema Description (XSD) file. Once you understand how to generate the classes for your XSD schema, you should read the <a href="RWObjFromXML.aspx">"How Do I Read and Write Objects From XML?"</a> topic to find out how to actually load XML into them, and save XML from them.

<ol>
<li> Locate an XSD file.  In this example, we will use a purchase order schema, as follows: <p>

        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrderXsd.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="PurchaseOrder.XSD"
        MapRunSamplePath=true
        runat="server" />

<p>
<li> Use the xsd.exe tool in the SDK to generate source code for the classes you want. Do this by specifying the name of the XSD file as an argument to the executable. The example below creates classes in C# using the purchaseorder.xsd schema and puts them in the <b>XmlSerializationHowTo</b> namespace:

<div class="code"><pre>
xsd.exe -c -l:c# -n:XmlSerializationHowTo purchaseorder.xsd
</pre></div>

<li> The tool uses the XSD file to create a set of classes that can read XML files that use the schema that you specified. Here is the code that gets created for the above schema:<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrder.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C# PurchaseOrder.cs"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        ViewSource="/quickstart/howto/samples/Xmlserialization/PurchaseOrder.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="VB PurchaseOrder.vb"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>


</ol>

In the code, you will notice additional "Custom Metadata Attributes" above the field declarations. These are used to guide the Xml Serializer classes in properly reading and writing the XML.  They are basically hints to the parser.  For example, the <b>Items</b> field has a custom attribute applied to it to tell the serializer to that the <b>Items</b> field should contain an array of item objects which get created when the XML is loaded.<p>



<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
[System.Xml.Serialization.XmlArrayItemAttribute("item", IsNullable=false)]
public ItemsItem[] items;
</Tab>
<Tab Name="VB">
&lt;System.Xml.Serialization.XmlArrayItemAttribute("item", IsNullable:=false)&gt;  _
Public items() As ItemsItem
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>


<p>
For detailed information on these attributes, see the reference documentation in the SDK.  They are located in the System.Xml.Serialization namespace. <p>
Now that you understand how to generate the classes for your XSD schema, you should read the <a href="RWObjFromXML.aspx">"How Do I Read and Write Objects From XML?"</a> topic to find out how to actually load XML into them, and save XML from them.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
