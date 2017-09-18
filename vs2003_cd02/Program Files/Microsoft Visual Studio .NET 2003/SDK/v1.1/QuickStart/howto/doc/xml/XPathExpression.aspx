<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Use an XPathExpression class?</h4>

This sample illustrates how to use an XPathExpression class to compile an XML Path Language (XPath) expression to select a node-set from an XML file. Then the sample demonstrates how to add a custom sort routine and use an XPathExpression to sort the elements returned by the compiled XPath. Finally, it also demonstrates how to use Extensible Stylesheet Language Transformations (XSLT) parameters for sorting with the reuse of a compiled XPath.
<p>
This sample uses the XPathNavigator class that provides cursor-style navigation over an XPathDocument. This sample also uses the XPathExpression class that represents a compiled XPath expression. This XPathExpression class is returned from the Compile method of XPathNavigator and is supplied to the Select, Evaluate, and Matches methods.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/XPathExpression/CS/XPathExpression.aspx"
ViewSource="/quickstart/howto/samples/Xml/XPathExpression/XPathExpression.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# XPathExpression.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XPathExpression/XPathExpression.src"
RunSample="/quickstart/howto/samples/Xml/XPathExpression/VB/XPathExpression.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB XPathExpression.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XPathExpression/XPathExpression.src"
RunSample="/quickstart/howto/samples/Xml/XPathExpression/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ XPathExpression.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
First, the sample compiles an XPath expression to select a node-set from an XML file. To do this, the sample begins by creating an XPathDocument and loading the books.xml file into that object. Then, the sample creates an XPathNavigator from the XPathDocument. The sample uses the XPathNavigator object to move over the document using XPathNodeIterator.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XPathDocument myXPathDocument = new XPathDocument(args);

//Create an XPathNavigator
XPathNavigator myXPathNavigator = myXPathDocument.CreateNavigator();
</Tab>
<Tab Name="VB">
Dim myXPathDocument as XPathDocument  = new XPathDocument(args)

' Create an XPathNavigator
Dim myXPathNavigator as XPathNavigator  = myXPathDocument.CreateNavigator()
</Tab>
<Tab Name="C++">
XPathDocument* myXPathDocument = new XPathDocument(args);

//Create an XPathNavigator
XPathNavigator* myXPathNavigator =  myXPathDocument->CreateNavigator();
</Tab>
</Acme:TabControl>

<p>
After creating an XPath expression that selects the book elements of the XPathDocument, the sample compile the expression into the XPathNavigator and then uses a Select method to execute the XPath expression. The sample displays the resulting XML data using the FormatXml function. By passing an XPathNodeIterator to this function, the function is able to consecutively select each node for formatting.

<p>
<Acme:TabControl runat="server" ID=TabControl2>
<Tab Name="C#">
// Get the Book elements
selectExpr = "bookstore/book";
...
// Ensure we are at the root node
myXPathNavigator.MoveToRoot();

myXPathExpr = myXPathNavigator.Compile(selectExpr);
...
// Create an XPathNodeIterator to walk over the selected nodes
XPathNodeIterator myXPathNodeIterator = myXPathNavigator.Select (myXPathExpr);

FormatXml(myXPathNodeIterator);
</Tab>
<Tab Name="VB">
' Get the Book elements
selectExpr = "bookstore/book"

Console.WriteLine("XPath query: " + selectExpr)

' Ensure we are at the root node
myXPathNavigator.MoveToRoot()

myXPathExpr = myXPathNavigator.Compile(selectExpr)
...
' Create an XPathNodeIterator to walk over the selected nodes
Dim myXPathNodeIterator as XPathNodeIterator  = myXPathNavigator.Select (myXPathExpr)

FormatXml(myXPathNodeIterator)

</Tab>
<Tab Name="C++">
// Get the Book elements
selectExpr = S"bookstore/book";
...
// Ensure we are at the root node
myXPathNavigator->MoveToRoot();

myXPathExpr = myXPathNavigator->Compile(selectExpr);
...
// Create an XPathNodeIterator to walk over the selected nodes
XPathNodeIterator* myXPathNodeIterator = myXPathNavigator->Select (myXPathExpr);

FormatXml(myXPathNodeIterator);
</Tab>
</Acme:TabControl>
<p>
The second part of this sample shows how to use an XPath expression to sort a node-set.

<p>
This second section uses the same compiled XPathExpression used in the first part of the sample to select the book elements. However, the code in the second part adds a custom sort routine to sort the results by the attribute value for the ISBN attribute. The sample then displays the resulting XML using the FormatXml function and an XPathNodeIterator.

<p>
The AddSort method of an XPathExpression supports a generic sort functionality that the XSLT processor applies to nodes in the node-set. This sorting occurs through the IComparer interface. This interface provides an implementation of the Compare method that compares the objects on their data type.

<p>
<Acme:TabControl runat="server" ID=TabControl1>
<Tab Name="C#">
// Create comparision class for the ISBN number
ISBNCompare myISBNCompare = new ISBNCompare();

// Add a comparer to do a string compare on the ISBN number
myXPathExpr.AddSort("@ISBN", (IComparer)myISBNCompare);

myXPathNodeIterator = myXPathNavigator.Select (myXPathExpr);

FormatXml(myXPathNodeIterator);
</Tab>
<Tab Name="VB">
' Create comparision class for the ISBN number
Dim myISBNCompare as ISBNCompare  = new ISBNCompare()

' Add a comparer to do a string compare on the ISBN number
myXPathExpr.AddSort("@ISBN", myISBNCompare)

myXPathNodeIterator = myXPathNavigator.Select (myXPathExpr)

FormatXml(myXPathNodeIterator)
</Tab>
<Tab Name="C++">
// Create comparision class for the ISBN number
ISBNCompare* myISBNCompare = new ISBNCompare();

// Add a comparer to do a string compare on the ISBN number
myXPathExpr->AddSort(S"@ISBN", myISBNCompare);

myXPathNodeIterator = myXPathNavigator->Select (myXPathExpr);

FormatXml(myXPathNodeIterator);
</Tab>
</Acme:TabControl>

<p>
To demonstrate the last part of this sample where sorting is through XSLT parameters, there is a custom sort routine that uses the AddSort method of the XPathExpression to implement a new IComparer routine. By providing this custom sort capability, you are able to sort user-defined classes. This is useful for data that cannot be easily compared, like a string for example.

<p>
<Acme:TabControl runat="server" ID=TabControl5>
<Tab Name="C#">
public class ISBNCompare : IComparer
{
    public int Compare( Object First, Object Second )
    {
        String s1 = (String) First;
        String s2 = (String) Second;

        //Console.WriteLine("ISBN's to Compare: 1. {0} 2. {1}", s1, s2);
        return String.Compare(s1.ToString(), s2.ToString(), true, CultureInfo.InvariantCulture);
    }
}// End class ISBNCompare</Tab>
<Tab Name="VB">
public Class ISBNCompare : Implements IComparer
    'Use a function name other than 'Compare'
    Function MyCompare( First As Object, Second As Object ) As Integer Implements IComparer.Compare
        Dim s1 as String  = CStr(First)
        Dim s2 as String  = CStr(Second)

        'Console.WriteLine("ISBN's to Compare: 1. {0} 2. {1}", s1, s2);
        return String.Compare(s1.ToString(), s2.ToString(), True, CultureInfo.InvariantCulture)
    end function
end Class 'ISBNCompare
</Tab>
<Tab Name="C++">
public:
    int Compare( Object* First, Object* Second ) 
    {
        Console::WriteLine(S"ISBN's to Compare: 1. {0} 2. {1}", First->ToString(), Second->ToString ());
        return String::Compare(First->ToString(), Second->ToString(), true, CultureInfo::InvariantCulture);
    }
};// End class ISBNCompare</Tab>
</Acme:TabControl>
<p>
The sample then creates a second XPathNavigator on the XPathDocument and adds a sort based on an XSLT parameter to the XPathExpression.

<p>
The XPathExpression supports the <xsl:sort> functionality and adds the specified sort criteria to the XPath. Upon calling the XPathExpression, the XSLT processor sorts the nodes in the node-set according to the supplied values. Typically, you use the sort method through the <xsl:sort> element in an XSLT file.

<p>
<Acme:TabControl runat="server" ID=TabControl3>
<Tab Name="C#">
// Create Second XPathNavigator
XPathNavigator myXPathNavigator2 = myXPathDocument.CreateNavigator();

// Ensure we are at the root node
myXPathNavigator2.MoveToRoot();
myXPathExpr = myXPathNavigator2.Compile(selectExpr);
...
// Add an XSLT based sort
myXPathExpr.AddSort("@publicationdate", XmlSortOrder.Descending, XmlCaseOrder.None, "", XmlDataType.Text);

myXPathNodeIterator = myXPathNavigator2.Select (myXPathExpr);

FormatXml(myXPathNodeIterator);
</Tab>
<Tab Name="VB">
' Create Second XPathNavigator
Dim myXPathNavigator2 as XPathNavigator  = myXPathDocument.CreateNavigator()

' Ensure we are at the root node
myXPathNavigator2.MoveToRoot()
myXPathExpr = myXPathNavigator2.Compile(selectExpr)
...
' Add an XSLT based sort
myXPathExpr.AddSort("@publicationdate", XmlSortOrder.Descending, XmlCaseOrder.None, "", XmlDataType.Text)

myXPathNodeIterator = myXPathNavigator2.Select (myXPathExpr)

FormatXml(myXPathNodeIterator)
</Tab>
<Tab Name="C++">
// Create Second XPathNavigator
XPathNavigator* myXPathNavigator2 = myXPathDocument->CreateNavigator();

// Ensure we are at the root node
myXPathNavigator2->MoveToRoot();
myXPathExpr = myXPathNavigator2->Compile(selectExpr);
...
// Add an XSLT based sort
myXPathExpr->AddSort(MyStr, XmlSortOrder::Descending, XmlCaseOrder::None, S"", XmlDataType::Text);

myXPathNodeIterator = myXPathNavigator2->Select (myXPathExpr);

FormatXml(myXPathNodeIterator);
</Tab>
</Acme:TabControl>
<p>

<H4>Summary</H4>
<OL>
<LI>Use an XPathExpression class to compile an XPath expression to select a node-set from an XML file.
<LI>Use the XPathNavigator to provide fast navigation over an XPathDocument
</LI>
</OL>

<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->























