<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Read XML from a URL?</h4>

<p>
This sample illustrates how to read XML from an URL using the XmlTextReader class.

<p>
Note: This sample follows on from the <A href="/quickstart/howto/doc/Xml/ReadXmlFile.aspx">How do I...Read XML from a file?</A> topic.

<Acme:LangSwitch runat="server" ID=LangSwitch1>
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/XmlReadFromUrl/CS/XmlReadFromUrl.aspx"
ViewSource="/quickstart/howto/samples/Xml/XmlReadFromUrl/XmlReadFromUrl.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# XmlReadFromUrl.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlReadFromUrl/XmlReadFromUrl.src"
RunSample="/quickstart/howto/samples/Xml/XmlReadFromUrl/VB/XmlReadFromUrl.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB XmlReadFromUrl.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlReadFromUrl/XmlReadFromUrl.src"
RunSample="/quickstart/howto/samples/Xml/XmlReadFromUrl/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ XmlReadFromUrl.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
<p>
The XmlTextReader has different constructors to specify the location of the XML data. This sample loads the XmlTextReader from one of these language specific URLs: http://localhost/quickstart/howto/samples/Xml/XmlReadFromUrl/vb/books.xml or http://localhost/quickstart/howto/samples/Xml/XmlReadFromUrl/cs/books.xml. The following sample code constructs an XmlTextReader.

<p>
<Acme:TabControl runat="server" >
<Tab Name="C#">
String URLString = "http://localhost/quickstart/howto/samples/Xml/XmlReadFromUrl/vb/books.xml";

// Load the XmlTextReader from the URL
myXmlURLreader = new XmlTextReader (URLString);
</Tab>
<Tab Name="VB">
private const URLString as String = "http://localhost/quickstart/howto/samples/Xml/XmlReadFromUrl/vb/books.xml"

' Load the XmlTextReader from the URL
myXmlURLreader = new XmlTextReader (URLString)
</Tab>
<Tab Name="C++">
static String* localURL = S"http://localhost/quickstart/howto/samples/Xml/XmlReadFromUrl/cs/books.xml";

// Load the XmlTextReader from the URL
MyXmlURLreader = new XmlTextReader (localURL);
</Tab>
</Acme:TabControl>
<p>

Once loaded, the sample code calls the FormatXML function. In this function, the XmlTextReader moves across the XML data by using the Read method to perform sequential reads to get the next node. This function returns false if there are no more nodes. For more information about how the Read method works, see <A href="/quickstart/howto/doc/Xml/ReadXmlFile.aspx">How do I...Read XML from a file?</A>

<p>
<Acme:TabControl runat="server" >
<Tab Name="C#">
while (reader.Read())
{
    switch (reader.NodeType)
    {
        case XmlNodeType.XmlDeclaration:
            Format (reader, "XmlDeclaration");
            declarationCount++;
            break;
        case XmlNodeType.ProcessingInstruction:
            Format (reader, "ProcessingInstruction");
            piCount++;
            break;
        case XmlNodeType.DocumentType:
            Format (reader, "DocumentType");
            docCount++;
            break;
        case XmlNodeType.Comment:
            Format (reader, "Comment");
            commentCount++;
            break;
        case XmlNodeType.Element:
            Format (reader, "Element");
            elementCount++;
            if (reader.HasAttributes)
                attributeCount += reader.AttributeCount;
            break;
        case XmlNodeType.Text:
            Format (reader, "Text");
            textCount++;
            break;
        case XmlNodeType.Whitespace:
            whitespaceCount++;
            break;
    }
}
</Tab>
<Tab Name="VB">
While reader.Read()

    Select (reader.NodeType)

        case XmlNodeType.XmlDeclaration:
            Format (reader, "XmlDeclaration")
            declarationCount += 1

        case XmlNodeType.ProcessingInstruction:
            Format (reader, "ProcessingInstruction")
            piCount += 1

        case XmlNodeType.DocumentType:
            Format (reader, "DocumentType")
            docCount += 1

        case XmlNodeType.Comment:
            Format (reader, "Comment")
            commentCount += 1

        case XmlNodeType.Element:
            Format (reader, "Element")
            elementCount += 1
            if (reader.HasAttributes)
                attributeCount += reader.AttributeCount
            end if

        case XmlNodeType.Text:
            Format (reader, "Text")
            textCount += 1

        case XmlNodeType.Whitespace:
            whitespaceCount += 1

    End Select

End While

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
        PI_count++;
        break;
    case XmlNodeType::DocumentType:
        Format (reader, S"DocumentType");
        Doc_count++;
        break;
    case XmlNodeType::Comment:
        Format (reader, S"Comment");
        comment_count++;
        break;
    case XmlNodeType::Element:
        Format (reader, S"Element");
        element_count++;
        if (reader->HasAttributes)
            attribute_count += reader->AttributeCount;
        break;
    case XmlNodeType::Text:
        Format (reader, S"Text");
        text_count++;
        break;
    case XmlNodeType::Whitespace:
        whitespace_count++;
        break;
    }
}
</Tab>
</Acme:TabControl>
<p>


<p>

<H4>Summary</H4>
<OL>
<LI>The XmlTextReader provides constructors to read XML from a string representing an URL or a filename, a stream, or a TextReader.
<LI>Attribute nodes can be accessed with the MoveToNextAttribute method that allows you to determine the properties of the attribute node.
</OL>
<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->



































































































