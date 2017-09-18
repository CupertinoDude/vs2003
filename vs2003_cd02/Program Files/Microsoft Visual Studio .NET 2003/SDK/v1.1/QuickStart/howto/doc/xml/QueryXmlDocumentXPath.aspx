<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" --><h4>How Do I...Query XML with an XPath expression?</h4>

<p>
This sample illustrates how to query an XPathDocument with an <A href="http://www.w3.org/TR/xpath">W3C XML Path Language (XPath)</A> expression supplied to the XPathNavigator class. The XPathNavigator class is only for read-only XPath queries over a document and, for Extensible Stylesheet Language Transformations (XSLT) processing, is implemented by the XslTransform class. For XSLT, an XPathNavigator does not need to be created.
<p>
Note: XPath is the W3C's general query language specification for addressing parts of an XML document. The .NET Framework implementation of XPath conforms to the World Wide Web Consortium (W3C) XML Path Language (XPath) Version 1.0 specification.
<p>
For fast, high-performance XML document processing using XSLT, use the XPathDocument class. You can think of the XPathDocument class as similar to the XML DOM, but highly optimized for XSLT processing and the XPath data model. However, unlike the W3C XML DOM classes, the XPathDocument class does not maintain node identity, nor does it do all the rule and validation checking required by the DOM classes.
<p>
You can also perform XPath queries against an XmlDocument or XmlDataDocument class. If you use one of these two classes, then you need to use the SelectNodes and SelectSingleNode methods of the XmlNode class.

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/CS/QueryXmlDocumentXPath.aspx"
ViewSource="/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/QueryXmlDocumentXPath.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# QueryXmlDocumentXPath.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/QueryXmlDocumentXPath.src"
RunSample="/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/VB/QueryXmlDocumentXPath.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB QueryXmlDocumentXPath.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/QueryXmlDocumentXPath.src"
RunSample="/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ QueryXmlDocumentXPath.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
This sample loads an XPathDocument with the sample file, <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/cs/&file=books.xml">books.xml</a>. The sample then passes XPath expressions to the XPathQuery function. The first XPath expression to be passed selects all the price nodes for all the book element nodes starting from the root node. The second XPath expression gets the text for the ISBN attribute node associated with the last book element node starting from the root node.
<p>
To select nodes that match the given XPath expression, the XPathQuery function uses the Select method of XPathNavigator. The function then creates an XPathNodeIterator, and uses this iterator to repeatedly locate a node and print that node to the screen.
<p>
Note: As the XPathNodeIterator represents an XPath node-set, the XPathNodeIterator supports operations on this node-set.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private const String localURL = "http://localhost/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/cs/books.xml";

public static void Main()
{
    QueryXmlDocumentXPathSample myQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample();
    myQueryXmlDocumentXPathSample.Run(localURL);
}

public void Run(String args)
{
    Console.WriteLine("XPath Test started ...");

    XPathDocument myXPathDocument = new XPathDocument(args);
    XPathNavigator myXPathNavigator = myXPathDocument.CreateNavigator();

    // Get all the book prices
    XPathQuery(myXPathNavigator, "descendant::book/price");

    // Get the ISBN of the last book
    XPathQuery(myXPathNavigator, "bookstore/book[3]/@ISBN");
}

private void XPathQuery(XPathNavigator myXPathNavigator, String xpathexpr )
{
    try
    {
        Console.WriteLine("XPath query: " + xpathexpr);

        // Create a node interator to select nodes and move through them (read-only)
        XPathNodeIterator myXPathNodeIterator =  myXPathNavigator.Select (xpathexpr);

        while (myXPathNodeIterator.MoveNext())
        {
            Console.WriteLine("<" + myXPathNodeIterator.Current.Name + "> " + myXPathNodeIterator.Current.Value);
        }
        Console.WriteLine();
    }
    catch (Exception e)
    {
        Console.WriteLine ("Exception: {0}", e.ToString());
    }
}
</Tab>
<Tab Name="VB">
private const localURL as String = "http://localhost/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/cs/books.xml"

Shared sub Main
    Dim myQueryXmlDocumentXPathSample as QueryXmlDocumentXPathSample
    myQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample()
    myQueryXmlDocumentXPathSample.Run(localURL)
end sub

public sub Run(args as String)
    Console.WriteLine("XPath Test started ...")

    Dim myXPathDocument as XPathDocument = new XPathDocument(args)
    Dim myXPathNavigator as XPathNavigator = myXPathDocument.CreateNavigator()

    ' Get all the book prices
    XPathQuery(myXPathNavigator, "descendant::book/price")

    ' Get the ISBN of the last book
    XPathQuery(myXPathNavigator, "bookstore/book[3]/@ISBN")
end sub

private sub XPathQuery(myXPathNavigator as XPathNavigator, xpathexpr as String )

    try
        Console.WriteLine("XPath query: " + xpathexpr)

        ' Create a node interator to select nodes and move through them (read-only)
        Dim myXPathNodeIterator as XPathNodeIterator  =  myXPathNavigator.Select (xpathexpr)

        while (myXPathNodeIterator.MoveNext())
            Console.WriteLine("<" & myXPathNodeIterator.Current.Name + "> " & myXPathNodeIterator.Current.Value)
        end while

        Console.WriteLine()
    catch e as Exception
        Console.WriteLine ("Exception: {0}", e.ToString())
    end try
end sub
</Tab>
<Tab Name="C++">
protected:
    static String *localURL = S"http://localhost/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/cs/books.xml";

public: 
    void Main()
    {
        QueryXmlDocumentXPathSample* myQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample();
        myQueryXmlDocumentXPathSample->Run(localURL);
    }

    void Run(String* args)
    {
        Console::WriteLine(S"XPath Test started ...");
   
        XPathDocument* myXPathDocument = new XPathDocument(args);
        XPathNavigator* myXPathNavigator = myXPathDocument->CreateNavigator();

        // Get all the book prices
        XPathQuery(myXPathNavigator, S"descendant::book/price");

        // Get the ISBN of the last book
        XPathQuery(myXPathNavigator, S"bookstore/book[3]/@ISBN");
    }

private:
    void XPathQuery(XPathNavigator* myXPathNavigator, String* xpathexpr )
    {
        try
        {
            Console::WriteLine(S"XPath query: {0}", xpathexpr);

            // Create a node interator to select nodes and move through them (read-only)
            XPathNodeIterator* myXPathNodeIterator =  myXPathNavigator->Select (xpathexpr);

            while (myXPathNodeIterator->MoveNext())
            {
                Console::WriteLine(String::Concat(S"<", myXPathNodeIterator->Current->Name, S"> ", myXPathNodeIterator->Current->Value));
            }

            Console::WriteLine();

        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }
    
};
</Tab>
</Acme:TabControl>

<p>
The first query selects all the 'price' nodes for all the books starting from the root node. The second query gets the 'ISBN' attribute text
for the last book element node starting from the root node.
<p>
The query can also be performed using an  XPathExpression  class . There are two main  reasons for using the XPathExpression  class  over using the string expression in the  S elect method (on the XPathNavigator) :<br>
 1)  The expression is compiled only once and can be reused several times thus improving performance<br>
 2)   Prefixes (s) used in the  XPath expression can be  bound to a namespace  using a XmlNamespaceManager  class  -  this allows for prefixed XPath expressions when selecting a set of nodes.<br>
The following code conveys the general usage  which selects all the book whose ISBN attribute are in the urn:samples namespace. <br>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// compile the expression
XPathExpression expr = nav.Compile("book/@mybk:ISBN");
// set namespace(s) used in the expression
XmlNamespaceManager mngr = new XmlNamespaceManager(new NameTable());
mngr.AddNamespace("mybk","urn:samples");
expr.SetContext(mngr);
// select the nodes
XPathNodeIterator myXPathNodeIterator = nav.Select(expr);
</Tab>
<Tab Name="VB">
' compile the expression
Dim expr as XPathExpression = nav.Compile("book/@mybk:ISBN")
' set namespace(s) used in the expression
Dim mngr as XmlNamespaceManager = new XmlNamespaceManager(new NameTable())
mngr.AddNamespace("mybk","urn:samples")
expr.SetContext(mngr)
' select the nodes
Dim myXPathNodeIterator as XPathNodeIterator = nav.Select(expr)
</Tab>
<Tab Name="C++">
// Create a node interator to select nodes and move through them (read-only)
XPathNodeIterator* myXPathNodeIterator =  myXPathNavigator->Select (xpathexpr);
</Tab>
</Acme:TabControl>
<p>If your XML includes a default namespace, you must use still use the SetContext method and provide a XmlNamespaceManager containing a prefix and namespace URI to handle the default namespace. For more information on using the XmlNamespaceManager, please refer to the "XmlNameSpace Manager & NameTable" topic."
<p>
<H4>Summary</H4>
<OL>
<LI>To query an XPathDocument, XmlDataDocument, or XmlDocument, you can supply an XPath expression to an XPathNavigator class.
<LI>The XPathNavigator class is only for read-only XPath queries over an XML document.
<LI>The XPathDocument class provides a fast, high-performance oriented cache for XML document processing using XSLT.
</OL>

<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->




























