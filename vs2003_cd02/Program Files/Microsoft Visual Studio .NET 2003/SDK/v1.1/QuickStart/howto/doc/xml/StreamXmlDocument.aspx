<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Read XML from an XmlDataDocument?</h4>

<p>
This sample illustrates how to create an XmlReader class that reads the XML data stored in the XmlDataDocument. Once the data has been read, the sample applies an XslTransform to the data and then reads the transformed data out from the XmlDataDocument.
<p>
Note: This sample continues from <a href="LoadXmlDocument.aspx">How do I...Load XML data into an XmlDataDocument?</a>.
<p>
The XmlDataDocument class functions as an in-memory cache for XML data. This class enables you to load either relational or XML data, and then manipulate that data using Extensible Stylesheet Language Transfomations (XSLT).
<p>
The XmlDataDocument class also has a close association with the DataSet class. In fact, you can construct an XmlDataDocument class so that it maps to a DataSet. For more information about mapping XmlDataDocument to a DataSet, see <a href="http://localhost/quickstart/howto/doc/Xml/DataSetMapXSDSchema.aspx">How do I...Create DataSet Mappings from an XSD Schema?</a>

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/StreamXmlDocument/CS/StreamXmlDocument.aspx"
ViewSource="/quickstart/howto/samples/Xml/StreamXmlDocument/StreamXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# StreamXmlDocument.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/StreamXmlDocument/VB/StreamXmlDocument.aspx"
ViewSource="/quickstart/howto/samples/Xml/StreamXmlDocument/StreamXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="VB StreamXmlDocument.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/StreamXmlDocument/CP"
ViewSource="/quickstart/howto/samples/Xml/StreamXmlDocument/StreamXmlDocument.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ StreamXmlDocument.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The code for this sample starts by loading an XmlDataDocument with the XML data in the sample file, <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/StreamXmlDocument/cs/&file=books.xml">books.xml</a>. Then, the sample creates an XslTransform object and loads it with the XSLT style sheet, identity.xsl. This style sheet replicates all the XML from the root node.
<p>
Before the data can be transformed, the data must be in a form that supports XML Path Language (XPath) queries. Thus, the sample uses the XmlDataDocument to create an XPathNavigator on which the node transformations can be applied. Now, by applying the XslTransform class to the XPathNavigator, the sample is able to transform the data. This transformed data is returned as an XmlReader that the Format function can use to read the XML data in the XmlDataDocument.
<p>
Note: For information on the XslTransform class, see <a href="http://localhost/quickstart/howto/doc/Xml/TransformXml.aspx">How Do I...Apply XSLT to XML Data?</a>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private const String document = "books.xml";
private const String newStyleSheet = "identity.xsl";

public static void Main()
{
    String[] args = {document, newStyleSheet};
    StreamXmlDocumentSample myStreamXmlDocumentSample = new StreamXmlDocumentSample();
    myStreamXmlDocumentSample.Run(args);
}

public void Run(String[] args)
{
    XmlReader myXmlReader = null;
    XmlDataDocument myXmlDataDocument = new XmlDataDocument();
    XslTransform myXslTransform = new XslTransform();

    try
    {
        // Load the XML from file
        Console.WriteLine ("Loading file {0} ...", args[0]);
        myXmlDataDocument.Load (args[0]);
        Console.WriteLine ("XmlDataDocument loaded with XML data successfully ...\r\n");

        Console.WriteLine ("Reading XML ...\r\n");
        myXslTransform.Load(args[1]);

        XPathNavigator myXPathNavigator = myXmlDataDocument.CreateNavigator();
        myXmlReader = myXslTransform.Transform(myXPathNavigator, null);
        FormatXml (myXmlReader);
    }
    catch (Exception e)
    {
        Console.WriteLine ("Exception: {0}", e.ToString());
    }
    finally
    {
        // Close the reader
        if (myXmlReader != null)
            myXmlReader.Close();
    }
}
</Tab>
<Tab Name="VB">
private const document as String = "books.xml"
private const newStyleSheet as String = "identity.xsl"

shared sub Main()
    Dim args As String() = {document, newStyleSheet}
    Dim myStreamXmlDocumentSample as StreamXmlDocumentSample
    myStreamXmlDocumentSample = new StreamXmlDocumentSample()
    myStreamXmlDocumentSample.Run(args)
end sub

public sub Run(args As String())
    Dim myXmlReader as XmlReader = nothing
    Dim myXmlDataDocument as XmlDataDocument = new XmlDataDocument()
    Dim myXslTransform as XslTransform = new XslTransform()

    try
        ' Load the XML from file
        Console.WriteLine ("Loading file {0} ...", args(0))
        myXmlDataDocument.Load (args(0))
        Console.WriteLine ("XmlDataDocument loaded with XML data successfully ...")

        Console.WriteLine ("Reading XML ...")
        Console.WriteLine()
        myXslTransform.Load(args(1))

        Dim myXPathNavigator as XPathNavigator = myXmlDataDocument.CreateNavigator()
        myXmlReader = myXslTransform.Transform(myXPathNavigator, nothing)
        FormatXml (myXmlReader)

    catch e as Exception
        Console.WriteLine ("Exception: {0}", e.ToString())

    finally
        ' Close the reader
        If Not myXmlReader Is Nothing
            myXmlReader.Close()
        end if

    end try
end sub
</Tab>
<Tab Name="C++">
protected:
    static String *document = S"books.xml";
    static String *newStyleSheet = S"identity.xsl";


public:
    void Main()
    {
        String* args[] = {document, newStyleSheet};
        StreamXmlDocumentSample* myStreamXmlDocumentSample = new StreamXmlDocumentSample();
        myStreamXmlDocumentSample->Run(args);
    }

    void Run(String* args[])
    {
        XmlReader* myXmlReader = 0;
        XmlDataDocument* myXmlDataDocument = new XmlDataDocument();
        XslTransform* myXslTransform = new XslTransform();

        try
        {
            // Load the XML from file
            Console::WriteLine (S"Loading file {0} ...", args[0]);
            myXmlDataDocument->Load (args[0]);
            Console::WriteLine (S"XmlDataDocument loaded with XML data successfully ...\r\n");

            Console::WriteLine (S"Reading XML ...\r\n");
            myXslTransform->Load(args[1]);

            XPathNavigator* myXPathNavigator = myXmlDataDocument->CreateNavigator();
            myXmlReader = myXslTransform->Transform(myXPathNavigator, 0);
            FormatXml (myXmlReader);
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }

        __finally
        {
            // Close the reader
            if (myXmlReader != 0)
                myXmlReader->Close();
        }
    }	
</Tab>
</Acme:TabControl>
<p>
The FormatXml function is used to demonstrate one technique for reading XML from an XmlDataDocument. We
use an <b>XmlReader</b> to walk over the entire content of the XmlDataDocument and write out our custom formated XML content.
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private static void FormatXml (XmlReader reader)
{
    while (reader.Read())
    {
        switch (reader.NodeType)
        {
            case XmlNodeType.ProcessingInstruction:
            ...
        }
    }
}

// Format the output
private static void Format(XmlReader reader, String NodeType)
{
    // Format the output
    ...
}
</Tab>
<Tab Name="VB">
private sub FormatXml (reader as XmlReader)
    While reader.Read()
        Select (reader.NodeType)
            case XmlNodeType.ProcessingInstruction:
            ...
        end Select
    end While
end sub

private sub Format(byref reader as XmlReader, NodeType as String)
    ' Format the output
    ...
end sub
</Tab>
<Tab Name="C++">
private: 
    void FormatXml (XmlReader* reader)
    {
        while (reader->Read())
        {
            switch (reader->NodeType)
            {
              case XmlNodeType::ProcessingInstruction:
              ...
        }
    }
}

// Format the output
private static void Format(XmlReader reader, String NodeType)
{
    // Format the output
    ...
}
</Tab>
</Acme:TabControl>

<H4>Summary</H4>
<OL>
<LI>The XmlDataDocument class enables you to load either relational data or XML data.
<LI>You can create an XmlReader for the XML data in an XmlDataDocument by using an XslTransform.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->






