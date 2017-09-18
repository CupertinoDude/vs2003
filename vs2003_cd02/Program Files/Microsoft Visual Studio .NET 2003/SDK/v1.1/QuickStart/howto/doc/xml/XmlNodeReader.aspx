<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Use an XmlNodeReader?</h4>

<p>
This sample illustrates how to create and use an XmlNodeReader. An XmlNodeReader is a reader that provides fast, non-cached, forward-only access to XML data in an XmlNode. It has the ability to read an entire XML DOM tree or read from just a subtree. However, the XmlNodeReader does not support Document Type Definition (DTD) or schema validation, and therefore does not validate the XML it is reading.
<p>
This sample loads the books.xml into an XmlDocument, and then uses an XmlNodeReader to get each node and its respective value to display to the screen.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/XmlNodeReader/CS/XmlNodeReader.aspx"
ViewSource="/quickstart/howto/samples/Xml/XmlNodeReader/XmlNodeReader.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# XmlNodeReader.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlNodeReader/XmlNodeReader.src"
RunSample="/quickstart/howto/samples/Xml/XmlNodeReader/VB/XmlNodeReader.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB XmlNodeReader.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlNodeReader/XmlNodeReader.src"
RunSample="/quickstart/howto/samples/Xml/XmlNodeReader/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ XmlNodeReader.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
After creating and loading an XmlDocument with the books.xml file, the sample creates an XmlNodeReader that selects a single node from the XmlDocument. The sample passes this XmlNodeReader to the FormatXml function that prints the node data to the screen. The sample then creates another XmlNodeReader that selects a different node to output to the screen.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XmlDocument myXmlDocument = new XmlDocument();
myXmlDocument.Load (arg);
...
XmlNodeReader myXmlNodeReader = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[3]"));
FormatXml (myXmlNodeReader);
...
myXmlNodeReader = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[2]"));

myXmlNodeReader.Read();
Console.WriteLine (myXmlNodeReader.ReadInnerXml());
</Tab>
<Tab Name="VB">
Dim myXmlDocument as XmlDocument  = new XmlDocument()
myXmlDocument.Load (arg)
...
Dim myXmlNodeReader as XmlNodeReader  = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[3]"))
FormatXml (myXmlNodeReader)
...
myXmlNodeReader = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[2]"))

myXmlNodeReader.Read()
Console.WriteLine (myXmlNodeReader.ReadInnerXml())
</Tab>
<Tab Name="C++">
XmlDocument* myXmlDocument = new XmlDocument();
myXmlDocument->Load (args);
...
XmlNodeReader* myXmlNodeReader = new XmlNodeReader (myXmlDocument->SelectSingleNode(S"bookstore/book[3]"));
FormatXml (myXmlNodeReader);
...
myXmlNodeReader = new XmlNodeReader (myXmlDocument.SelectSingleNode("bookstore/book[2]"));

myXmlNodeReader->Read();
Console::WriteLine (myXmlNodeReader->ReadInnerXml());
</Tab>
</Acme:TabControl>
<p>

This part of the sample simply reads each node using the Read method of the XmlNodeReader and then, depending on the node type, prints the node to the screen using the Format function.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private static void FormatXml (XmlNodeReader reader)
{
    while (reader.Read())
    {
        switch (reader.NodeType)
        {
            case XmlNodeType.ProcessingInstruction:
                Format (reader, "ProcessingInstruction");
                break;
            case XmlNodeType.DocumentType:
                Format (reader, "DocumentType");
                break;
            case XmlNodeType.Document:
                Format (reader, "Document");
                break;
            case XmlNodeType.Comment:
                Format (reader, "Comment");
                break;
            case XmlNodeType.Element:
                Format (reader, "Element");
                while(reader.MoveToNextAttribute())
                {
                    Format (reader, "Attribute");
                }
                break;
            case XmlNodeType.Text:
                Format (reader, "Text");
                break;
            case XmlNodeType.Whitespace:
                Format (reader, "Whitespace");
                break;
        }
    }
}

// Format the output
private static void Format(XmlNodeReader reader, String NodeType)
{
    // Format the output
    for (int i=0; i < reader.Depth; i++)
    {
        Console.Write('\t');
    }

    Console.Write(NodeType + "<" + reader.Name + ">" + reader.Value);
    Console.WriteLine();
}
</Tab>
<Tab Name="VB">
private sub FormatXml (reader as XmlNodeReader)

    while (reader.Read())

    select case reader.NodeType

        case XmlNodeType.ProcessingInstruction:
            Format (reader, "ProcessingInstruction")

        case XmlNodeType.DocumentType:
            Format (reader, "DocumentType")

        case XmlNodeType.Document:
            Format (reader, "Document")

        case XmlNodeType.Comment:
            Format (reader, "Comment")

        case XmlNodeType.Element:
            Format (reader, "Element")
            while (reader.MoveToNextAttribute())
                Format (reader, "Attribute")
            end while

        case XmlNodeType.Text:
            Format (reader, "Text")

        case XmlNodeType.Whitespace:
            Format (reader, "Whitespace")

        end select
end while

end sub

'Format the output
private sub Format (reader as XmlNodeReader, NodeType as String)

    Dim value as String = System.String.Empty
    Dim i as long
    for i=0  to (reader.Depth - 1)
        Console.Write(Chr(9))
    Next

    if (reader.HasValue)
        value = reader.Value
    end if

    Console.WriteLine(NodeType & "<" & reader.Name & ">" + value)
end sub
</Tab>
<Tab Name="C++">
void FormatXml (XmlNodeReader* reader)
{
 while (reader->Read())
 {
    switch (reader->NodeType)
    {
    case XmlNodeType::ProcessingInstruction:
            Format (reader, S"ProcessingInstruction");
            break;
    case XmlNodeType::DocumentType:
            Format (reader, S"DocumentType");
            break;
    case XmlNodeType::Document:
            Format (reader, S"Document");
            break;
    case XmlNodeType::Comment:
            Format (reader, S"Comment");
            break;
    case XmlNodeType::Element:
            Format (reader, S"Element");
            while(reader->MoveToNextAttribute())
            {
                Format (reader, S"Attribute");
            }
            break;
    case XmlNodeType::Text:
            Format (reader, S"Text");
            break;
    case XmlNodeType::Whitespace:
            Format (reader, S"Whitespace");
            break;
    }
 }
}
// Format the output
void Format(XmlNodeReader* reader, String* NodeType)
{
 // Format the output
 for (int i=0; i < reader->Depth; i++)
 {
    Console::Write(S"\t");
 }

 Console::Write(String::Concat(NodeType, S"<", reader->Name, S">", reader->Value));
 Console::WriteLine();
}
</Tab>
</Acme:TabControl>
<p>

<H4>Summary</H4>
<OL>
<LI>XmlNodeReader is a fast, non-cached, forward-only reader to access XML data in an XmlNode.
<LI>Since XmlNodeReader can also be constructed with any XmlNode within the XmlDocument, XmlNodeReader provides a reader that reads only the subtree of a given node.
</OL>

<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->



































































































