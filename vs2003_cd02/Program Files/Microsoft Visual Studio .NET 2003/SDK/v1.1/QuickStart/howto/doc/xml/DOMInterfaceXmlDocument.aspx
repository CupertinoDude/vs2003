<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Load and use the XmlDocument (W3C DOM)?</h4>

<p>
This sample illustrates the classes which implement:
<ul>
<li>the <A href="http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html">Document Object Model (Core) Level 1</A> the World Wide Web Consortium (W3C) Document Object Model (DOM) Level 1 Specification.
<li>the <A href="http://www.w3.org/TR/DOM-Level-2/core.html">Document Object Model Core</A> in the W3C Document Object Model (DOM) Level 2 Specification.
</ul>
<p>
The DOM is an in-memory (cache) tree representation of an XML document and enables the navigation and editing of the document.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/DOMInterfaceXmlDocument/CS/DOMInterfaceXmlDocument.aspx"
ViewSource="/quickstart/howto/samples/Xml/DOMInterfaceXmlDocument/DOMInterfaceXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# DOMInterfaceXmlDocument.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/DOMInterfaceXmlDocument/DOMInterfaceXmlDocument.src"
RunSample="/quickstart/howto/samples/Xml/DOMInterfaceXmlDocument/VB/DOMInterfaceXmlDocument.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB DOMInterfaceXmlDocument.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/DOMInterfaceXmlDocument/DOMInterfaceXmlDocument.src"
RunSample="/quickstart/howto/samples/Xml/DOMInterfaceXmlDocument/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ DOMInterfaceXmlDocument.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
There are a number of classes implemented as part of the W3C DOM. Of these, the XmlNode class provides methods and properties to manipulate a node. Many of the other W3C classes are specializations of the XmlNode class. The XmlDocument class represents the XML document and has a Load method that loads the document from a file, stream, or an XmlReader. The list of classes is given in the table below.

<p>
<DIV class=indent>
<TABLE class=table2
width="350">
<TBODY>
<TR>
<TH>Class</TH>
<TH>Derived from</TH>
</TR>
  <tr>
    <td width="179" height="19"><font size="1">XmlNode</font></td>
    <td width="308" height="19"><font size="1">implements ICloneable, IEnumerable</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlDocument</font></td>
    <td width="308" height="19"><font size="1">XmlNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlElement</font></td>
    <td width="308" height="19"><font size="1">XmlLinkedNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlAttribute</font></td>
    <td width="308" height="19"><font size="1">XmlNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlCharacterData</font></td>
    <td width="308" height="19"><font size="1">XmlLinkedNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlText</font></td>
    <td width="308" height="19"><font size="1">XmlCharacterData</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlComment</font></td>
    <td width="308" height="19"><font size="1">XmlCharacterData</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlCDataSection</font></td>
    <td width="308" height="19"><font size="1">XmlCharacterData</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlWhitespace</font></td>
    <td width="308" height="19"><font size="1">XmlCharacterData</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlSignificantWhitespace</font></td>
    <td width="308" height="19"><font size="1">XmlCharacterData</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlProcessingInstruction</font></td>
    <td width="308" height="19"><font size="1">XmlLinkedNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlNodeList</font></td>
    <td width="308" height="19"><font size="1">implements IEnumerable</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlNamedNodeMap</font></td>
    <td width="308" height="19"><font size="1">implements IEnumerable</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlAttributeCollection</font></td>
    <td width="308" height="19"><font size="1">XmlNamedNodeMap</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlDocumentFragment</font></td>
    <td width="308" height="19"><font size="1">XmlNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlDocumentType</font></td>
    <td width="308" height="19"><font size="1">XmlLinkedNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlEntityReference</font></td>
    <td width="308" height="19"><font size="1">XmlLinkedNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlEntity</font></td>
    <td width="308" height="19"><font size="1">XmlNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlNotation</font></td>
    <td width="308" height="19"><font size="1">XmlNode</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlImplementation</font></td>
    <td width="308" height="19"><font size="1">Object</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlNodeChangedEventArgs</font></td>
    <td width="308" height="19"><font size="1">EventArgs</font></td>
  </tr>
  </TBODY></TABLE></DIV>

<p>
The following code illustrates how to load an XmlDocument from an XmlTextReader, and then display the document's contents. The XmlDocument can also be loaded directly from a URL and then using an XmlTextReader to read the XML document.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XmlTextReader reader = null;

try
{
    // Load the XML from file
    Console.WriteLine ("Reading file {0} ...", args);
    reader = new XmlTextReader (args);
    reader.WhitespaceHandling = WhitespaceHandling.None;
    Console.WriteLine ("File {0} read sucessfully ...", args);

    // Create an XmlDocument from the XmlTextReader
    XmlDocument myXmlDocument = new XmlDocument();
    myXmlDocument.Load (reader);
    Console.WriteLine ("XmlDocument loaded with XML data successfully ...");

    // Process the supplied XML file
    Console.WriteLine ("Processing ...");
    Console.WriteLine ();

    // Start from the document Element
    DisplayTree(myXmlDocument.DocumentElement);
}
catch (Exception e)
{
    Console.WriteLine ("Exception: {0}", e.ToString());
}
finally
{
    if (reader != null)
        reader.Close();
}
</Tab>
<Tab Name="VB">
Dim reader as XmlTextReader = nothing

try
    ' Load the XML from file
    Console.WriteLine ("Reading file {0} ...", args)
    reader = new XmlTextReader (args)
    reader.WhitespaceHandling = WhitespaceHandling.None
    Console.WriteLine ("File {0} read sucessfully ...", args)

    ' Create an XmlDocument from the XmlTextReader
    Dim myXmlDocument as XmlDocument = new XmlDocument()
    myXmlDocument.Load (reader)
    Console.WriteLine ("XmlDocument loaded with XML data successfully ...")

    ' Process the supplied XML file
    Console.WriteLine ("Processing ...")
    Console.WriteLine ()

    ' Start from the document Element
    DisplayTree(myXmlDocument.DocumentElement)
catch e as Exception
    Console.WriteLine ("Exception:" & e.ToString())
finally
    If Not reader Is Nothing
        reader.Close()
    end if
end try
</Tab>
<Tab Name="C++">
XmlTextReader* reader = 0;

try
{
    // Load the XML from file
    Console::WriteLine (S"Reading file {0} ...", args);
    reader = new XmlTextReader (args);
    reader->WhitespaceHandling = WhitespaceHandling::None;
    Console::WriteLine (S"File {0} read sucessfully ...", args);

    // Create an XmlDocument from the XmlTextReader
    XmlDocument* myXmlDocument = new XmlDocument();
    myXmlDocument->Load (reader);
    Console::WriteLine (S"XmlDocument loaded with XML data successfully ...");

    // Process the supplied XML file
    Console::WriteLine (S"Processing ...");
    Console::WriteLine ();

    // Start from the document Element
    DisplayTree(myXmlDocument->DocumentElement);
}
catch (Exception* e)
{
    Console::WriteLine (S"Exception: {0}", e->ToString());
}

__finally
{
    if (reader != 0)
        reader->Close();
}
</Tab>
</Acme:TabControl>

<p>
To navigate the document, the DisplayTree method recursively iterates over the XmlDocument using the HasChildNodes and FirstChild properties of XmlNode to move down the tree. The NextSibling property moves to the node immediately next to the current node, returning a null value if there is no node to which to move.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public void DisplayTree(XmlNode node)
{
    if (node != null)
        Format (node);

    if (node.HasChildNodes)
    {
        node = node.FirstChild;
        while (node != null)
        {
            DisplayTree(node);
            node = node.NextSibling;
        }
    }
}
</Tab>
<Tab Name="VB">
public sub DisplayTree( node as XmlNode)
    if not isnothing(node) then Format (node)

    if node.HasChildNodes then
        node = node.FirstChild
        while not isnothing(node)
            DisplayTree(node)
            node = node.NextSibling
        end While
    end if
end sub
</Tab>
<Tab Name="C++">
void DisplayTree(XmlNode* node)
{
if (node != 0)
    Format (node);

if (node->HasChildNodes)
{
    node = node->FirstChild;
    while (node != 0)
    {
        DisplayTree(node);
        node = node->NextSibling;
    }
}
}
</Tab>
</Acme:TabControl>

<p>
The Name property gives the name of the node, and the Value property its value depending on the type. The following table shows the value returned for a given node type. The Format method, shown in the following code, displays the details of the current node using the Name and Value properties.

<p>
<DIV class=indent>
<TABLE class=table2
width="350">
<TBODY>
<TR>
<TH>Type</TH>
<TH>Value</TH>
</TR>
  <tr>
    <td width="179" height="19"><font size="1">Attribute</font></td>
    <td width="308" height="19"><font size="1">Value of attribute</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">CDATA</font></td>
    <td width="308" height="19"><font size="1">Content of the CDATA Section</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">Comment</font></td>
    <td width="308" height="19"><font size="1">Content of the comment</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">Document</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">DocumentFragment</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">DocumentType</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">Element</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">Entity</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">EntityReference</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">Notation</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">ProcessingInstruction</font></td>
    <td width="308" height="19">  <font size="1">Entire content excluding the target</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">Text</font></td>
    <td width="308" height="19"><font size="1">Content of the text node</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XmlDeclaration</font></td>
    <td width="308" height="19"><font size="1">A null reference (Nothing in Visual Basic)</font></td>
  </tr>
  </TBODY></TABLE></DIV>

<p>
Note: The XmlNode class also has a NodeType property. For a table that describes the different node types, see <a href="http://localhost/quickstart/howto/doc/Xml/ReadXMLFile.aspx">How Do I...Read XML from a File?</a>.
<p>
For XmlElement node types, the Attributes property provides a list of attributes as an XmlNamedNodeMap class. The XmlNameNodeMap class also implements IEnumerable in order to support the foreach statement in C# and the For Each…Next statement in Visual Basic.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Format the output
private void Format (XmlNode node)
{
    if (!node.HasChildNodes)
    {
        Console.WriteLine("\t" + node.Name + "<" + node.Value + ">");
    }

    else
    {
        Console.Write(node.Name);
        if (XmlNodeType.Element == node.NodeType)
        {
            XmlNamedNodeMap map = node.Attributes;
            foreach (XmlNode attrnode in map)
                Console.Write(" " + attrnode.Name + "<" + attrnode.Value + "> ");
        }
        Console.WriteLine();
    }
}
</Tab>
<Tab Name="VB">
' Format the output
private sub Format ( node as XmlNode)
    if not node.HasChildNodes then
        Console.WriteLine( Strings.chr(9) & node.Name & "<" & node.Value & ">")

    else
        Console.Write(node.Name)
        if XmlNodeType.Element = node.NodeType then
            Dim map as XmlNamedNodeMap = node.Attributes
            Dim attrnode As Object
                for each attrnode in map
                    Console.Write(" " & Ctype(attrnode,XmlNode).Name & "<" & Ctype(attrnode,XmlNode).Value & "> " )
                next
        end if
        Console.WriteLine()
    end if
end sub
</Tab>
<Tab Name="C++">
// Format the output
void Format (XmlNode* node)
{
	if (!node->HasChildNodes)
	{
	    Console::Write(S"\t{0}", node->Name);
	    Console::WriteLine(S"<{0}>", node->Value );
	}
	
	else
	{
	    Console::Write(node->Name);
	    if (XmlNodeType::Element == node->NodeType)
	    {
	        XmlNamedNodeMap* map = node->Attributes;
	        XmlNode* attrnode;
	        for (int i = 0; i < map->Count; i++)
	        {
	            attrnode = map->Item(i);
	            Console::Write(String::Concat(S" ", attrnode->Name, S"<", attrnode->Value, S"> "));
	        }
	    }
	    Console::WriteLine();
	}
}
</Tab>
</Acme:TabControl>

<p>




The XmlNode class also has a <b>NodeType</b> property. See <A target=content href="ReadXMLFile.aspx">How Do I...Read XML from a file?</A> for a table of
the different node types. The output from running this sample is shown below.


<div class="code">
<pre>
Reading file books.xml ...
File books.xml read sucessfully ...
XmlDocument loaded with XML data successfully ...
Processing ...

bookstore
book genre&ltautobiography&gt;  publicationdate&lt1981&gt;  ISBN&lt1-861003-11-0&gt;
title
        #text&ltThe Autobiography of Benjamin Franklin&gt;
author
first-name
        #text&ltBenjamin&gt;
last-name
        #text&ltFranklin&gt;
price
        #text&lt8.99&gt;
book genre&ltnovel&gt;  publicationdate&lt1967&gt;  ISBN&lt0-201-63361-2&gt;
title
        #text&ltThe Confidence Man&gt;
author
first-name
        #text&ltHerman&gt;
last-name
        #text&ltMelville&gt;
price
        #text&lt11.99&gt;
book genre&ltphilosophy&gt;  publicationdate&lt1991&gt;  ISBN&lt1-861001-57-6&gt;
title
        #text&ltThe Gorgias&gt;
author
name
        #text&ltPlato&gt;
price
        #text&lt9.99&gt;
</pre></div>

<H4>Summary</H4>
<OL>
<LI>The XmlDocument, XmlNode and other classes implement the <A href="http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html">W3C Document Object Model Level 1 Core</A></A>
and the <A href="http://www.w3.org/TR/DOM-Level-2/core.html">Core DOM Level 2</A></A> specifications.
<LI>The XmlDocument is an in-memory (cache) tree representation of an XML document.
<LI>There are different node types specializing from XmlNode to enable you to manipulate the XML document.
<LI>You can get faster, non-cached, forward-only stream access to XML using the XmlTextReader and XmlTextWriter classes.
</LI></OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->