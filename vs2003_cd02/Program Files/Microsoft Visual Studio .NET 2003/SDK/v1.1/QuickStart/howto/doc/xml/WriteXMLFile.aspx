<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Write XML to a file?</h4>

<p>
This sample illustrates how to write XML to a file using the XmlTextWriter 
class. The writer provides a fast, forward-only way of generating XML 
and helps you to build XML documents that conform to the 
<A href="http://www.w3.org/TR/1998/REC-xml-19980210">W3C Extensible Markup 
Language (XML) 1.0</A> and the <A href="http://www.w3.org/TR/REC-xml-names/">Namespaces 
in XML</A> specifications. The XmlTextWriter writes to a stream rather than 
using an object model such as the XML DOM, and so gives better performance.
</p>

<p>
Note: For more information about how to write XML using the DOM, 
see <a target=content href="DOMInterfaceXmlDocument.aspx">How Do I...Load 
and use the XmlDocument (W3C DOM)?</a>
</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/WriteXmlFile/WriteXmlFile.src"
RunSample="/quickstart/howto/samples/Xml/WriteXmlFile/CS/WriteXmlFile.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# WriteXmlFile.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/WriteXmlFile/WriteXmlFile.src"
RunSample="/quickstart/howto/samples/Xml/WriteXmlFile/VB/WriteXmlFile.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB WriteXmlFile.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/WriteXmlFile/WriteXmlFile.src"
RunSample="/quickstart/howto/samples/Xml/WriteXmlFile/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ WriteXmlFile.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
Typically, you use an XmlTextWriter if you need to write XML as raw data 
without the overhead of a DOM. The XmlTextWriter is an implementation of 
the XmlWriter class that provides the API which writes XML to file, stream, 
or a TextWriter. This class provides numerous validation and checking rules 
to ensure that the XML being written is well formed. When certain violations 
occur, exceptions are thrown and these exceptions should be caught. 
The XmlTextWriter has different constructors, each of which specifies a 
different type of the location to which to write the XML data. This sample 
uses the constructor that writes XML to a file. In particular, the following 
sample code constructs an XmlTextWriter with a string representing the file 
location for the newbooks.xml file.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XmlTextWriter myXmlTextWriter = new XmlTextWriter ( _
    Environment.GetEnvironmentVariable("TEMP") + "\\newbooks.xml", null);
</Tab>
<Tab Name="VB">
Dim myXmlTextWriter As XmlTextWriter = new XmlTextWriter ( _
    Environment.GetEnvironmentVariable("TEMP") & "\newbooks.xml", nothing)
</Tab>
<Tab Name="C++">
//The xml file name is passed through the argument
XmlTextReader* myXmlTextReader = 0;
myXmlTextWriter = new XmlTextWriter (args, 0);
</Tab>
</Acme:TabControl>

<p>
In addition to the file name, this constructor also takes the 
encoding that you would like to generate. If encoding is "null", 
the writer writes out UTF-8. For more information about how the 
encoding used in XML documents, see the W3C XML 1.0 specification.
</p>
<p>
This next fragment of sample code creates an XML file with a single 
book element. This code begins by using the Formatting property to 
specify the formatting of the XML data being written. By setting this 
property to Indented, the writer indents child elements using the 
Indentation and IndentChar properties.
</p>

<Acme:TabControl runat="server">
<Tab Name="C#">
myXmlTextWriter.Formatting = Formatting.Indented;
myXmlTextWriter.WriteStartDocument(false);
myXmlTextWriter.WriteDocType("bookstore", null, dtdFile, null);
myXmlTextWriter.WriteComment("This file represents another fragment of " +  
    "a book store inventory database");
myXmlTextWriter.WriteStartElement("bookstore");
myXmlTextWriter.WriteStartElement("book", null);
myXmlTextWriter.WriteAttributeString("genre","autobiography");
myXmlTextWriter.WriteAttributeString("publicationdate","1979");
myXmlTextWriter.WriteAttributeString("ISBN","0-7356-0562-9");
myXmlTextWriter.WriteElementString("title", null, 
    "The Autobiography of Mark Twain");
myXmlTextWriter.WriteStartElement("Author", null);
myXmlTextWriter.WriteElementString("first-name", "Mark");
myXmlTextWriter.WriteElementString("last-name", "Twain");
myXmlTextWriter.WriteEndElement();
myXmlTextWriter.WriteElementString("price", "7.99");
myXmlTextWriter.WriteEndElement();
myXmlTextWriter.WriteEndElement();

//Write the XML to file and close the myXmlTextWriter
myXmlTextWriter.Flush();
myXmlTextWriter.Close();
</Tab>
<Tab Name="VB">
myXmlTextWriter.Formatting = System.Xml.Formatting.Indented
myXmlTextWriter.WriteStartDocument(false)
myXmlTextWriter.WriteDocType("bookstore", nothing, dtdFile, nothing)
myXmlTextWriter.WriteComment("This file represents another fragment of " & _
    "a book store inventory database")
myXmlTextWriter.WriteStartElement("bookstore")
myXmlTextWriter.WriteStartElement("book", nothing)
myXmlTextWriter.WriteAttributeString("genre","autobiography")
myXmlTextWriter.WriteAttributeString("publicationdate","1979")
myXmlTextWriter.WriteAttributeString("ISBN","0-7356-0562-9")
myXmlTextWriter.WriteElementString("title", nothing, _
    "The Autobiography of Mark Twain")
myXmlTextWriter.WriteStartElement("Author", nothing)
myXmlTextWriter.WriteElementString("first-name", "Mark")
myXmlTextWriter.WriteElementString("last-name", "Twain")
myXmlTextWriter.WriteEndElement()
myXmlTextWriter.WriteElementString("price", "7.99")
myXmlTextWriter.WriteEndElement()
myXmlTextWriter.WriteEndElement()

'Write the XML to file and close the myXmlTextWriter
myXmlTextWriter.Flush()
myXmlTextWriter.Close()
</Tab>
<Tab Name="C++">
myXmlTextWriter->Formatting = Formatting::Indented;
myXmlTextWriter->WriteStartDocument(false);
myXmlTextWriter->WriteDocType(S"bookstore", 0, S"books.dtd", 0);
myXmlTextWriter->WriteComment(S"This file represents another fragment of a book store inventory database");
myXmlTextWriter->WriteStartElement(S"bookstore");
myXmlTextWriter->WriteStartElement(S"book", 0);
myXmlTextWriter->WriteAttributeString(S"genre",S"autobiography");
myXmlTextWriter->WriteAttributeString(S"publicationdate",S"1979");
myXmlTextWriter->WriteAttributeString(S"ISBN",S"0-7356-0562-9");
myXmlTextWriter->WriteElementString(S"title", 0, S"The Autobiography of Mark Twain");
myXmlTextWriter->WriteStartElement(S"Author", 0);
myXmlTextWriter->WriteElementString(S"first-name", S"Mark");
myXmlTextWriter->WriteElementString(S"last-name", S"Twain");
myXmlTextWriter->WriteEndElement();
myXmlTextWriter->WriteElementString(S"price", S"7.99");
myXmlTextWriter->WriteEndElement();
myXmlTextWriter->WriteEndElement();

//Write the XML to file and close the writer
myXmlTextWriter->Flush();
myXmlTextWriter->Close();
</Tab>
</Acme:TabControl>

<p>
In creating this element, the preceding sample code also shows how, 
for each XML node type, there is corresponding XML write method. For 
example, writing an element calls the WriteElementString method and 
writing an attribute calls the WriteAttributeString method. For nested 
levels, you use the WriteStartElement/WriteEndElement pair and, for more 
complex attribute creation, you can use the WriteStartAttribute/WriteEndAttribute pair.
</p>

<p>
When writing XML, notice how the sample code writes the XML declaration 
with the version "1.0" using the WriteStartDocument method. If you want the 
writer to check that the document is well formed (XML declaration first, 
DOCTYPE in prolog, only one root level element, and so on), you must call 
this optional WriteStartDocument method before calling any other write method. 
Next, the code calls the WriteDocType method to writes the document type 
with the name "bookstore". The third parameter in the call to the WriteDocType 
specifies that the writer is to write SYSTEM "books.dtd". By writing this, the 
XML file indicates that there is an external DTD to validate against.
</p>

<p>
Finally, the sample code calls the Flush method to persist the XML data 
to a file before calling the Close method. (While this sample only really 
requires the Close method, there are occasions where the XML generated needs 
to be persisted and the writer reused.)
</p>

<p>
To check the output from the XmlTextWriter, perform a round trip test by 
reading in the generated file with an XmlTextReader to validate that the 
XML is well formed.
</p>

<p>
<H4>Summary</H4>
<OL>
<LI>The XmlTextWriter provides a fast, forward only way of generating XML.
<LI>The XmlTextWriter helps you to write XML documents that conform to the <A href="http://www.w3.org/TR/1998/REC-xml-19980210">W3C Extensible Markup
Language (XML) 1.0</A></A> specification and the <A><A href="http://www.w3.org/TR/REC-xml-names/">Namespaces in XML</A></A> specification.
<LI>The XmlTextWriter provides constructors to write XML to a file, a stream or a TextWriter.
<LI>For each XML node type there are corresponding XML write methods.
</LI></OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
</xml>

