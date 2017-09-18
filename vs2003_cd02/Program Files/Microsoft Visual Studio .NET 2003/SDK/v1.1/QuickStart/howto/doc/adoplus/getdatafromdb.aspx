    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
     
    <h4>ADO.NET: Populate a DataSet from a Database</h4>
    
    Getting data from a database is easy, and working with data is easier than before. 
    If you want the results from a database as a forward only, read-only stream of data, you 
    can execute a command and retrieve the results using the <b>DataReader</b>.  For examples on how to use a
    <b>DataReader</b>, see <a href="adodtreader.aspx">Retrieve Data Using OLE DB</a>
    and  <a href="sqldtreader.aspx">Retrieve Data from SQL Server</a>.  For more interactive
    operations such as binding to, navigating through, or remoting
    the results of a database query, you can place the results in a
    DataSet as shown in this example.
    <p>
    The most important concept to remember is that the DataSet is a data structure separate
    and distinct from a data store. Although you get data from a database in this example, it
    doesn't matter where the data comes from; the DataSet will always present a consistent
    programming model. It is a simple collection of data with relational database
    characteristics. There is no Load, Open, or Execute on a DataSet because it doesn't know
    where it gets its data from.
    
    This section describes how to use a SqlDataAdapter to get data from a database into a DataSet.
    <p>
    You can add data to the DataSet using the <b>Add</b> method (see
    <a href="UpdateDataFromDB.aspx">Update a Database from a DataSet</a>), or
    directly push data in with the intrinsic XML methods (see
    <a href="readandwritexml.aspx">Read and Write XML Data</a>). SqlDataAdapter can be used to 
    retrieve data from a database but can also push data back 
    into the database. Here, the focus is on getting data out.
    
    <p>
    The first step is to construct a SqlDataAdapter. This is done in the same way a SqlCommand is
    constructed.
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    String SelectCmdString = "select * from customers";
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter(SelectCmdString, myConnection);
    //...or this can also be done as follows:
    
    SqlCommand mySelectCommand = New SqlCommand("select * from customers", myConnection);
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter(mySelectCommand);
    </Tab>
    <Tab Name="VB">
    Dim SelectCmdString As String = "select * from customers"
    Dim mySqlDataAdapter As SqlDataAdapter = New SqlDataAdapter(SelectCmdString, myConnection)
    '...or this can also be done as follows:
    
    Dim mySelectCommand as SqlCommand = New SqlCommand("select * from customers", myConnection)
    Dim mySqlDataAdapter as SqlDataAdapter = new SqlDataAdapter(mySelectCommand)
    </Tab>
    <Tab Name="C++">
    String * SelectCmdString = "select * from customers";
    SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter(SelectCmdString, myConnection);
    //...or this can also be done as follows:
    
    SqlCommand* mySelectCommand = New SqlCommand("select * from customers", myConnection);
    SqlDataAdapter* mySqlDataAdapter = new SqlDataAdapter(mySelectCommand);
    </Tab>
    </Acme:TabControl>
    
    <p>
    The SqlDataAdapter and SqlCommand are very similar, except for the <b>Fill</b> and <b>Update</b> methods. The <b>Fill</b> method populates a
    DataSet. The <b>Update</b> method takes changes from a DataSet and pushes them back into the
    database. This is accomplished by four commands specified on the DataAdapter. These commands are: 
    SelectCommand, UpdateCommand, InsertCommand, and DeleteCommand. You can explicitly set 
    these commands to control the statements used at run time to resolve changes, 
    including the use of stored procedures. For ad hoc scenarios, a <b>CommandBuilder</b> object 
    can generate these at run time based on a select statement (see  
    <a href="updatedatafromdb.aspx">Update a Database from a DataSet</a>). However, this run-time 
    generation requires an extra round trip to the server to gather required metadata, 
    so explicitly providing the insert, update, and delete commands at design time will result 
    in better run-time performance.
    <p>
    <b>NOTE:</b> Visual Studio adds great value to establishing typed SqlDataAdapters and
    DataSets, and eventually creates Stored Procedures for you. Explore this feature by using
    the <b>ComponentDesigner</b> and <b>Database</b> objects.
    
    <p>
    Once your SqlDataAdapter is established you can pass it a DataSet to populate:
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    myDataSet = new DataSet();
    mySqlDataAdapter.Fill(myDataSet,"Customers");
    </Tab>
    <Tab Name="VB">
    myDataSet = New DataSet()
    mySqlDataAdapter.Fill(myDataSet,"Customers")
    </Tab>
    <Tab Name="C++">
    DataSet * myDataSet = new DataSet();
    mySqlDataAdapter->Fill(myDataSet,"Customers");
    </Tab>
    </Acme:TabControl>
    
    <p>
    The DataSet now holds the results of your query. In fact, the DataSet can hold
    results from multiple queries and even relate them (see
    <a href="relationaldata.aspx">Work with Relational Data</a>). Because it holds multiple
    results, the DataSet contains a collection of tables. Notice that the <b>Fill</b>
    method has "Customers" as the second argument. This is the name of the table to
    fill in the DataSet. If that table does not exist, it is created for you.
    
    <p>
    Because the data is stored in a collection of rows in the table, you can easily
    use a <b>foreach</b> statement to iterate through the rows:
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    foreach (DataRow myDataRow in myDataSet.Tables["Customers"].Rows)
    {
      Console.WriteLine(myDataRow["CustomerId"].ToString());
    }
    </Tab>
    <Tab Name="VB">
    Dim myDataRow as DataRow
    For Each myDataRow In myDataSet.Tables("Customers").Rows
      Console.WriteLine(myDataRow("CustomerId").ToString())
    Next
    </Tab>
    <Tab Name="C++">
    for(int i =0;i< myDataSet->Tables->Item["Customers"]->Rows->Count; i++)
    {
		DataRow * row = myDataSet->Tables->Item["Customers"]->Rows->Item[i];
		Console::WriteLine(row->Item["CustomerID"]->ToString());
    }
    </Tab>
    </Acme:TabControl>
    
    
    <p>
    In fact, you can use <b>foreach</b> over the columns as well. The following example demonstrates
    placing together all the code in this document. To learn how to update this
    data back into the database see <a href="updatedatafromdb.aspx">Update a Database
    from a DataSet</a>.
    
    <p>
    
    <Acme:LangSwitch runat="server">
      <CsTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/gettingdata/cs/gettingdata.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/gettingdata/gettingdata.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C# GettingData.aspx"
      runat="server" />
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/gettingdata/vb/gettingdata.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/gettingdata/gettingdata.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="VB GettingData.aspx"
      runat="server" />
      </VbTemplate>
      <CpTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/gettingdata/CP"
      ViewSource="/quickstart/howto/samples/adoplus/gettingdata/gettingdata.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C++ GettingData.exe"
      MapRunSamplePath=true
      runat="server" />
      </CpTemplate>
    </Acme:LangSwitch>
    
    
    <p>
    <!-- #include virtual="/quickstart/include/footer.inc" -->
