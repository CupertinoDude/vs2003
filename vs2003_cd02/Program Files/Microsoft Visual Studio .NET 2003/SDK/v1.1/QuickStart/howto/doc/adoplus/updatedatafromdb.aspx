    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Update a Database from a DataSet</h4>
    
    This topic illustrates how to update data in a database using a DataSet. It is important to remember
     that you can also insert, update, and delete data in a database directly using a <b>SqlCommand</b>.
    Understanding the concepts covered in <a href="getdatafromdb.aspx">Populate a DataSet from a Database</a> will help you understand the current topic.
    
 
    <p>Some of the topics covered in Populate a DataSet from a Database include retrieving data from a database and into a
    DataSet, and how the DataSet is separate and distinct from the database. Once the
    <B>DataSet</B> is loaded, you can modify the data, and the DataSet will track the changes.</p>
    
    <p>The <B>DataSet</B> can be considered an in-memory cache of data retrieved from a database. The
    <B>DataSet</B> consists of a collection of tables, relationships, and
    constraints. In this example we will show how to use the <b>Add</b> method on the DataTable to add new data to
    a DataSet. The <b>Add</b>
    method takes either an array of the expected data columns, or a DataRow.
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    // Create a new Connection and SqlDataAdapter

    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("Select * from Customers", myConnection);
    DataSet myDataSet = new DataSet();
    DataRow myDataRow;
    
    // Create command builder. This line automatically generates the update commands for you, so you don't 
    // have to provide or create your own.
    SqlCommandBuilder mySqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter);
    
    // Set the MissingSchemaAction property to AddWithKey because Fill will not cause primary
    // key & unique key information to be retrieved unless AddWithKey is specified.
    mySqlDataAdapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
    
    mySqlDataAdapter.Fill(myDataSet, "Customers");
    
    myDataRow = myDataSet.Tables["Customers"].NewRow();
    myDataRow["CustomerId"] = "NewID";
    myDataRow["ContactName"] = "New Name";
    myDataRow["CompanyName"] = "New Company Name";
    
    myDataSet.Tables["Customers"].Rows.Add(myDataRow);
    </Tab>
    <Tab Name="VB">
    ' Create a new Connection and SqlDataAdapter
    Dim myConnection as SqlConnection
    Dim mySqlDataAdapter as SqlDataAdapter
    

    myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlDataAdapter = new SqlDataAdapter("Select * from Customers", myConnection)
    
    Dim myDataSet as DataSet = new DataSet()
    Dim myDataRow As DataRow
    
    ' Create command builder. This line automatically generates the update commands for you, so you don't 
    ' have to provide or create your own.
    Dim myDataRowsCommandBuilder as SqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter)
    
    ' Set the MissingSchemaAction property to AddWithKey because Fill will not cause primary
    ' key & unique key information to be retrieved unless AddWithKey is specified.
    mySqlDataAdapter.MissingSchemaAction = MissingSchemaAction.AddWithKey
    
    mySqlDataAdapter.Fill(myDataSet, "Customers")
    
    myDataRow = myDataSet.Tables("Customers").NewRow()
    myDataRow("CustomerId") = "NewID"
    myDataRow("ContactName") = "New Name"
    myDataRow("CompanyName") = "New Company Name"
    
    myDataSet.Tables("Customers").Rows.Add(myDataRow)
    </Tab>
    <Tab Name="C++">
    // Create a new Connection and SqlDataAdapter

    SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Trusted_Connection=yes;database=northwind;provider=sqloledb");
    SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter("Select * from Region", myConnection);
    DataSet * myDataSet = new DataSet();
    DataRow * myDataRow;
    
    // Create command builder. This line automatically generates the update commands for you, so you don't 
    // have to provide or create your own.
    SqlCommandBuilder * mySqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter);
    
    // Set the MissingSchemaAction property to AddWithKey because Fill will not cause primary
    // key & unique key information to be retrieved unless AddWithKey is specified.
    mySqlDataAdapter->MissingSchemaAction = MissingSchemaAction::AddWithKey;
    
    mySqlDataAdapter->Fill(myDataSet, Customers");
 
    DataRow * myDataRow = myDataSet->Tables->Item["Customers"]->NewRow();
    myDataRow->Item["CustomerId"] = "NewID";
    myDataRow->Item["ContactName"] = "New Name";
    myDataRow->Item["CompanyName"] = "New Company Name";
    
    myDataSet->Tables->Item["Customers"]->Rows->Add(myDataRow);
    </Tab>
    </Acme:TabControl>
    
    </p>
    
    <p>Note that the DataTable must return a DataRow through the <b>NewRow</b> method. The method
    returns a DataRow object with the appropriate schema of the DataTable. The new
    DataRow is independent of the table until it is added to the RowsCollection.</p>
    
    <p>You can change data in a DataRow by accessing the DataRow. You can use the index of the row in the RowsCollection accessed through the
    <b>Rows</b> property:</p>
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    myDataSet.Tables["Customers"].Rows[0]["ContactName"]="Peach";
    </Tab>
    <Tab Name="VB">
    myDataSet.Tables("Customers").Rows(0)("ContactName")="Peach"
    </Tab>
    <Tab Name="C++">
    myDataSet->Tables->Item["Customers"]->Rows->Item[0]["ContactName"]="Peach";
    </Tab>
    </Acme:TabControl>
    
    
    </p>
    
    <p>You can also access a specific row by the Primary Key value:</p>
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    DataRow myDataRow1 = myDataSet.Tables["Customers"].Rows.Find("ALFKI");
    myDataRow1["ContactName"]="Peach";
    </Tab>
    <Tab Name="VB">
    Dim myDataRow1 As DataRow = myDataSet.Tables("Customers").Rows.Find("ALFKI")
    myDataRow1("ContactName")="Peach"
    </Tab>
    <Tab Name="C++">
    DataRow * myDataRow1 = myDataSet->Tables->Item["Customers"]->Rows->Find("ALFKI");
    myDataRow1->Item["ContactName"]="Peach";
    </Tab>
    </Acme:TabControl>
    
    
    </p>
    
    <p>where "ALFKI" is the value of the Primary Key "CustomerID" in the "Customers" table. When using the SqlDataAdapter, the
    Key is established from the database. You can also set the Key if you are not using
    the database through the <b>PrimaryKey</b> property.</p>
    
    <p>Use the <b>Delete</b> method to remove the Row. Note that a logical deletion
    occurs in the DataSet, which only results in a hard deletion once the DataSet is
    updated to the database. Similarly you can use <b>RejectChanges</b> on the DataSet, in
    which case the Row is restored.</p>
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    myDataSet.Tables["Customers"].Rows[0].Delete();
    </Tab>
    <Tab Name="VB">
    myDataSet.Tables("Customers").Rows(0).Delete()
    </Tab>
    <Tab Name="C++">
    myDataSet->Tables->Item["Customers"]->Rows[0]->Delete();
    </Tab>
    </Acme:TabControl>
    
    </p>
    
    <p>The original and new values are maintained in the row. The <b>RowChanging</b> event allows
    you to access both original and new values to decide whether you want the edit to
    proceed. Because we maintain original and new values, we can establish scenarios
    such as optimistic locking and key changes.</p>
    
    <p>
    Before submitting the update back to the database, you need to setup the <b>InsertCommand</b>, <b>UpdateCommand</b>, 
    and <b>DeleteCommand</b> to reconcile the changes to the database.  For limited scenarios you can use the 
    <b>SqlCommandBuilder</b> to automatically generate those for you, as is shown in the following example:
    </p>
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    SqlCommandBuilder mySqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter);
    </Tab>
    <Tab Name="VB">
    Dim myDataRowsCommandBuilder as SqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter)
    </Tab>
    <Tab Name="C++">
    SqlCommandBuilder * mySqlCommandBuilder = new SqlCommandBuilder(mySqlDataAdapter);
    </Tab>
    </Acme:TabControl>
    
    </p>
    
    <p>To submit the data from the DataSet into the database, use the <b>Update</b> method on
    the SqlDataAdapter.</p>
    
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    mySqlDataAdapter.Update(myDataSet, "Customers");
    </Tab>
    <Tab Name="VB">
    mySqlDataAdapter.Update(myDataSet, "Customers")
    </Tab>
    <Tab Name="C++">
    mySqlDataAdapter->Update(myDataSet, "Customers");
    </Tab>
    </Acme:TabControl>
    
    </p>
    
    <p>The following example demonstrates how to get data from a database using a SqlDataAdapter, modify
    the data within the DataSet, and then submit the data back to the database
    through the SqlDataAdapter.</p>
    
    <p>
    <Acme:LangSwitch runat="server">
      <CsTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/UpdatingData/cs/UpdatingData.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/UpdatingData/UpdatingData.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C# UpdatingData.aspx"
      runat="server" />
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/UpdatingData/vb/UpdatingData.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/UpdatingData/UpdatingData.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="VB UpdatingData.aspx"
      runat="server" />
      </VbTemplate>
      <CpTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/UpdatingData/CP"
      ViewSource="/quickstart/howto/samples/adoplus/UpdatingData/UpdatingData.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C++ UpdatingData.exe"
      MapRunSamplePath=true
      runat="server" />
      </CpTemplate>
    </Acme:LangSwitch>
    </p>
 <p>
  <!-- #include virtual="/quickstart/include/footer.inc" -->
  
  
  

