<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Save XML with the XmlDocument (W3C DOM)?</h4>

<p>
This sample illustrates how to update and save XML using the XmlDocument class, which is an implementation of the World Wide Web Consortium (W3C) Document Object Model (DOM).
<p>
This sample follows on from <a href="DOMInterfaceXmlDocument.aspx">How do I...Load and use the XmlDocument?</a>.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SaveXmlDocument/CS/SaveXmlDocument.aspx"
ViewSource="/quickstart/howto/samples/Xml/SaveXmlDocument/SaveXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# SaveXmlDocument.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SaveXmlDocument/VB/SaveXmlDocument.aspx"
ViewSource="/quickstart/howto/samples/Xml/SaveXmlDocument/SaveXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="VB SaveXmlDocument.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SaveXmlDocument/CP"
ViewSource="/quickstart/howto/samples/Xml/SaveXmlDocument/SaveXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ SaveXmlDocument.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The XmlDocument class has a Save method that provides XmlDocument the ability to save XML data to files, streams, and XmlWriters.
<p>
This sample application, as shown in the following code, navigates over the file, <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/SaveXmlDocument/cs/&file=books.xml">books.xml</a>, in order to increase all the books prices by 2%. The application then saves the XML to a new file called <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/SaveXmlDocument/cs/&file=updatebooks.xml">updatebooks.xml</a>.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public void Run(String[] args)
{
    try
    {
        // Create XmlDocument and load the XML from file
        XmlDocument myXmlDocument = new XmlDocument();
        myXmlDocument.Load (new XmlTextReader (args[0]));
        Console.WriteLine ("XmlDocument loaded with XML data successfully ...");
        Console.WriteLine();

        IncreasePrice(myXmlDocument.DocumentElement);

        // Write out data as XML
        myXmlDocument.Save(args[1]);
        Console.WriteLine();
        Console.WriteLine("Updated prices saved in file {0}", args[1]);
    }
    catch (Exception e)
    {
        Console.WriteLine ("Exception: {0}", e.ToString());
    }
}
</Tab>
<Tab Name="VB">
public sub Run(args As String())
    try
        ' Create an XmlDocument
        Dim myXmlDocument as XmlDocument = new XmlDocument()
        myXmlDocument.Load (args(0))
        Console.WriteLine ("XmlDocument loaded with XML data successfully ...")
        Console.WriteLine()

        IncreasePrice(myXmlDocument.DocumentElement)

        ' Write out data as XML
        myXmlDocument.Save(args(1))
        Console.WriteLine()
        Console.WriteLine("Updated prices saved in file {0}", args(1))

    catch e as Exception
        Console.WriteLine ("Exception: {0}", e.ToString())
    end try
end sub
</Tab>
<Tab Name="C++">
void Run(String* args[])
{
	try
	{
	    // Create XmlDocument and load the XML from file
	    XmlDocument* myXmlDocument = new XmlDocument();
	    myXmlDocument->Load (new XmlTextReader (args[0]));
	    Console::WriteLine (S"XmlDocument loaded with XML data successfully ...");
	    Console::WriteLine();
	
	    IncreasePrice(myXmlDocument->DocumentElement);
	
	    // Write out data as XML
	    myXmlDocument->Save(args[1]);
	    Console::WriteLine();
	    Console::WriteLine(S"Updated prices saved in file {0}", args[1]);
	}
	catch (Exception* e)
	{
	    Console::WriteLine (S"Exception: {0}", e->ToString());
	}
}
</Tab>
</Acme:TabControl>

<p>
The IncreasePrice method recursively iterates over the XML document using the FirstChild method of the XmlNode class to move down the tree. This method returns a null value if there are no child nodes. The NextSibling property moves to the node immediately next to the current node returning a null value if there is no node to which to move. Every time the application finds a node named price, the application updates the price. The following code shows how the IncreasePrice method works.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public void IncreasePrice(XmlNode node)
{
    if (node.Name == "price")
    {
        node = node.FirstChild;
        Decimal price = Decimal.Parse(node.Value);
        // Increase all the book prices by 2%
        String newprice = ((Decimal)price*(new Decimal(1.02))).ToString("#.00");
        Console.WriteLine("Old Price = " + node.Value + "\tNew price = " + newprice);
        node.Value = newprice;
    }

    node = node.FirstChild;
    while (node != null)
    {
        IncreasePrice(node);
        node = node.NextSibling;
    }
}
</Tab>
<Tab Name="VB">
public sub IncreasePrice(node as XmlNode)
    if (node.Name = "price")

        node = node.FirstChild
        Dim price as Decimal
        price = System.Decimal.Parse(node.Value)

        ' Increase all the book prices by 2%
        Dim newprice as String
        newprice = CType(price*(new Decimal(1.02)), Decimal).ToString("#.00")
        Console.WriteLine("Old Price = " & node.Value & Strings.chr(9) & "New price = " & newprice)
        node.Value = newprice
    end if

    node = node.FirstChild
    While Not node Is Nothing
        IncreasePrice(node)
        node = node.NextSibling
    end while
end sub
</Tab>
<Tab Name="C++">
void IncreasePrice(XmlNode* node)
{
	if (node->Name == S"price")
	{
	    node = node->FirstChild;
	    Decimal price = Decimal::Parse(node->Value);
	    // Increase all the book prices by 2%
	    String* newprice = String::Format(S"{0:c}",__box(price * 1.02));
	    Console::WriteLine(String::Concat(S"Old Price = ", node->Value, S"\tNew price = ", newprice));
	    node->Value = newprice;
	}
	
	node = node->FirstChild;
	while (node != 0)
	{
	    IncreasePrice(node);
	    node = node->NextSibling;
	}
}
</Tab>
</Acme:TabControl>

<div class="code"><pre>
XmlDocument loaded with XML data successfully ...

Old Price = 8.99        New price = 9.17
Old Price = 11.99       New price = 12.23
Old Price = 9.99        New price = 10.19

Updated prices saved in file updatebooks.xml
</pre></div>

<H4>Summary</H4>
<OL>
<LI>The XmlDocument class can save XML to a file, stream, or an XmlWriter.
<LI>The XmlNode class enables you to navigate and amend the nodes within an XML document.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
