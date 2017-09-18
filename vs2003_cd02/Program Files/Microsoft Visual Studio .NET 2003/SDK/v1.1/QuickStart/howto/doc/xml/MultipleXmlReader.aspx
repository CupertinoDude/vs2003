<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...use multiple XmlReaders</h4>

<p>
In some situations, you may have one reader that reads part of an XML document, and one or more other readers that read the rest of the document. For example, an e-commerce ordering system may have orders submitted as XML documents. In processing these orders, one reader may process information at the beginning of the file and then route the rest of the document to another reader to handle the remaining order details.
<p>
In order to enable a reader to accept a document from another reader, you use one of two XmlTextReader constructors. One constructor takes a string; the other takes a stream. The string or stream passed to the constructor can contain an XML document fragment. Thus, you can have one reader pass a partially read XML document to another reader. The following code shows the syntax for the XmlTextReader constructors that use a string or stream.

<p>
<Acme:TabControl runat="server" ID=TabControl1>
<Tab Name="C#">
public XmlTextReader(String xmlFragment, XmlNodeType fragType, XmlParserContext context);
public XmlTextReader(Stream xmlFragment, XmlNodeType fragType, XmlParserContext context);
</Tab>
<Tab Name="VB">
Overloads Public Sub New(ByVal xmlFragment as String, ByVal fragType as XmlNodeType,
                         ByVal context as XmlParserContext)
Overloads Public Sub New(ByVal xmlFragment as Stream, ByVal fragType as XmlNodeType,
                         ByVal context as XmlParserContext)
</Tab>
<Tab Name="C++">
FileStream* filestreamSource = new FileStream(args, FileMode::Open, FileAccess::Read);
XmlTextReader* reader = new XmlTextReader(filestreamSource);
</Tab>
</Acme:TabControl>

<p>
The XmlParserContext object provides the XmlTextReader with the appropriate Document Type Definition (DTD), base URI for external resources, xml:lang, xml:space, and namespace information. The XmlParserContext constructor takes eight parameters. If only namespace/prefix lookup is required for the second XmlTextReader, you can specify the XmlNamespaceManager and XmlNameTable parameters and pass a null value for the others.
<p>
The XmlNamespaceManager passed to the constructor specifies the namespace manager used for looking up namespace information. For example, a document fragment may contain prefixes defined in an earlier portion of the document. The XmlNamespaceManager enables the XmlTextReader to resolve any prefix in the document appropriately. When creating an XmlNamespaceManager to be used by an XmlTextReader, you must use the AddNamespace method to add each prefix and namespace that the XmlTextReader reads to the XmlNamespaceManager to the collection. The default namespace (if one exists) has the prefix of String.Empty. If the XML document contains a prefix that does not have an entry in the XmlNamespaceManager, the XmlTextReader throws an XmlException.
<p>
Programmatically retrieving prefixes and namespaces from nodes in an XmlReader (and its derived classes) only takes into account nodes read up to the reader's current position in the XML document. If you want to hand off a partially read stream/string to another XmlReader (using the XmlParserContext), you cannot account for namespaces defined in the unread portion of the stream/string. A better approach is to use the XmlNamespaceManager in situations where you know the namespaces beforehand..

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/MultipleXmlReader/CS/MultipleXmlReader.aspx"
ViewSource="/quickstart/howto/samples/Xml/MultipleXmlReader/MultipleXmlReader.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# MultipleXmlReader.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/MultipleXmlReader/MultipleXmlReader.src"
RunSample="/quickstart/howto/samples/Xml/MultipleXmlReader/VB/MultipleXmlReader.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB MultipleXmlReader.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/MultipleXmlReader/MultipleXmlReader.src"
RunSample="/quickstart/howto/samples/Xml/MultipleXmlReader/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ MultipleXmlReader.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The following sample code uses two XmlTextReaders to read an XML document and display the element information. One reader reads the first portion of the document and the second reader reads the remaining part of the document. This code first creates an XmlNamespaceManager, and then adds the prefixes and namespaces (including the default namespace) used in the XML document to the XmlNamespaceManager. The XmlParserContext used to construct the second XmlTextReader then uses this XmlNamespaceManager as the namespace manager to use to look up namespace information.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
//Create a new file stream for the specified source file.
FileStream filestreamSource = new FileStream(args, FileMode.Open, FileAccess.Read);
//Create a new reader with the file stream
XmlTextReader reader = new XmlTextReader(filestreamSource);
//Read the first part of the XML document
while(reader.Read())
{
    //Display the elements and stop reading on the part1 endelement tag
    //then go to ReadPart2 to start another reader to read the rest of the file.
    switch(reader.NodeType)
    {
        case XmlNodeType.Element:
            Console.WriteLine("Name: {0}", reader.Name);
            Console.WriteLine("  Prefix: {0}", reader.Prefix);
            Console.WriteLine("  LocalName: {0}", reader.LocalName);
            Console.WriteLine("  Namespace: {0}", reader.NamespaceURI);
            break;
        case XmlNodeType.EndElement:
            //Stop reading at end element for element with localname equal to part1
            if ("part1"==reader.LocalName)
            {
                Console.WriteLine("End reading part 1...");
                Console.WriteLine();
                goto ReadPart2;
            }
            break;
    }
}

//Read the rest of the XML document
ReadPart2:
Console.WriteLine("Begin reading part 2...");
//Create an XmlNamespaceManager and add the namespaces for the document.
XmlNamespaceManager nsmanager = new XmlNamespaceManager(reader.NameTable);
//Set default namespace--first param is null.
nsmanager.AddNamespace(String.Empty, "http://tempuri.org/mydefaultnamespace");
nsmanager.AddNamespace("myns", "http://tempuri.org/mynamespace");
nsmanager.AddNamespace("yourns", "http://tempuri.org/yournamespace");
XmlParserContext pc = new XmlParserContext(reader.NameTable, nsmanager, reader.XmlLang, XmlSpace.Default);

XmlTextReader reader2 = new XmlTextReader(filestreamSource, XmlNodeType.Element, pc);

while(reader2.Read())
{
    switch (reader2.NodeType)
    {
        case XmlNodeType.Element:
            Console.WriteLine("Element Name: {0}", reader2.Name);
            Console.WriteLine("  Prefix: {0}", reader2.Prefix);
            Console.WriteLine("  LocalName: {0}", reader2.LocalName);
            Console.WriteLine("  Namespace: {0}", reader2.NamespaceURI);
            break;
        case XmlNodeType.EndElement:
            //Stop reading at end element for element with localname equal to part2
            if ("part2"==reader2.LocalName)
            {
                Console.WriteLine("End reading part 2...");
                goto Done;
            }
            break;
    }
}

Done:
Console.WriteLine("Done.");
reader.Close();
</Tab>
<Tab Name="VB">
'Create a new file stream for the specified source file.
Dim filestreamSource as FileStream  = new FileStream(args, FileMode.Open, FileAccess.Read)
'Create a new reader with the file stream
Dim reader as XmlTextReader  = new XmlTextReader(filestreamSource)
'Read the first part of the XML document
while(reader.Read())
    'Display the elements and stop reading on the part1 end element tag
    'then go to ReadPart2 to start another reader to read the rest of the file.
    Select (reader.NodeType)

        case XmlNodeType.Element
            Console.WriteLine("Name: {0}", reader.Name)
            Console.WriteLine("  Prefix: {0}", reader.Prefix)
            Console.WriteLine("  LocalName: {0}", reader.LocalName)
            Console.WriteLine("  Namespace: {0}", reader.NamespaceURI)

        case XmlNodeType.EndElement
            'Stop reading at end element for element with localname equal to part1
            if ("part1" = reader.LocalName) then
                Console.WriteLine("End reading part 1...")
                Console.WriteLine()
                goto ReadPart2
            end if

    end Select
end while

'Read the rest of the XML document
ReadPart2:
Console.WriteLine("Begin reading part 2...")
'Create an XmlNamespaceManager and add the namespaces for the document.
Dim nsmanager as XmlNamespaceManager  = new XmlNamespaceManager(reader.NameTable)
'Set default namespace--first param is null.
nsmanager.AddNamespace(String.Empty, "http://tempuri.org/mydefaultnamespace")
nsmanager.AddNamespace("myns", "http://tempuri.org/mynamespace")
nsmanager.AddNamespace("yourns", "http://tempuri.org/yournamespace")
Dim pc as XmlParserContext  = new XmlParserContext(reader.NameTable, nsmanager, reader.XmlLang, XmlSpace.Default)

Dim reader2 as XmlTextReader = new XmlTextReader(filestreamSource, XmlNodeType.Element, pc)

while(reader2.Read())
    Select (reader2.NodeType)

        case XmlNodeType.Element
            Console.WriteLine("Element Name: {0}", reader2.Name)
            Console.WriteLine("  Prefix: {0}", reader2.Prefix)
            Console.WriteLine("  LocalName: {0}", reader2.LocalName)
            Console.WriteLine("  Namespace: {0}", reader2.NamespaceURI)

        case XmlNodeType.EndElement
            'Stop reading at end element for element with localname equal to part2
            if ("part2" = reader2.LocalName) then
                Console.WriteLine("End reading part 2...")
                goto Done
            end if

    end Select
end while

Done:
Console.WriteLine("Done.")
reader.Close()
</Tab>
<Tab Name="C++">
//Create a new reader with the file stream
XmlTextReader* reader = new XmlTextReader(filestreamSource);
//Read the first part of the XML document
while(reader->Read())
{
	//Display the elements and stop reading on the part1 endelement tag
	//then go to ReadPart2 to start another reader to read the rest of the file.
	switch(reader->NodeType)
	{
	case XmlNodeType::Element:
	    Console::WriteLine(S"Name: {0}", reader->Name);
	    Console::WriteLine(S"  Prefix: {0}", reader->Prefix);
	    Console::WriteLine(S"  LocalName: {0}", reader->LocalName);
	    Console::WriteLine(S"  Namespace: {0}", reader->NamespaceURI);
	    break;
	case XmlNodeType::EndElement:
	    //Stop reading at end element for element with localname equal to part1
	    if (String::Equals(S"part1",reader->LocalName))
	    {
	        Console::WriteLine(S"End reading part 1...");
	        Console::WriteLine();
	        goto ReadPart2;
	    }
	    break;
	}
}
//Read the rest of the XML document
ReadPart2:
Console::WriteLine(S"Begin reading part 2...");
//Create an XmlNamespaceManager and add the namespaces for the document.
XmlNamespaceManager* nsmanager = new XmlNamespaceManager(reader->NameTable);
//Set default namespace--first param is null.
nsmanager->AddNamespace(String::Empty, S"http://tempuri.org/mydefaultnamespace");
nsmanager->AddNamespace(S"myns", "http://tempuri.org/mynamespace");
nsmanager->AddNamespace(S"yourns", "http://tempuri.org/yournamespace");
XmlParserContext* pc = new XmlParserContext(reader->NameTable, nsmanager, reader->XmlLang, XmlSpace::Default);

// Reset the filestream to beginning of the source stream
filestreamSource->Seek(0, SeekOrigin::Begin);

XmlTextReader* reader2 = new XmlTextReader(filestreamSource, XmlNodeType::Element, pc);

while(reader2->Read())
{
switch (reader2->NodeType)
{
case XmlNodeType::Element:
    Console::WriteLine(S"Element Name: {0}", reader2->Name);
    Console::WriteLine(S"  Prefix: {0}", reader2->Prefix);
    Console::WriteLine(S"  LocalName: {0}", reader2->LocalName);
    Console::WriteLine(S"  Namespace: {0}", reader2->NamespaceURI);
    break;
case XmlNodeType::EndElement:
    //Stop reading at end element for element with localname equal to part2
    if (String::Equals(S"part2",reader2->LocalName))
    {
        Console::WriteLine(S"End reading part 2...");
        goto Done;
    }
    break;
}
}

Done:
Console::WriteLine(S"Done.");
reader->Close();
</Tab>
</Acme:TabControl>

<p>

<H4>Summary</H4>
<OL>
<LI>The XmlTextReader classes derived from XmlReader can be constructed using a string or stream containing an XML document fragment, such as a string or stream that has been partially read by another XmlReader.
<LI>The XmlParserContext class provides all the required context information needed to start an XML parser up at any random point within an XML document. This enables the XmlTextReader to read XML fragments.
</OL>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->



































































































