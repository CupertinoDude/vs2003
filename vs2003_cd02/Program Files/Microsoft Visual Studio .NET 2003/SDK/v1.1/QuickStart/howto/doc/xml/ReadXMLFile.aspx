<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Read XML from a file?</h4>

<p>
This sample illustrates how to read XML from a file using the XmlTextReader class. This class provides direct parsing and tokenizing of XML, and implements the <A href="http://www.w3.org/TR/1998/REC-xml-19980210">W3C Extensible Markup Language (XML) 1.0</A> and the <A href="http://www.w3.org/TR/REC-xml-names/">Namespaces in XML</A> specifications.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/ReadXmlFile/CS/ReadXmlFile.aspx"
ViewSource="/quickstart/howto/samples/Xml/ReadXmlFile/ReadXmlFile.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ReadXmlFile.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/ReadXmlFile/ReadXmlFile.src"
RunSample="/quickstart/howto/samples/Xml/ReadXmlFile/VB/ReadXmlFile.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ReadXmlFile.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/ReadXmlFile/ReadXmlFile.src"
RunSample="/quickstart/howto/samples/Xml/ReadXmlFile/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ ReadXmlFile.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
XmlReader class is the API that provides XML parsing, the XmlTextReader is the implementation designed to handle byte streams.
<p>
Typically, you use the XmlTextReader if you need to access the XML as raw data without the overhead of a DOM. Not having to access the DOM results in a faster way to reading XML. For example, an XML document could have a header section used for routing the document for processing elsewhere. The XmlTextReader has different constructors to specify the location of the XML data. This sample loads XML from the <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/ReadXmlFile/cs/&file=books.xml">books.xml</a> file, as shown in the following code.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XmlTextReader reader = new XmlTextReader ("books.xml");
</Tab>
<Tab Name="VB">
Dim reader As XmlTextReader = New XmlTextReader ("books.xml")
</Tab>
<Tab Name="C++">
reader = new XmlTextReader ("books.xml");
</Tab>
</Acme:TabControl>

<p>
Once loaded, the XmlTextReader moves across the XML data by using the Read method sequentially retrieving the next record from the document. The Read method returns false if there are no more records.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
while (reader.Read())
{
    // Do some work here on the data
    ...
}
</Tab>
<Tab Name="VB">
Do While (reader.Read())
    ' Do some work here on the data
    ...
Loop
</Tab>
<Tab Name="C++">
while (reader->Read())
{
    // Do some work here on the data
    ...
}
</Tab>
</Acme:TabControl>

<p>
To process the XML data, each record has a node type that can be determined from the NodeType property. After the NodeType enumeration returns the node type, the sample tests the node type to see whether it is either an element or document type. If the node is either one of these two types, the sample processes the node using the Name and Value properties to display details about the node. The Name property returns the node name (for instance, the element and attribute names, while the Value property returns the node value (node text) of the current node (record).

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
while (reader.Read())
{
    switch (reader.NodeType)
    {
        case XmlNodeType.Element: // The node is an Element
            Console.Write("<" + reader.Name);
            while (reader.MoveToNextAttribute()) // Read attributes
                Console.Write(" " + reader.Name + "='" + reader.Value + "'");
            Console.Write(">");
            break;
        case XmlNodeType.DocumentType: // The node is a DocumentType
            Console.WriteLine(NodeType + "<" + reader.Name + ">" + reader.Value);
            break;
        ...
    }
}
</Tab>
<Tab Name="VB">
Do While (reader.Read())
    Select Case reader.NodeType
        Case XmlNodeType.Element ' The node is an Element
            Console.Write("<" + reader.Name)
            while (reader.MoveToNextAttribute()) ' Read attributes
                Console.Write(" " + reader.Name + "='" + reader.Value + "'")
            end while
            Console.Write(">")

        Case XmlNodeType.DocumentType ' The node is a DocumentType
            Console.WriteLine(NodeType & "<" & reader.Name & ">" & reader.Value);
        ...
    End Select
Loop
</Tab>
<Tab Name="C++">
while (reader->Read())
{
    switch (reader->NodeType)
    {
     case XmlNodeType::XmlDeclaration:
        Format (reader, S"XmlDeclaration");
        declarationCount++;
        break;
     case XmlNodeType::ProcessingInstruction:
        Format (reader, S"ProcessingInstruction");
        piCount++;
        break;
        ...
    }
}
</Tab>
</Acme:TabControl>

<p>
The XmlNodeType returned depends on the XmlReader class being used. For example, the XmlTextReader class never returns an XmlNodeType that is a Document, DocumentFragment, Entity, EndEntity and Notation node. See the .NET Framework Class Library for details on what XmlNodeType are returned by each XmlReader class.
<p>
The node types specified for the XmlNodeType are equivalent to the W3C DOM node types, with some extended types required for forward-only reading.

<DIV class=indent>
<TABLE class=table2
width="418">
<TBODY>
<TR>
<TH width="100">XmlNodeType Enumeration Member</TH>
<TH width="308">Description</TH>
</TR>
  <tr>
    <td width="100" height="19"><font size="1">Attribute</font></td>
    <td width="308" height="19"><font size="1">An Attribute. <br>Example XML: id='123'. <br>An Attribute node can have the following child node types: Text and EntityReference. The Attribute node does not appear as the child node of any other node type; note that it is not considered a child node of an Element.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">CDATA</font></td>
    <td width="308" height="19"><font size="1">A CDATA section. <br>Example XML: &lt![CDATA[my escaped text]]&gt <br>CDATA sections are used to escape blocks of text that would otherwise be recognized as markup. A CDATASection node cannot have any child nodes. The CDATASection node can appear as the child of the DocumentFragment, EntityReference, and Element nodes.</font></td>
  </tr>

  <tr>
    <td height="17"><font size="1">Comment</font></td>
    <td height="17"><font size="1">A Comment. <br>Example XML: &lt!-- my comment --&gt <br>A Comment node cannot have any child nodes. The Comment node can appear as the child of the Document, DocumentFragment, Element, and EntityReference nodes.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">Document</font></td>
    <td width="308" height="19"><font size="1">A document object, which, as the root of the document tree, provides access to the entire XML document.  <br>A Document node can have the following child node types: Element (maximum of one), ProcessingInstruction, Comment, and DocumentType. The Document node cannot appear as the child of any node types.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">DocumentFragment</font></td>
    <td width="308" height="19"><font size="1">A document fragment. <br>The DocumentFragment node associates a node or subtree with a document without actually being contained within the document. A DocumentFragment node can have the following child node types: Element, ProcessingInstruction, Comment, Text, CDATASection, and EntityReference. The DocumentFragment node cannot appear as the child of any node types.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">DocumentType</font></td>
    <td width="308" height="19"><font size="1">The document type declaration, indicated by the &lt!DOCTYPE&gt tag. <br>Example XML: &lt!DOCTYPE ...&gt <br>A DocumentType node can have the following child node types: Notation and Entity. The DocumentType node can appear as the child of the Document node.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">Element</font></td>
    <td width="308" height="19"><font size="1">An Element. <br>Example XML: &ltName&gt <br>An Element node can have the following child node types: Element, Text, Comment, ProcessingInstruction, CDATA, and EntityReference. The Element node can be the child of the Document, DocumentFragment, EntityReference, and Element nodes.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">EndElement</font></td>
    <td width="308" height="19"><font size="1">Returned when XmlReader gets to the end of an element. <br>Example XML: &lt/foo&gt</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">EndEntity</font></td>
    <td width="1000" height="19"><font size="1">Returned when XmlReader gets to the end of the entity replacement as a result of a call to ResolveEntity.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">Entity</font></td>
    <td width="1000" height="19"><font size="1">An entity declaration. <br>Example XML: &lt!ENTITY ...&gt <br>An Entity node can have child nodes that represent the expanded entity (for example, Text and EntityReference nodes). The Entity node can appear as the child of the DocumentType node.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">EntityReference</font></td>
    <td width="308" height="19"><font size="1">A reference to an entity. <br>Example XML: &foo; <br>This applies to all entities, including character entity references. An EntityReference node can have the following child node types: Element, ProcessingInstruction, Comment, Text, CDATASection, and EntityReference. The EntityReference node can appear as the child of the Attribute, DocumentFragment, Element, and EntityReference nodes.</font></td>
  </tr>

  <tr>
    <td height="17"><font size="1">None</font></td>
    <td height="17"><font size="1">This is returned by the XmlReader if a Read method has not been called.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">Notation</font></td>
    <td width="308" height="19"><font size="1">A notation in the document type declaration. <br>Example XML: &lt!NOTATION ...&gt <br>A Notation node cannot have any child nodes. The Notation node can appear as the child of the DocumentType node.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">ProcessingInstruction</font></td>
    <td width="1000" height="19"><font size="1">A processing instruction (PI). <br>Example XML: &lt?pi test?&gt <br>A PI node cannot have any child nodes. The PI node can appear as the child of the Document, DocumentFragment, Element, and EntityReference nodes.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">SignificantWhitespace</font></td>
    <td width="1000" height="19"><font size="1">Whitespace between markup in a mixed content model, or whitespace within the xml:space= "preserve" scope.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">Text</font></td>
    <td width="308" height="19"><font size="1">The text content of an element. A Text node cannot have any child nodes. The Text node can appear as the child node of the Attribute, DocumentFragment, Element, and EntityReference nodes.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">Whitespace</font></td>
    <td width="308" height="19"><font size="1">Whitespace between markup.</font></td>
  </tr>

  <tr>
    <td width="100" height="19"><font size="1">XmlDeclaration</font></td>
    <td width="1000" height="19"><font size="1">The XML declaration node. <br>Example XML: &lt?xml version='1.0'?&gt; <br>This has to be the first node in the document. It can have no children. It is a child of the root node. It can have attributes that provide version and encoding information.
</font></td>
  </tr>

  </TBODY></TABLE>

</DIV>

<p>
The Depth property returns the depth of the current node in the XML document and is useful when formatting data. A node at the root level of the document is at depth 0. Combining this depth information with the Name and Value properties, you can create a sample that processes an XML file and formats the output depending on the node type and the depth, gathering statistics as it reads. The following sample code shows how this basic formatting is possible using the Format method. To see the full sample code, see <a href="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/Xml/ReadXmlFile/ReadXmlFile.src">View Source</a>.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private static void Format(XmlReader reader, String nodeType)
{
    // Format the output
    Console.Write(reader.Depth + " ");
    Console.Write(reader.AttributeCount + " ");
    for (int i=0; i < reader.Depth; i++)
    {
        Console.Write('\t');
    }

    Console.Write(reader.Prefix + nodeType + "<" + reader.Name + ">" + reader.Value);

    // Display the attributes values for the current node
    if (reader.HasAttributes)
    {
        Console.Write(" Attributes:");

        for (int j=0; j < reader.AttributeCount; j++)
        {
            Console.Write(" [{0}] " + reader[j], j);
        }
    }
    Console.WriteLine();
}
</Tab>
<Tab Name="VB">
private shared Sub Format(byref reader as XmlTextReader , nodeType as String)

    ' Format the output
    Console.Write(reader.Depth & " ")
    Console.Write(reader.AttributeCount & " ")

    Dim i as Integer
    for i = 0 to reader.Depth
        Console.Write(Strings.chr(9))
    Next

    Console.Write(nodeType & "<" & reader.Name & ">" & reader.Value)

    'Display the attributes values for the current node
    if (reader.HasAttributes)
        Console.Write(" Attributes:")
        Dim j as Integer
        for j = 0 to reader.AttributeCount - 1
            Console.Write(" [{0}] " & reader(j), j)
        next
    End if

    Console.WriteLine()
End Sub
</Tab>
<Tab Name="C++">
void Format(XmlReader* reader, String* NodeType)
{
// Format the output
Console::Write(String::Concat(__box(reader->Depth), S" "));
Console::Write(String::Concat(__box(reader->AttributeCount), S" "));
for (int i=0; i < reader->Depth; i++)
{
    Console::Write(S"\t");
}

Console::Write(String::Concat(NodeType, S"<", reader->Name, S">", reader->Value));
// Display the attributes values for the current node
if (reader->HasAttributes)
{
    Console::Write(" Attributes:");

    for (int j=0; j < reader->AttributeCount; j++)
    {
        Console::Write(String::Concat(S" [" , __box(j) , S"] " , reader->Item[j]));
    }
}

Console::WriteLine();
}
</Tab>
</Acme:TabControl>

<p>
The preceding sample code uses the HasAttributes property to test whether an element node has any attribute nodes, and then uses the node index operators to retrieve each attribute value. This is analogous to a collection of attributes for the node. In addition, the preceding code sample uses the AttributeCount property to return the number of attributes for the current node. Use this approach if all you want are the attribute values and are not concerned with other properties of the attribute nodes (for example, the name of the attribute).
<p>
Note: For an alternative approach to accessing attributes by moving to each attribute node, and reading the both the node's name and value, see <A target=content href="ReadXmlStream.aspx">How Do I...Read XML from a stream?</a>.
<p>
The following output results from running this sample with the <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/ReadXmlFile/cs/&file=books.xml">books.xml</a> file. In this output, the first column is the Depth property and the second column is the AttributeCount property.

<div class="code"><pre>
0 0 XmlDeclaration&lt;xml&gt;version='1.0'
0 0 Comment&lt;&gt; This file represents a fragment of a book store inventory database
0 0 Element&lt;bookstore&gt;
1 3     Element&lt;book&gt; Attributes: [0] autobiography [1] 1981 [2] 1-861003-11-0
2 0             Element&lt;title&gt;
3 0                     Text&lt;&gt;The Autobiography of Benjamin Franklin
2 0             Element&lt;author&gt;
3 0                     Element&lt;first-name&gt;
4 0                             Text&lt;&gt;Benjamin
3 0                     Element&lt;last-name&gt;
4 0                             Text&lt;&gt;Franklin
2 0             Element&lt;price&gt;
3 0                     Text&lt;&gt;8.99
1 3     Element&lt;book&gt; Attributes: [0] novel [1] 1967 [2] 0-201-63361-2
2 0             Element&lt;title&gt;
3 0                     Text&lt;&gt;The Confidence Man
2 0             Element&lt;author&gt;
3 0                     Element&lt;first-name&gt;
4 0                             Text&lt;&gt;Herman
3 0                     Element&lt;last-name&gt;
4 0                             Text&lt;&gt;Melville
2 0             Element&lt;price&gt;
3 0                     Text&lt;&gt;11.99
1 3     Element&lt;book&gt; Attributes: [0] philosophy [1] 1991 [2] 1-861001-57-6
2 0             Element&lt;title&gt;
3 0                     Text&lt;&gt;The Gorgias
2 0             Element&lt;author&gt;
3 0                     Element&lt;name&gt;
4 0                             Text&lt;&gt;Plato
2 0             Element&lt;price&gt;
3 0                     Text&lt;&gt;9.99

Statistics for books.xml file

XmlDeclaration: 1
ProcessingInstruction: 0
DocumentType: 0
Comment: 1
Element: 18
Attribute: 9
Text: 11
Whitespace: 27
</pre></div>
<p>

<H4>Summary</H4>
<OL>
<LI>The XmlTextReader provides fast, non-cached, forward-only read access to XML data.
<LI>The XmlTextReader implements the <A href="http://www.w3.org/TR/1998/REC-xml-19980210">W3C Extensible Markup Language (XML) 1.0</A> and the <A href="http://www.w3.org/TR/REC-xml-names/">Namespaces in XML</A> specifications.
<LI>The XmlTextReader provides constructors to read XML from a file, a stream, or a TextReader.
<LI>The Read method moves the reader sequentially as a node.
<LI>For element nodes, the value of an attribute can be obtained by using the index operators.
<LI>Attributes are represented as a node list off the current node and can be discovered through the HasAttributes property.
<LI>The Depth property reports the depth of the current node and can be useful for formatting. Nodes at the root level are at depth 0.
</OL>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->