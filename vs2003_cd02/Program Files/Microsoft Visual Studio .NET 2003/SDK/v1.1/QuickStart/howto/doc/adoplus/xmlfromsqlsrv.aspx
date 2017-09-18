    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Generate XML with data from SQL Server</h4>
    
    This sample illustrates how to produce XML from SQL Server using two different techniques.
    The first uses the <b>ExecuteXmlReader</b> method of <b>SqlCommand</b> to get an <b>XmlTextReader</b>, which 
    is then populated into a DataSet using the <b>ReadXml</b> method of the <b>DataSet</b> class.
    The second uses the <B>SqlDataAdapter</b> to extract the data content and adapt it to the XML structure in 
    the </B>DataSet</B>. The <B>SqlDataAdapter</b> class encapsulates a set of data commands and a database 
    connection that is used to fill the </B>DataSet</B> and potentially update the data source.
    <p></p>
    <Acme:LangSwitch runat="server" ID=LangSwitch1>
      <CsTemplate>
    <Acme:SourceRef
    RunSample="/quickstart/howto/samples/adoplus/xmlfromsqlsrv/CS/xmlfromsqlsrv.aspx"
    ViewSource="/quickstart/howto/samples/adoplus/xmlfromsqlsrv/xmlfromsqlsrv.src"
    Icon = "/quickstart/images/genicon.gif"
    Caption="C# xmlfromsqlsrv.aspx"
    runat="server" ID=SourceRef1/>
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
    ViewSource="/quickstart/howto/samples/adoplus/xmlfromsqlsrv/xmlfromsqlsrv.src"
    RunSample="/quickstart/howto/samples/adoplus/xmlfromsqlsrv/VB/xmlfromsqlsrv.aspx"
    Icon = "/quickstart/images/genicon.gif"
    Caption="VB xmlfromsqlsrv.aspx"
    runat="server" ID=SourceRef2/>
      </VbTemplate>
      <CpTemplate>
    <Acme:SourceRef
    ViewSource="/quickstart/howto/samples/adoplus/xmlfromsqlsrv/xmlfromsqlsrv.src"
    RunSample="/quickstart/howto/samples/adoplus/xmlfromsqlsrv/CP"
    Icon = "/quickstart/images/genicon.gif"
    Caption="C++ xmlfromsqlsrv.aspx"
    MapRunSamplePath=true
    runat="server" ID=SourceRef2/>
      </CpTemplate>
    </Acme:LangSwitch>
    
    <p>
    This sample begins by opening a connection to the SQL Server Northwind database. Then a SqlCommand
    is created that
    will select all rows from the Customers table of the Northwind database. In this command the FOR XML
    clause is used to indicate you are
    requesting the SQL Server return the results of the query as an XML document. The
    XMLDATA flag on the FOR XML clause specifies that an
    XML-Data schema should be returned. The schema is prepended
    to the document as an inline schema.
    <p>
    <Acme:TabControl runat="server">
    <Tab Name="C#">

    String sConnection = "server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind";
    SqlConnection mySqlConnection = new SqlConnection(sConnection);
    SqlCommand mySqlCommand = new SqlCommand("select * from customers FOR XML AUTO, XMLDATA", mySqlConnection);
    mySqlCommand.CommandTimeout = 15;
    ...
    mySqlConnection.Open();
    </Tab>
    <Tab Name="VB">

    Dim sConnection as String = "server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind"
    Dim mySqlConnection as SqlConnection = new SqlConnection(sConnection)
    Dim mySqlCommand as SqlCommand = new SqlCommand("select * from customers FOR XML AUTO, XMLDATA", mySqlConnection)
    mySqlCommand.CommandTimeout = 15
    ...
    mySqlConnection.Open()
    </Tab>
    <Tab Name="C++">

    String * sConnection = S"server=(local)\\NetSDK;Trusted_Connection=yes;database=northwind;provider=sqloledb";
    SqlConnection * mySqlConnection = new SqlConnection(sConnection);
    SqlCommand * mySqlCommand = new SqlCommand("select * from customers FOR XML AUTO, XMLDATA", mySqlConnection);
    mySqlCommand->CommandTimeout = 15;
    ...
    mySqlConnection->Open();
    </Tab>
    </Acme:TabControl>
    <p>
    In the first section of the sample a DataSet called myDataSet1 is created. Then, you add an <b>XmlTextReader</b> 
    and the <b>XmlReadMode.Fragment</b> flag to read the XmlDocument returned from SQL Server into myDataSet1 using 
    the <b>ReadXml</b> method.
    <p>
    In the second section of the sample a DataSet called myDataSet2 is created and a SqlDataAdapter is created to
    provide a SQL command to access and retrieve the data from the SQL server database. Then the <b>Fill</b> method is called on the SqlDataAdapter
    to load the data into myDataSet2.
    <p>
    The final step is to write out both datasets to validate that the data was the same and review the XML format.
    </p>
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    // Now create the DataSet and fill it with xml data.
    DataSet myDataSet1 = new DataSet();
    myDataSet1.ReadXml((XmlTextReader)mySqlCommand.ExecuteXmlReader(), XmlReadMode.Fragment);
    
    // Modify to match the other dataset
    myDataSet1.DataSetName = "NewDataSet";
    
    
    // Get the same data through the provider.
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("select * from customers", sConnection);
    DataSet myDataSet2 = new DataSet();
    mySqlDataAdapter.Fill(myDataSet2);
    
    // Write data to files: data1.xml and data2.xml for comparison.
    myDataSet1.WriteXml("data1.xml");
    myDataSet2.WriteXml("data2.xml");
    Console.WriteLine ("Data has been writen to the output files: data1.xml and data2.xml");
    Console.WriteLine ();
    Console.WriteLine ("********************data1.xml********************");
    Console.WriteLine (myDataSet1.GetXml());
    Console.WriteLine ();
    Console.WriteLine ("********************data2.xml********************");
    Console.WriteLine (myDataSet2.GetXml());
    
    </Tab>
    <Tab Name="VB">
    ' Now create the DataSet and fill it with xml data.
    Dim myDataSet1 as DataSet = new DataSet()
    myDataSet1.ReadXml(mySqlCommand.ExecuteXmlReader(), XmlReadMode.Fragment)
    
    ' Modify to match the other dataset
    myDataSet1.DataSetName = "NewDataSet"
    
    
    ' Get the same data through the provider.
    Dim mySqlDataAdapter as SqlDataAdapter = new SqlDataAdapter("select * from customers", sConnection)
    Dim myDataSet2 as DataSet = new DataSet()
    mySqlDataAdapter.Fill(myDataSet2)
    
    ' Write data to files: data1.xml and data2.xml.
    myDataSet1.WriteXml("data1.xml")
    myDataSet2.WriteXml("data2.xml")
    Console.WriteLine ("Data has been written to the output files: data1.xml and data2.xml")
    Console.WriteLine ()
    Console.WriteLine ("********************data1.xml********************")
    Console.WriteLine (myDataSet1.GetXml())
    Console.WriteLine ()
    Console.WriteLine ("********************data2.xml********************")
    Console.WriteLine (myDataSet2.GetXml())
    </Tab>
    <Tab Name="C++">
	// Now create the DataSet and fill it with xml data.
	DataSet * myDataSet1 = new DataSet();
	  myDataSet1->ReadXml(__try_cast<XmlTextReader*>(mySqlCommand->ExecuteXmlReader()), XmlReadMode::Fragment);
	
	// Modify to match the other dataset
	myDataSet1->DataSetName = "NewDataSet";
	
	
	// Get the same data through the provider.
	SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter("select * from customers", sConnection);
	DataSet * myDataSet2 = new DataSet();
	mySqlDataAdapter->Fill(myDataSet2);
	
	// Write data to files: data1.xml and data2.xml for comparison.
	myDataSet1->WriteXml("data1.xml");
	myDataSet2->WriteXml("data2.xml");
	Console::WriteLine ("Data has been writen to the output files: data1.xml and data2.xml");
    
    </Tab>
    </Acme:TabControl>
    
    
  <p>
    
    <!-- #include virtual="/quickstart/include/footer.inc" -->

