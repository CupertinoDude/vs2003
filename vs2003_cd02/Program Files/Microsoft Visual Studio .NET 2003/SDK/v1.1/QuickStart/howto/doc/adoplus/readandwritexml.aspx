    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Read and Write XML</h4>
    
    ADO.NET and DataSet can read and write XML schema and XML. For more information,
    see <A target=content href="/quickstart/howto/doc/XML/XMLDataSet.aspx">
    How do I...Use XML and the DataSet?</A>
    
    <p>Schemas, or the tables, columns, constraints and so forth, of a DataSet
    can be defined in several ways. One method is to create them using properties
    and methods (<b>Tables.Add</b>, <b>Columns.Add</b>, and so on). This establishes
    a schema within your DataSet that can be used as a container to hold data.
    Another way is to use the SqlDataAdapter or OleDbDataAdapter. When you use
    these commands, if the schema does not exist in a DataSet, it is created for
    you.</p>
    
    <p>XML is an intrinsic element of ADO.NET. Several methods that support XML have
    been implemented. The <b>GetXmlSchema</b> method allows you to get the schema of a DataSet as an XSD schema.
    For example, if you load a DataSet from the database,
    you could get an XSD schema from it:</p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    Console.WriteLine(myDataSet.GetXmlSchema());
    </Tab>
    <Tab Name="VB">
    Console.WriteLine(myDataSet.GetXmlSchema())
    </Tab>
    <Tab Name="C++">
    Console::WriteLine(myDataSet->GetXmlSchema(););
    </Tab>
    </Acme:TabControl>
    
    <p>This returns an XSD compliant XML schema for the schema in your DataSet.</p>
    
    <p>XML representation is also retrieved through the <b>GetXml</b> method.</p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    Console.WriteLine(myDataSet.GetXml());
    </Tab>
    <Tab Name="VB">
    Console.WriteLine(myDataSet.GetXml())
    </Tab>
    <Tab Name="C++">
    Console::WriteLine(myDataSet->GetXml());
    </Tab>
    </Acme:TabControl>
    
    <p>The sample below loads data from a database, and then outputs the XSD Schema
    and XML data.</p>
    
    <p>
    
    <Acme:LangSwitch runat="server">
      <CsTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/ReadAndWriteXML/cs/ReadAndWriteXML.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/ReadAndWriteXML/ReadAndWriteXML.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C# ReadAndWriteXML.aspx"
      runat="server" />
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/ReadAndWriteXML/vb/ReadAndWriteXML.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/ReadAndWriteXML/ReadAndWriteXML.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="VB ReadAndWriteXML.aspx"
      runat="server" />
      </VbTemplate>
      <CpTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/ReadAndWriteXML/CP"
      ViewSource="/quickstart/howto/samples/adoplus/ReadAndWriteXML/ReadAndWriteXML.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C++ ReadAndWriteXML.exe"
      MapRunSamplePath=true
      runat="server" />
      </CpTemplate>
    </Acme:LangSwitch>
    
    </p>
    <p>
    <!-- #include virtual="/quickstart/include/footer.inc" -->
    
    
    

