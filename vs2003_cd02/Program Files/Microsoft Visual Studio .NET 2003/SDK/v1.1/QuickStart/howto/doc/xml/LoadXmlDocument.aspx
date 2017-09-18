<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Load XML data into an XmlDataDocument?</h4>

<p>
This sample illustrates how to load XML into the XmlDataDocument class. This class extends the XmlDocument class, allowing structured data to be stored, retrieved, and manipulated through the DataSet class, which provides a relational view onto the loaded XML data. This affiliation between the XmlDocument class and DataSet class allows for components to mix XML and relational views of the same underlying data-irrespective of the source of the data. As detailed in other topics, there are differences between these views. Most notable is that XML data that does not map to the relational view cannot be accessed via relational objects such as tables and rows. It is, however, still possible to easily move from a relational row to the equivalent XML element and hence access this XML data.
<p>
You can use an XmlDataDocument anywhere an XmlDocument is used; all topics that describe the XmlDocument apply equally to the XmlDataDocument. Hence, the information covered in the following topics relate to XmlDataDocument as well:
<UL>
<LI><a href="http://localhost/quickstart/howto/doc/Xml/DOMInterfaceXmlDocument.aspx">How Do I...Load and use the XmlDocument?</a>
<LI><a href="http://localhost/quickstart/howto/doc/Xml/SaveXmlDocument.aspx">How Do I...Save XML with the XmlDocument?</a>
</UL>

<p>
There is also a companion topic, <a href="http://localhost/quickstart/howto/doc/Xml/StreamXmlDocument.aspx">How Do I...Read XML Data from an XmlDataDocument?</a>, that focuses on just using XmlDataDocument to read XML.
<p>
In addition, the topic, <a href="http://localhost/quickstart/howto/doc/Xml/XmlDataSet.aspx">How Do I...Use XML and the DataSet Class?</a>, gives additional information on how to use the XmlDataDocument and the DataSet.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/LoadXmlDocument/CS/LoadXmlDocument.aspx"
ViewSource="/quickstart/howto/samples/Xml/LoadXmlDocument/LoadXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# LoadXmlDocument.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/LoadXmlDocument/LoadXmlDocument.src"
RunSample="/quickstart/howto/samples/Xml/LoadXmlDocument/VB/LoadXmlDocument.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB LoadXmlDocument.aspx"
runat="server" />
  </VbTemplate>
<CpTemplate>
  <Acme:SourceRef
  ViewSource="/quickstart/howto/samples/Xml/LoadXmlDocument/LoadXmlDocument.src"
  RunSample="/quickstart/howto/samples/Xml/LoadXmlDocument/CP"
  Icon = "/quickstart/images/genicon.gif"
  Caption="C++ LoadXmlDocument.exe"
  MapRunSamplePath=true
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>

<p>
As shown in the following code, this sample simply loads an XmlDataDocument with the XML data in the sample file, books.xml, and displays that data on screen.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public class LoadXmlDocumentSample
{
    private const String document = "books.xml";

    public static void Main()
    {
        LoadXmlDocumentSample myLoadXmlDocumentSample = new LoadXmlDocumentSample();
        myLoadXmlDocumentSample.Run(document);
    }

    public void Run(String args)
    {
        try
        {
            // Load the XML from file
            Console.WriteLine ();
            Console.WriteLine ("Loading file {0} ...", args);

            XmlDataDocument myXmlDocument = new XmlDataDocument();
            myXmlDocument.Load (args);

            Console.WriteLine ("XmlDataDocument loaded with XML data successfully ...");
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }
}
</Tab>
<Tab Name="VB">
public class LoadXmlDocumentSample
    private const document as String = "books.xml"

    public shared sub Main()
        Dim myLoadXmlDocumentSample as LoadXmlDocumentSample
        myLoadXmlDocumentSample = new LoadXmlDocumentSample()
        myLoadXmlDocumentSample.Run(document)
    end sub

    public sub Run(args as String)
        try
            'Load the XML from file
            Console.WriteLine ()
            Console.WriteLine ("Loading file {0} ...", args)

            Dim myXmlDocument as XmlDataDocument = new XmlDataDocument()
            myXmlDocument.Load (args)

            Console.WriteLine ("XmlDataDocument loaded with XML data successfully ...")

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub
end Class
</Tab>
<Tab Name="C++">
__gc public class LoadXmlDocumentSample
{
protected:
    static String *document = S"books.xml";

public: 
    void Main()
    {
        LoadXmlDocumentSample* myLoadXmlDocumentSample = new LoadXmlDocumentSample();
        myLoadXmlDocumentSample->Run(document);
    }

    void Run(String* args)
    {
        try
        {
            // Load the XML from file
            Console::WriteLine ();
            Console::WriteLine (S"Loading file {0} ...", args);

            XmlDataDocument* myXmlDocument = new XmlDataDocument();
            myXmlDocument->Load (args);

            Console::WriteLine (S"XmlDataDocument loaded with XML data successfully ...");
            
            // Display the XML document.
            myXmlDocument->Save(Console::Out);
        }
        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }

};
</Tab>
</Acme:TabControl>


<H4>Summary</H4>
<OL>
<LI>The XmlDataDocument class provides an in memory cache for XML data.
<LI>The XmlDataDocument extends the XmlDocument class. XmlDataDocument can be used anywhere the XmlDocument class is used.
<LI>There is a close association between the XmlDataDocument and the DataSet classes. In fact, you can regard the XmlDataDocument as a DataSet-aware XmlDocument.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->