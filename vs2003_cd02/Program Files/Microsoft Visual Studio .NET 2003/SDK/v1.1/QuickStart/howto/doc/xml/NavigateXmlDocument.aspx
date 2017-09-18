<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Navigate XML with the XPathNavigator?</h4>

<p>
This sample illustrates how to navigate XML documents with an XPathNavigator created from an XPathDocument. It also demonstrates how to use an XPathNodeIterator. The XPathNavigator class provides a cursor-style model to navigate an XML document. This topic also introduces XML Path Language (XPath) expressions with more detail added in <a href="QueryXmlDocumentXPath.aspx">How Do I...Query XML with an XPath expression?</a>.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/NavigateXmlDocument/CS/NavigateXmlDocument.aspx"
ViewSource="/quickstart/howto/samples/Xml/NavigateXmlDocument/NavigateXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# NavigateXmlDocument.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/NavigateXmlDocument/NavigateXmlDocument.src"
RunSample="/quickstart/howto/samples/Xml/NavigateXmlDocument/VB/NavigateXmlDocument.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB NavigateXmlDocument.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/NavigateXmlDocument/NavigateXmlDocument.src"
RunSample="/quickstart/howto/samples/Xml/NavigateXmlDocument/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ NavigateXmlDocument.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
This sample loads an XPathDocument with the XML data found in <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/NavigateXmlDocument/cs/&file=books.xml">books.xml</a>, creates an XPathNavigator as a view onto the data, and then displays the XML by moving through the document. The XPathNavigator class provides an XPath API over data such as the XPathDocument. The following sample code shows the creation of these classes.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XPathDocument myXPathDocument = new XPathDocument(args);
...
//Create an XPathNavigator
XPathNavigator myXPathNavigator = myXPathDocument.CreateNavigator();
</Tab>
<Tab Name="VB">
Dim myXPathDocument as XPathDocument = new XPathDocument(args)
...
' Create an XPathNavigator
Dim myXPathNavigator as XPathNavigator  = myXPathDocument.CreateNavigator()
</Tab>
<Tab Name="C++">
XPathDocument* myXPathDocument = new XPathDocument(args);
...
//Create an XPathNavigator
XPathNavigator* myXPathNavigator = myXPathDocument->CreateNavigator();
</Tab>
</Acme:TabControl>

<p>
The XPathNavigator enables you to move through both the attributes nodes and the namespace nodes in an XML document.
<p>
The methods and properties of the XPathNavigator operate in relation to the current node:

<ul>
<li>The MoveToFirstChild method moves to the first child of the current node.
<li>The MoveToParent method moves to the parent node of the current node. When positioned on an attribute, you must use the MoveToParent method to move to the element that owns the attribute node. This is how you get back to the element after navigating through its attributes using MoveToFirstAttribute and MoveToNextAttribute.
<li>The HasChildren property indicates whether the current node has child nodes.
<li>The HasAttributes property indicates whether the current node has attribute nodes.
<li>The MoveToRoot method sets the navigator to the document node that contains the whole tree of nodes.
</ul>

<p>
These methods enable you to navigate the XML document in a recursive fashion as illustrated in the following code.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
myXPathNavigator.MoveToRoot(); // Initialize the myXPathNavigator to start at the root
DisplayTree(myXPathNavigator); // Display all the nodes
...
// Walks the XPathNavigator tree recursively
public void DisplayTree (XPathNavigator myXPathNavigator)
{
    if (myXPathNavigator.HasChildren)
    {
        myXPathNavigator.MoveToFirstChild();

        Format (myXPathNavigator);
        DisplayTree (myXPathNavigator);

        myXPathNavigator.MoveToParent();
    }
    while (myXPathNavigator.MoveToNext())
    {
        Format (myXPathNavigator);
        DisplayTree (myXPathNavigator);
    }
}

// Format the output
private void Format (XPathNavigator myXPathNavigator)
{
    if (!myXPathNavigator.HasChildren)
    {
        if (myXPathNavigator.NodeType == XPathNodeType.Text)
            Console.WriteLine(myXPathNavigator.Value );
        else if (myXPathNavigator.Name != String.Empty)
            Console.WriteLine("<" + myXPathNavigator.Name + ">");
        else
            Console.WriteLine();
    }
    else
    {
        Console.WriteLine("<" + myXPathNavigator.Name + ">");

        // Show the attributes if there are any
        if (myXPathNavigator.HasAttributes)
        {
            Console.WriteLine("Attributes of <" + myXPathNavigator.Name + ">");

            while (myXPathNavigator.MoveToNextAttribute())
                Console.Write("<" + myXPathNavigator.Name + "> " + myXPathNavigator.Value + " ");

            // Return to the 'Parent' node of the attributes
            myXPathNavigator.MoveToParent();
        }
    }
}
</Tab>
<Tab Name="VB">
myXPathNavigator.MoveToRoot() ' Initialise the myXPathNavigator to start at the root
DisplayTree(myXPathNavigator) ' Display all the nodes
...
' Walks the XPathNavigator tree recursively
public sub DisplayTree (myXPathNavigator as XPathNavigator )

    if (myXPathNavigator.HasChildren)
        myXPathNavigator.MoveToFirstChild()

        Format (myXPathNavigator)
        DisplayTree (myXPathNavigator)

        myXPathNavigator.MoveToParent()
    end if

    while (myXPathNavigator.MoveToNext())
        Format (myXPathNavigator)
        DisplayTree (myXPathNavigator)
    end while
end sub

' Format the output
private sub Format (myXPathNavigator as XPathNavigator )
    if Not (myXPathNavigator.HasChildren)
        if (myXPathNavigator.NodeType = XPathNodeType.Text)
            Console.WriteLine(myXPathNavigator.Value )
        elseif (myXPathNavigator.Name <> String.Empty)
            Console.WriteLine("<" & myXPathNavigator.Name & ">")
        else
            Console.WriteLine()
        end if

    else
        Console.WriteLine("<" & myXPathNavigator.Name & ">")

        ' Show the attributes if there are any
        if (myXPathNavigator.HasAttributes)
            Console.WriteLine("Attributes of <" & myXPathNavigator.Name & ">")

            while (myXPathNavigator.MoveToNextAttribute())
                Console.Write("<" + myXPathNavigator.Name + "> " + myXPathNavigator.Value + " ")
            end while

            ' Return to the 'Parent' node of the attributes
            myXPathNavigator.MoveToParent()
        end if
    end if
end sub
</Tab>
<Tab Name="C++">
// Walks the XPathNavigator tree recursively 
void DisplayTree (XPathNavigator* myXPathNavigator)
{
if (myXPathNavigator->HasChildren)
{
    myXPathNavigator->MoveToFirstChild();

    Format (myXPathNavigator);
    DisplayTree (myXPathNavigator); 

    myXPathNavigator->MoveToParent();
}
while (myXPathNavigator->MoveToNext())
{
    Format (myXPathNavigator);
    DisplayTree (myXPathNavigator); 
}
}

// Format the output
private:
void Format (XPathNavigator* myXPathNavigator)
{
if (!myXPathNavigator->HasChildren)
{
    if (myXPathNavigator->NodeType == XPathNodeType::Text)
        Console::WriteLine(myXPathNavigator->Value );
    else if (myXPathNavigator->Name != String::Empty)
        Console::WriteLine(String::Concat(S"<", myXPathNavigator->Name, S">"));
    else 
        Console::WriteLine();
}
else
{
    String* element = myXPathNavigator->Name;
    Console::WriteLine(String::Concat(S"<", element, S">"));

    // Show the attributes if there are any
    if (myXPathNavigator->MoveToFirstAttribute())
    {
        Console::Write(S"Attributes of <{0}> :", element);
            
        Console::Write(S"{0}=", myXPathNavigator->Name);
        Console::Write(S"{0} ", myXPathNavigator->ToString());

        while (myXPathNavigator->MoveToNextAttribute())
        {
            Console::Write(S"{0}=", myXPathNavigator->Name);
            Console::Write(S"{0} ", myXPathNavigator->ToString());
        }
        
        Console::WriteLine("");
    }
}
// Return to the 'Parent' node of the attributes
//myXPathNavigator->MoveToParent();
}
</Tab>
</Acme:TabControl>

<p>
If you know the structure of the XML document, then you can navigate by explicitly moving through the document from node to node. The following code finds the price of the first book node in the sample file, books.xml.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Find the price of the first book. Start at the root node
Console.WriteLine ();
Console.WriteLine ("Find the price of the first book by navigating nodes ...");
myXPathNavigator.MoveToRoot();
DisplayNode (true, myXPathNavigator); // root node
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // ?xml version='1.0'? node
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator); //!-- This file ... node
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator); // bookstore element
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // book element
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // title element
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator);// author element
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator); // price Element
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator); // value of price element
...
private void DisplayNode(Boolean success, XPathNavigator myXPathNavigator)
{
    if (success && (myXPathNavigator.NodeType == XPathNodeType.Text))
        Console.WriteLine(myXPathNavigator.Value );
    else if (success && (myXPathNavigator.Name != String.Empty))
        Console.WriteLine("<" + myXPathNavigator.Name + ">");
    else
        Console.WriteLine();
}

</Tab>
<Tab Name="VB">
'Find the price of the first book. Start at the root node
Console.WriteLine ()
Console.WriteLine ("Find the price of the first book by navigating nodes ...")
myXPathNavigator.MoveToRoot()
DisplayNode (true, myXPathNavigator) ' root node
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' ?xml version='1.0'? node
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator) '!-- This file ... node
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator) ' bookstore element
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' book element
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' title element
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator)' author element
DisplayNode (myXPathNavigator.MoveToNext(), myXPathNavigator) ' price Element
DisplayNode (myXPathNavigator.MoveToFirstChild(), myXPathNavigator) ' value of price element
...
private sub DisplayNode(success as Boolean, myXPathNavigator as XPathNavigator )

    if (success and (myXPathNavigator.NodeType = XPathNodeType.Text))
        Console.WriteLine(myXPathNavigator.Value)
    else if (success and (myXPathNavigator.Name <> String.Empty))
        Console.WriteLine("<" & myXPathNavigator.Name & ">")
    else
        Console.WriteLine()
    end if
end sub
</Tab>
<Tab Name="C++">
// Find the price of the first book. Start at the root node
Console::WriteLine ();
Console::WriteLine (S"Find the price of the first book by navigating nodes ...");
myXPathNavigator->MoveToRoot();
DisplayNode (true, myXPathNavigator); // root node
DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // ?xml version='1.0'? node
DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator); //!-- This file ... node
DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator); // bookstore element
DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // book element
DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // title element
DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator);// author element
DisplayNode (myXPathNavigator->MoveToNext(), myXPathNavigator); // price Element
DisplayNode (myXPathNavigator->MoveToFirstChild(), myXPathNavigator); // value of price element
...
void DisplayNode(Boolean success, XPathNavigator* myXPathNavigator)
{
 if (success && (myXPathNavigator->NodeType == XPathNodeType::Text))
    Console::WriteLine(myXPathNavigator->Value );
 else if (success && (myXPathNavigator->Name != String::Empty))
    Console::WriteLine(String::Concat(S"<", myXPathNavigator->Name, S">"));
 else
    Console::WriteLine();
}

</Tab>
</Acme:TabControl>

<p>
This following code illustrates one of the most powerful features of the XPathNavigator-its ability to create a set of selected nodes from an XPath expression using the Select method. XPath is a language that provides filtering and addressing of data in an XML document and is another approach to retrieving a set of nodes. An XPathNavigator can apply an XPath expression and generate a set of nodes that correspond to the selected expresion. You can then navigate this node-set independently since these nodes are returned to an XPathNodeIterator whose MoveNext method allows read-only navigation over the selected node tree. The following code example selects and displays the title child node of each book node in the sample file, books.xml.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XPathNodeIterator myXPathNodeIterator = myXPathNavigator.Select("descendant::book/title");

while(myXPathNodeIterator.MoveNext())
{
    Console.WriteLine("<" + myXPathNodeIterator.Current.Name + ">" + myXPathNodeIterator.Current.Value);
};
</Tab>
<Tab Name="VB">
Dim myXPathNodeIterator as XPathNodeIterator  = myXPathNavigator.Select("descendant::book/title")

while(myXPathNodeIterator.MoveNext())
    Console.WriteLine("<" & myXPathNodeIterator.Current.Name & ">" & myXPathNodeIterator.Current.Value)
end while
</Tab>
<Tab Name="C++">
XPathNodeIterator* myXPathNodeIterator = myXPathNavigator->Select("descendant::book/title");

while(myXPathNodeIterator->MoveNext())
{
 Console::WriteLine(String::Concat(S"<", myXPathNodeIterator->Current->Name, S">", myXPathNodeIterator->Current->Value));
};
</Tab>
</Acme:TabControl>
<p>

<H4>Summary</H4>
<OL>
<LI>The XPathNavigator class provides a cursor-style model to navigate an XML document in memory.
<LI>The XPathNavigator class provides an XPath API over data, such as the XPathDocument.
<LI>The XPathNavigator enables you to move through both the attributes nodes and namespace nodes in an XML document.
</OL>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->


































