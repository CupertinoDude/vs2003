<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Apply an XSL Transformation to XML?</h4>

<p>
This sample illustrates how to apply an Extensible Stylesheet Language Transformations (XSLT) file to an XML document using the XslTransform class. This class implements the World Wide Web Consortium (W3C) <A href="http://www.w3.org/TR/xslt">W3C XSL Transformations (XSLT) version 1.0</A> specification. (For further reference, you might want to refer to W3C <A href="http://www.w3.org/TR/xsl/">W3C Extensible Stylesheet Language (XSL) Version 1.0</A> specification.)

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/TransformXML/CS/TransformXML.aspx"
ViewSource="/quickstart/howto/samples/Xml/TransformXML/TransformXML.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# TransformXML.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/TransformXML/VB/TransformXML.aspx"
ViewSource="/quickstart/howto/samples/Xml/TransformXML/TransformXML.src"
Icon = "/quickstart/images/genicon.gif"
Caption="VB TransformXML.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/TransformXML/CP"
ViewSource="/quickstart/howto/samples/Xml/TransformXML/TransformXML.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ TransformXML.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
XSLT is an XML-based language designed to transform one XML document into another XML document or an XML document into any other structured document. XSLT uses the XML Path Language (XPath) to perform queries on an XML document in order to specify a particular part of the document. (For an example of how to use XPath to query an XML document, see <a href="/quickstart/howto/doc/Xml/QueryXmlDocumentXPath.aspx">How Do I...Query XML with an XPath expression?</a>).
<p>
Often, the structure of an XML document does not match the structure needed to process the XML data. To transform the existing structure into one that can be processed, you use an XSLT processor and an XSLT style sheet (or XSLT file) that defines how to do the transformation. The XSLT file consists of templates that specify how each node of the source XML document should appear in the destination XML document. Thus, the XSLT processor holds three trees:

<ol>
<LI>one tree for the source XML
<LI>one tree for the destination structure
<LI>one tree for the XSLT file

<p>
The following diagram illustrates the transformation process: taking in an XML document, applying the XSLT file to the nodes of the XML document, and generating another document of the desired format.

<p>
<img border="0" class="indent" src="XSL.gif" width="569" height="359">

<p>
This sample consists of two functions. The first function simply reads an XML document and then transforms the data using an XSLT file. The second function reads an XML document, transforms the data, and then writes a new XML document from the transformed data.
<p>
The sample applies these two functions to three sets of documents:
<ol>
<li>The documents in the first set are the XML document, books.xml, and the XSLT file, books.xsl. The XSLT file consists of templates that get all the books in the bookstore element and then, for each book element, get the values for the ISBN attribute and the price element. There is also a template that tells the XSLT processor to start processing from the root ("/") node.
<li>The documents in the second set are the XML document, ProcessParametersA.xml, and the XSLT file, StyleSheetGenerator.xsl. In this case, the sample reads the XML document to find out which of two style sheets contained in the XSLT file to use. The sample then generates the specified style sheet.
<li>The documents in the third set are the XML document, ProcessParametersB.xml, and the XSLT file, StyleSheetGenerator.xsl. The sample processes these documents in the same way that it processes the second set of documents. However, in this case, the sample generates a different style sheet.
</ol>

<p>
The following code shows the first of the two functions. This is the function that simply reads and transforms data. To do this, the function first creates an XPathDocument object and an XslTransform object. It then uses the Load method to load the XslTransform object with the XSLT file. To initiate the transformation, the function calls the Transform method passing in the XPathDocument. The transformation process returns an XmlReader that is used to read the transformed data.
<p>
Note: As discussed in <a href="http://localhost/quickstart/howto/doc/Xml/QueryXmlDocumentXPath.aspx">How Do I...Query XML with an XPath Expression?</a>, the XPathDocument class provides a fast, high-performance cache for XML document processing using XSLT.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// args[0] is the xml file and args[1] is the stylesheet file.
public void ReadTransform(String[] args)
{
    try
    {
        XPathDocument myXPathDocument = new XPathDocument (args[0]);
        XslTransform myXslTransform = new XslTransform();
        myXslTransform.Load(args[1]);
        XmlReader reader = myXslTransform.Transform(myXPathDocument, null);

        FormatXml(reader);
    }
    catch (Exception e)
    {
        Console.WriteLine ("Exception: {0}", e.ToString());
    }
}
</Tab>
<Tab Name="VB">
' args[0] is the xml file and args[1] is the stylesheet file.
public sub ReadTransform(args As String())
    try
        Dim myXPathDocument as XPathDocument = new XPathDocument (args(0))
        Dim myXslTransform as XslTransform = new XslTransform()
        myXslTransform.Load(args(1))
        Dim reader as XmlReader = myXslTransform.Transform(myXPathDocument, nothing)

        FormatXml(reader)

    catch e as Exception
        Console.WriteLine ("Exception: {0}", e.ToString())
    end try
end sub

</Tab>
<Tab Name="C++">
// args[0] is the xml file and args[1] is the stylesheet file.
void ReadTransform(String* args[])
{
	try
	{
	    XPathDocument* myXPathDocument = new XPathDocument (args[0]);
	    XslTransform* myXslTransform = new XslTransform();
	    myXslTransform->Load(args[1]);
	    XmlReader* reader = myXslTransform->Transform(myXPathDocument, 0);
	
	    FormatXml(reader);
	}
	catch (Exception* e)
	{
	    Console::WriteLine (S"Exception: {0}", e->ToString());
	}
}
</Tab>
</Acme:TabControl>

<p>
Besides returning an XmlReader from a transformation, it is possible supply an XmlWriter to the Transform method. Supplying a writer enables the transformed data to be written to a file or stream. The second of the two functions in this sample shows how to incorporate an XmlWriter into the transformation process. The following code shows how this second function writes the transformed data to a file called transform.xml and then prints this file to the console.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// args[0] is the xml file and args[1] is the stylesheet file.
public void ReadTransformWrite(String[] args)
{
    StreamReader stream = null;

    try
    {
        XPathDocument myXPathDocument = new XPathDocument (args[0]);
        XslTransform myXslTransform = new XslTransform();
        XmlTextWriter writer = new XmlTextWriter("transform.xml", null);
        myXslTransform.Load(args[1]);
        myXslTransform.Transform(myXPathDocument, null, writer);

        writer.Close();

        stream = new StreamReader ("transform.xml");
        Console.Write(stream.ReadToEnd());
    }

    catch (Exception e)
    {
        Console.WriteLine ("Exception: {0}", e.ToString());
    }

    finally
    {
        if (stream != null)
            stream.Close();
    }
}
</Tab>
<Tab Name="VB">
' args[0] is the xml file and args[1] is the stylesheet file.
public sub ReadTransformWrite(args As String())
    Dim stream as StreamReader = nothing

    try
        Dim myXPathDocument as XPathDocument = new XPathDocument (args(0))
        Dim myXslTransform as XslTransform = new XslTransform()
        Dim writer as XmlTextWriter = new XmlTextWriter("transform.xml", nothing)
        myXslTransform.Load(args(1))
        myXslTransform.Transform(myXPathDocument, nothing, writer)

        writer.Close()

        stream = new StreamReader ("transform.xml")
        Console.Write(stream.ReadToend())
    catch e as Exception
        Console.WriteLine ("Exception: {0}", e.ToString())
    finally
        If Not stream Is Nothing
            stream.Close()
        end if
    end try
end sub
</Tab>
<Tab Name="C++">
// args[0] is the xml file and args[1] is the stylesheet file.
void ReadTransformWrite(String* args[])
{
	StreamReader* stream = 0;
	
	try
	{
	    XPathDocument* myXPathDocument = new XPathDocument (args[0]);
	    XslTransform* myXslTransform = new XslTransform();
	    XmlTextWriter* writer = new XmlTextWriter(S"transform.xml", 0);
	    myXslTransform->Load(args[1]);
	    myXslTransform->Transform(myXPathDocument, 0, writer);
	
	    writer->Close();
	
	    stream = new StreamReader (S"transform.xml");
	    Console::Write(stream->ReadToEnd());
	}
	
	catch (Exception* e)
	{
	    Console::WriteLine (S"Exception: {0}", e->ToString());
	}
	
	__finally
	{
	    if (stream != 0)
	        stream->Close();
	}
}
</Tab>
</Acme:TabControl>

<p>
Although not shown in this sample, you could use the Transform method of XslTransform to load a document and write to file directly. This is a convenience method to load an XML document from file, apply the XSLT file, and write the output to a file. This prevents the user from having to create and load the input source document, and then write to a file stream. This method uses the XPathDocument to transform the XML, as shown in the following code.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XslTransform xsltransform = new XslTransform();
xsltransform.Load("favorite.xsl");
xsltransform.Transform("MyDocument.xml", "TransformResult.xml");
</Tab>
<Tab Name="VB">
Dim xsltransform as XslTransform = new XslTransform()
xsltransform.Load("favorite.xsl")
xsltransform.Transform("MyDocument.xml", "TransformResult.xml")
</Tab>
<Tab Name="C++">
XslTransform* xsltransform = new XslTransform();
xsltransform->Load("favorite.xsl");
xsltransform->Transform("MyDocument.xml", "TransformResult.xml");
</Tab>
</Acme:TabControl>

<p>

<H4>Summary</H4>
<OL>
<LI>XSLT is a language for transforming XML documents into other XML documents using XPath as the query language.
<LI>Use the Load method of the XslTransform class to load an XSLT style sheet (or XSLT file).
<LI>The Transform method of the XslTransform class uses an XPathDocument, and either returns an XmlReader or writes the transformation into a supplied XmlWriter or stream.
<LI>The XslTransform class can transform over any data that implements XPathNavigator and the IXPathNavigable interface.
<LI>You can combine XSLT files to produce the required structure output format (for example, XML or HTML).
<LI>XSLT processors do not manipulate documents. They manipulate document structure.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

<p>



















