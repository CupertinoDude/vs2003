<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...use XmlNamespaceManager and NameTable?</h4>

<p>
This sample shows how to select namespace specific XML data from an XmlDocument. It demonstrates the use of the XmlNamespaceManager class. This class encapsulates a collection of namespaces and provides a variety of namespace management tasks, such as resolving, adding, and removing namespaces to a collection, and providing scope management for the namespaces.
<p>
The XmlNameTable provides management of the string names in the XML stream. It does this by creating a table of atomized string objects. This table provides an efficient means for the XML parser to use the same String object for all repeated element and attribute names in an XML document.
<p>
This sample uses XML Path Language (XPath) expressions to query the namespaces. For more information about XPath expressions, see <a href="QueryXmlDocumentXPath.aspx">How Do I...Query XML with an XPath expression?</a>

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/XmlNameSpace/CS/XmlNameSpace.aspx"
ViewSource="/quickstart/howto/samples/Xml/XmlNameSpace/XmlNameSpace.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# XmlNameSpace.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlNameSpace/XmlNameSpace.src"
RunSample="/quickstart/howto/samples/Xml/XmlNameSpace/VB/XmlNameSpace.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB XmlNameSpace.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlNameSpace/XmlNameSpace.src"
RunSample="/quickstart/howto/samples/Xml/XmlNameSpace/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ XmlNameSpace.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
First, the sample creates an XmlDocument and loads the orders.xml file into the XmlDocument.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Create a new XmlDocument for the specified source file and load it.
XmlDocument myXmlDocument = new XmlDocument();
myXmlDocument.Load("orders.xml");
</Tab>
<Tab Name="VB">
'Create a new XmlDocument for the specified source file and load it.
Dim myXmlDocument as XmlDocument  = new XmlDocument()
myXmlDocument.Load("orders.xml")
</Tab>
<Tab Name="C++">
// Create a new XmlDocument for the specified source file and load it.
XmlDocument* myXmlDocument = new XmlDocument();
myXmlDocument->Load("orders.xml");
</Tab>
</Acme:TabControl>

<p>
To get all the item elements for the yourns1 namespace, the samples uses the following XPath expression: //yourns1:item. The sample also creates an XmlNamespaceManager that contains the prefixes and namespaces in the XML document.

<p>
The orders.xml document defines two prefixes: myns for http://tempuri.org/myUSorderprocessornamespace and yourns1 for http://tempuri.org/USvendor1namespace. The document also has the default namespace of http://tempuri.org/myUSordersnamespace which we will map to the "defaultns" namespace. The reason for needing a prefix for the default namespace in our XPath query is due to the fact in XPath, there is no concept of a default namespace, instead elements are either in a namespace or not and if they are in a namespace then a prefix is needed for matching. Thus unprefixed names in queries can *only* be used for elements that are in no namespace at all. 

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//Create a string containing the XPATH expression to evaluate.
sExpr = String.Format("//{0}:item", "yourns1");

//Create an XmlNamespaceManager and add the namespaces for the document.
XmlNamespaceManager nsmanager = new XmlNamespaceManager(doc.NameTable);

//Map namespaces to prefixes for querying purposes.
nsmanager.AddNamespace("defaultns", "http://tempuri.org/myUSordersnamespace");
nsmanager.AddNamespace("myns", "http://tempuri.org/myUSorderprocessornamespace");
nsmanager.AddNamespace("yourns1", "http://tempuri.org/USvendor1namespace");
nsmanager.AddNamespace("yourns2", "http://tempuri.org/USvendor2namespace");
</Tab>
<Tab Name="VB">
'Create a string containing the XPATH expression to evaluate.
sExpr = String.Format("//{0}:item", "yourns1")

'Create an XmlNamespaceManager and add the namespaces for the document.
Dim nsmanager as XmlNamespaceManager  = new XmlNamespaceManager(doc.NameTable)

'Map namespaces to prefixes for querying purposes.
nsmanager.AddNamespace("defaultns", "http:'tempuri.org/myUSordersnamespace")
nsmanager.AddNamespace("myns", "http:'tempuri.org/myUSorderprocessornamespace")
nsmanager.AddNamespace("yourns1", "http:'tempuri.org/USvendor1namespace")
nsmanager.AddNamespace("yourns2", "http:'tempuri.org/USvendor2namespace")
</Tab>
<Tab Name="C++">
//Create an XmlNamespaceManager and add the namespaces for the document.
XmlNamespaceManager* nsmanager = new XmlNamespaceManager(myXmlDocument->NameTable);

//Map namespaces to prefixes for querying purposes.
nsmanager->AddNamespace(S"defaultns", S"http://tempuri.org/myUSordersnamespace");
nsmanager->AddNamespace(S"myns", S"http://tempuri.org/myUSorderprocessornamespace");
nsmanager->AddNamespace(S"yourns1", S"http://tempuri.org/USvendor1namespace");
nsmanager->AddNamespace(S"yourns2", S"http://tempuri.org/USvendor2namespace");
</Tab>
</Acme:TabControl>
<p>
This sample then calls the SelectNodes method on the XmlDocument. In this case, the SelectNodes method finds all item nodes with a yourns1 prefix that resolves to the namespace, http://tempuri.org/USvendor1namespace.
<p>
The SelectNodes method returns an XmlNodeList. The sample then display this node list.

<p>
<Acme:TabControl runat="server" >
<Tab Name="C#">
XmlNodeList nodelist = myXmlDocument.SelectNodes(exprString, nsmanager);

foreach (XmlNode myXmlNode in nodelist)
{
    DisplayTree(myXmlNode);
}
</Tab>
<Tab Name="VB">
Dim nodelist as XmlNodeList = myXmlDocument.SelectNodes(exprString, nsmanager)

Dim myXmlNode as XmlNode
for each myXmlNode in nodelist
    DisplayTree(myXmlNode)
next
</Tab>
<Tab Name="C++">
XmlNodeList* nodelist = myXmlDocument->SelectNodes(exprString, nsmanager);

for (int i = 0; i < nodelist->Count; i++)
{
    DisplayTree(nodelist->Item(i));
}
</Tab>
</Acme:TabControl>
<p>

<H4>Summary</H4>
<OL>
<LI>The XmlNamespaceManager class resolves, adds, and removes namespaces to a collection.
<LI>An application can use an XmlNameTable to improve XML parser performance.
</OL>

<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->