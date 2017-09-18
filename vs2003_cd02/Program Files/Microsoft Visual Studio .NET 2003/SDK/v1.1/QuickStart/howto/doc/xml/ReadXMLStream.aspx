<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Read XML data from a stream?</h4>

<p>
This sample illustrates how to read XML from a stream using the XmlTextReader class. The stream could have come from a variety of sources such as a byte stream from a server, a file, or from a TextReader.
<p>
Note: This sample follows on from the <a href="/quickstart/howto/doc/Xml/ReadXmlFile.aspx">How do I...Read XML from a file?</a> topic.


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/ReadXmlStream/CS/ReadXmlStream.aspx"
ViewSource="/quickstart/howto/samples/Xml/ReadXmlStream/ReadXmlStream.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ReadXmlStream.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/ReadXmlStream/ReadXmlStream.src"
RunSample="/quickstart/howto/samples/Xml/ReadXmlStream/VB/ReadXmlStream.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ReadXmlStream.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/ReadXmlStream/ReadXmlStream.src"
RunSample="/quickstart/howto/samples/Xml/ReadXmlStream/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ ReadXmlStream.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The XmlTextReader has different constructors to specify the location of the XML data. This sample loads the XmlTextReader from a stream. A stream is an abstract representation of an input or output device that is the source of or destination for data (in this case, XML data). You can write to a stream and read from a stream, which is best visualized as a flow of bytes. A stream provides independence from the device and hence requires no program changes if, for instance, the source of a stream changes.
<p>
The following sample code creates a StringReader class that builds up an XML string. Since this is purely a byte stream held in memory, you can get the XmlTextReader to parse this stream as XML. This memory stream has no particular specified encoding. The sample then creates an XmlTextReader that parses the stream and displays the resultant XML.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
StringReader stream;
XmlTextReader reader = null;

try
{
    Console.WriteLine ("Initializing StringReader ...");

    stream = new StringReader("&lt?xml version='1.0'?&gt" +
                              "&lt!-- This file represents a fragment of a book store inventory database --&gt" +
                              "&ltbookstore&gt" +
                              " &ltbook genre=\"autobiography\" publicationdate=\"1981\" ISBN=\"1-861003-11-0\"&gt" +
                              "   &lttitle&gtThe Autobiography of Benjamin Franklin&lt/title&gt" +
                              "   &ltauthor&gt" +
                              "       &ltfirst-name&gtBenjamin&lt/first-name&gt" +
                              "       &ltlast-name&gtFranklin&lt/last-name&gt" +
                              "   &lt/author&gt" +
                              "   &ltprice&gt8.99&lt/price&gt" +
                              " &lt/book&gt" +
                              " &ltbook genre=\"novel\" publicationdate=\"1967\" ISBN=\"0-201-63361-2\"&gt" +
                              "   &lttitle&gtThe Confidence Man&lt/title&gt" +
                              "   &ltauthor&gt" +
                              "       &ltfirst-name&gtHerman&lt/first-name&gt" +
                              "       &ltlast-name&gtMelville&lt/last-name&gt" +
                              "   &lt/author&gt" +
                              "   &ltprice&gt11.99&lt/price&gt" +
                              " &lt/book&gt" +
                              "  &ltbook genre=\"philosophy\" publicationdate=\"1991\" ISBN=\"1-861001-57-6\"&gt" +
                              "   &lttitle&gtThe Gorgias&lt/title&gt" +
                              "   &ltauthor&gt" +
                              "       &ltname&gtPlato&lt/name&gt" +
                              "   &lt/author&gt" +
                              "   &ltprice&gt9.99&lt/price&gt" +
                              " &lt/book&gt" +
                              "&lt/bookstore&gt");

    // Load the XmlTextReader from the stream
    reader = new XmlTextReader (stream);

    Console.WriteLine ("Processing ...");
    Console.WriteLine ();
    FormatXml(reader);
}

catch (Exception e)
{
    Console.WriteLine ("Exception: {0}", e.ToString());
}

finally
{
    Console.WriteLine();
    Console.WriteLine("Processing of stream complete.");
    // Finished with XmlTextReader
    if (reader != null)
        reader.Close();
}
</Tab>
<Tab Name="VB">
Dim stream as StringReader
Dim reader as XmlTextReader = nothing

try
    Console.WriteLine ("Initializing StringReader ...")
    stream = new StringReader ("&lt?xml version='1.0'?&gt" & _
                               "&lt!-- This file represents a fragment of a book store inventory database --&gt" & _
                               "&ltbookstore&gt" & _
                               " &ltbook genre=""autobiography"" publicationdate=""1981"" ISBN=""1-861003-11-0""&gt" & _
                               "   &lttitle&gtThe Autobiography of Benjamin Franklin&lt/title&gt" & _
                               "   &ltauthor&gt" & _
                               "       &ltfirst-name&gtBenjamin&lt/first-name&gt" & _
                               "       &ltlast-name&gtFranklin&lt/last-name&gt" & _
                               "   &lt/author&gt" & _
                               "   &ltprice&gt8.99&lt/price&gt" & _
                               " &lt/book&gt" & _
                               " &ltbook genre=""novel"" publicationdate=""1967"" ISBN=""0-201-63361-2""&gt" & _
                               "   &lttitle&gtThe Confidence Man&lt/title&gt" & _
                               "   &ltauthor&gt" & _
                               "       &ltfirst-name&gtHerman&lt/first-name&gt" & _
                               "       &ltlast-name&gtMelville&lt/last-name&gt" & _
                               "   &lt/author&gt" & _
                               "   &ltprice&gt11.99&lt/price&gt" & _
                               " &lt/book&gt" & _
                               "  &ltbook genre=""philosophy"" publicationdate=""1991"" ISBN=""1-861001-57-6""&gt" & _
                               "   &lttitle&gtThe Gorgias&lt/title&gt" & _
                               "   &ltauthor&gt" & _
                               "       &ltname&gtPlato&lt/name&gt" & _
                               "   &lt/author&gt" & _
                               "   &ltprice&gt9.99&lt/price&gt" & _
                               " &lt/book&gt" & _
                               "&lt/bookstore&gt")

    ' Load the XmlTextReader from the stream
    reader = new XmlTextReader (stream)

    Console.WriteLine ("Processing ...")
    Console.WriteLine ()
    FormatXml(reader)

catch e as Exception
    Console.WriteLine ("Exception: {0} ", e.ToString())

finally
    Console.WriteLine()
    Console.WriteLine("Processing of stream complete.")
    If Not reader Is Nothing
        reader.Close()
    end if
end try
</Tab>
<Tab Name="C++">
StringReader* stream;
XmlTextReader* reader = 0;

try
{
    Console::WriteLine ("Initializing StringReader ...");

    stream = new StringReader(String::Concat(S"<?xml version='1.0'?>",
                              S"<!-- This file represents a fragment of a book store inventory database -->",
                              S"<bookstore>",
                              S" <book genre=\"autobiography\" publicationdate=\"1981\" ISBN=\"1-861003-11-0\">",
                              S"   <title>The Autobiography of Benjamin Franklin</title>",
                              S"   <author>",
                              S"       <first-name>Benjamin</first-name>",
                              S"       <last-name>Franklin</last-name>",
                              S"   </author>",
                              S"   <price>8.99</price>",
                              S" </book>",
                              S" <book genre=\"novel\" publicationdate=\"1967\" ISBN=\"0-201-63361-2\">",
                              S"   <title>The Confidence Man</title>",
                              S"   <author>",
                              S"       <first-name>Herman</first-name>",
                              S"       <last-name>Melville</last-name>",
                              S"   </author>",
                              S"   <price>11.99</price>",
                              S" </book>",
                              S"  <book genre=\"philosophy\" publicationdate=\"1991\" ISBN=\"1-861001-57-6\">",
                              S"   <title>The Gorgias</title>",
                              S"   <author>",
                              S"       <name>Plato</name>",
                              S"   </author>",
                              S"   <price>9.99</price>",
                              S" </book>",
                              S"</bookstore>"));

    // Load the XmlTextReader from the stream
    reader = new XmlTextReader (stream);

    Console::WriteLine ("Processing ...");
    Console::WriteLine ();
    FormatXml(reader);
}

catch (Exception* e)
{
    Console::WriteLine ("Exception: {0}", e->ToString());
}

__finally
{
    Console::WriteLine();
    Console::WriteLine("Processing of stream complete.");
    // Finished with XmlTextReader
    if (reader != 0)
        reader->Close();
}
</Tab>
</Acme:TabControl>

<p>
If a Stream is supplied as input, the XmlTextReader properly decodes this by wrapping the stream in a StreamReader and calling the SwitchEncoding property according to the XML encoding specified. Also, the XmlResolver is used to resolve external resources needed to correctly parse the input - like Document Type Definitions (DTDs) and schemas. Another method of representing a stream is by using a StreamReader class that implements a reader that reads from a character stream. The following code sample illustrates loading a file named books.xml and then using the XmlTextReader to parse the resulting file.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
StreamReader streamreader = new StreamReader ("books.xml");
Console.WriteLine ("File books.xml read sucessfully ...");

// Load the XmlTextReader from the StreamReader
XmlTextReader xmlreader = new XmlTextReader (streamreader);
</Tab>
<Tab Name="VB">
Dim streamreader As StreamReader = New StreamReader ("books.xml")
Console.WriteLine ("File books.xml read sucessfully ...")

' Load the XmlTextReader from the StreamReader
Dim xmlreader As XmlTextReader = New XmlTextReader (streamreader)
</Tab>
<Tab Name="C++">
StreamReader* streamreader = new StreamReader ("books.xml");
Console::WriteLine ("File books.xml read sucessfully ...");

// Load the XmlTextReader from the StreamReader
XmlTextReader* xmlreader = new XmlTextReader (streamreader);
</Tab>
</Acme:TabControl>

<p>
The FormalXml method in this sample shows how to move to the attribute nodes using the MoveToNextAttribute method when the current node is an element node. This allows you not only to access the node's name and value properties but, because you are at a node context, you can also get properties like the current namespace for the attribute. The following code sample also shows the Format method that this time displays the name and value for the current node.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private static void FormatXml (XmlReader reader)
{
    int piCount=0, docCount=0, commentCount=0, elementCount=0, attributeCount=0, textCount=0, whitespaceCount=0;

    while (reader.Read())
    {
        switch (reader.NodeType)
        {
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
            while(reader.MoveToNextAttribute())
            {
                Format (reader, "Attribute");
            }
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

    // Display the Statistics
    Console.WriteLine ();
    Console.WriteLine("Statistics for stream");
    Console.WriteLine ();
    Console.WriteLine("ProcessingInstruction: {0}",piCount++);
    Console.WriteLine("DocumentType: {0}",docCount++);
    Console.WriteLine("Comment: {0}",commentCount++);
    Console.WriteLine("Element: {0}",elementCount++);
    Console.WriteLine("Attribute: {0}",attributeCount++);
    Console.WriteLine("Text: {0}",textCount++);
    Console.WriteLine("Whitespace: {0}",whitespaceCount++);
}

// Format the output
private static void Format(XmlReader reader, String nodeType)
{
    // Format the output
    Console.Write(reader.Depth + " ");
    Console.Write(reader.AttributeCount + " ");
    for (int i=0; i < reader.Depth; i++)
    {
        Console.Write('\t');
    }

    Console.Write(nodeType + "<" + reader.Name + ">" + reader.Value);
    Console.WriteLine();
}
</Tab>
<Tab Name="VB">
private shared sub FormatXml (reader as XmlTextReader)

    Dim piCount, docCount, commentCount, elementCount as Integer
    Dim attributeCount, textCount, whitespaceCount as Integer

    While reader.Read()

        Select (reader.NodeType)

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
            While reader.MoveToNextAttribute()
                Format (reader, "Attribute")
            end While

            if (reader.HasAttributes)
                attributeCount += reader.AttributeCount
            end if

        case XmlNodeType.Text:
            Format (reader, "Text")
            textCount += 1

        case XmlNodeType.Whitespace:
            whitespaceCount += 1

        end Select

    end While

    ' Display the Statistics for the file
    Console.WriteLine ()
    Console.WriteLine("Statistics for stream")
    Console.WriteLine ()
    Console.WriteLine("ProcessingInstruction: " & piCount)
    Console.WriteLine("DocumentType: " & docCount)
    Console.WriteLine("Comment: " & commentCount)
    Console.WriteLine("Element: " & elementCount)
    Console.WriteLine("Attribute: " & attributeCount)
    Console.WriteLine("Text: " & textCount)
    Console.WriteLine("Whitespace: " & whitespaceCount)
end sub

private shared sub Format(byref reader as XmlTextReader, nodeType as String)

    ' Format the output
    Console.Write(reader.Depth & " ")
    Console.Write(reader.AttributeCount & " ")

    Dim i as Integer
    for i = 0 to reader.Depth
        Console.Write(Strings.chr(9))
    Next

    Console.Write(reader.Prefix & nodeType & "<" & reader.Name & ">" & reader.Value)
    Console.WriteLine()

end sub
</Tab>
<Tab Name="C++">
void FormatXml (XmlReader* reader)
{
	int piCount=0, docCount=0, commentCount=0, elementCount=0, attributeCount=0, textCount=0, whitespaceCount=0;
	
	while (reader->Read())
	{
	    switch (reader->NodeType)
	    {
	    case XmlNodeType::ProcessingInstruction:
	        Format (reader, "ProcessingInstruction");
	        piCount++;
	        break;
	    case XmlNodeType::DocumentType:
	        Format (reader, "DocumentType");
	        docCount++;
	        break;
	    case XmlNodeType::Comment:
	        Format (reader, "Comment");
	        commentCount++;
	        break;
	    case XmlNodeType::Element:
	        Format (reader, "Element");
	        while(reader->MoveToNextAttribute())
	        {
	            Format (reader, "Attribute");
	        }
	        elementCount++;
	        if (reader->HasAttributes)
	            attributeCount += reader->AttributeCount;
	        break;
	    case XmlNodeType::Text:
	        Format (reader, "Text");
	        textCount++;
	        break;
	    case XmlNodeType::Whitespace:
	        whitespaceCount++;
	        break;
	    }
	}
	
	// Display the Statistics
	Console::WriteLine ();
	Console::WriteLine("Statistics for stream");
	Console::WriteLine ();
	Console::WriteLine("ProcessingInstruction: {0}",__box(piCount++));
	Console::WriteLine("DocumentType: {0}",__box(docCount++));
	Console::WriteLine("Comment: {0}",__box(commentCount++));
	Console::WriteLine("Element: {0}",__box(elementCount++));
	Console::WriteLine("Attribute: {0}",__box(attributeCount++));
	Console::WriteLine("Text: {0}",__box(textCount++));
	Console::WriteLine("Whitespace: {0}",__box(whitespaceCount++));
}

// Format the output
void Format(XmlReader* reader, String* nodeType)
{
	// Format the output
	Console::Write("{0} ",__box(reader->Depth));
	Console::Write("{0} ",__box(reader->AttributeCount));
	for (int i=0; i < reader->Depth; i++)
	{
	    Console::Write("\t");
	}
	
	Console::Write(String::Concat(nodeType, S"<", reader->Name, S">" ,reader->Value));
	Console::WriteLine();
}
</Tab>
</Acme:TabControl>

<H4>Summary</H4>
<OL>
<LI>A stream is an abstract representation of an input or output device that is the source of or destination for data.
<LI>The XmlTextReader provides constructors to read XML from a string representing an URL or a local file name, a stream, or a TextReader.
<LI>The XmlTextReader provides constructors to read XML from a file name, a stream, or a TextReader.
<LI>Attribute nodes can be accessed with the MoveToNextAttribute method that allows you to determine the properties of the attribute node.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->