
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<h4>ADO.NET Overview</h4>

<p>
ADO.NET is an evolution of the ADO data access model that directly addresses
user requirements for developing scalable applications. It was designed specifically
for the web with scalability, statelessness, and XML in mind.
<p>
ADO.NET uses some ADO objects, such as the <B>Connection</b> and <B>Command</b> objects,
and also introduces new objects. Key new ADO.NET objects include the <B>DataSet</b>, <B>DataReader</b>, and <B>DataAdapter</b>.
<p>
The important distinction between this evolved stage of ADO.NET and previous
data architectures is that there exists an object -- the <B>DataSet</b> -- that is
separate and distinct from any data stores.  Because of that, the <B>DataSet</b> functions as a standalone entity. 
You can think of the DataSet as an always disconnected recordset that knows nothing about the source or destination of the data it contains. Inside a <B>DataSet</b>, much like in a database, there are
tables, columns, relationships, constraints, views, and so forth. 
<p>
A <B>DataAdapter</b> is the object that connects to the database to fill the <B>DataSet</b>. Then, it 
connects back to the database to update the data there, based on operations performed while the <B>DataSet</b> held the data. In the past, data processing has been primarily connection-based. Now, in an effort to
make multi-tiered apps more efficient, data processing is turning to a
message-based approach that revolves around chunks of information. At the
center of this approach is the <B>DataAdapter</b>, which provides a bridge to
retrieve and save data between a <B>DataSet</b> and its source data store. It
accomplishes this by means of requests to the appropriate SQL commands made against the
data store.
<p>
The XML-based <B>DataSet</b> object provides a
consistent programming model that works with all models of data storage: flat, relational, and hierarchical.
It does this by having no 'knowledge' of the source of its data, and by
representing the data that it holds as collections and data types.  No
matter what the source of the data within the <B>DataSet</b> is, it is manipulated
through the same set of standard APIs exposed through the <B>DataSet</b> and its
subordinate objects.
<p>
While the <B>DataSet</b> has no knowledge of the source of its data, the managed
provider has detailed and specific information.  The role of the managed
provider is to connect, fill, and persist the <B>DataSet</b> to and from data stores.
The OLE DB and SQL Server .NET Data Providers (System.Data.OleDb and System.Data.SqlClient) that are part of the .Net Framework provide four basic objects: the <B>Command</b>, <B>Connection</b>, <B>DataReader</b> and <B>DataAdapter</b>.
In the remaining sections of this document, we'll walk through each
part of the <B>DataSet</b> and the OLE DB/SQL Server .NET Data Providers explaining what they
are, and how to program against them.
<p>
The following sections will introduce you to some objects that have evolved,
and some that are new. These objects are:
<ul>
<li><B>Connections</b>. For connection to and managing transactions against a database.
<li><B>Commands</b>. For issuing SQL commands against a database.
<li><B>DataReaders</b>. For reading a forward-only stream of data records from a SQL Server data source.
<li><B>DataSets</b>. For storing, remoting and programming against flat data, XML data and relational data.
<li><B>DataAdapters</b>. For pushing data into a <B>DataSet</b>, and reconciling data against a database.
</ul>
<blockquote>
<p>
<B>Note</b> When dealing with connections to a database, there are two different
options: SQL Server .NET Data Provider (System.Data.SqlClient) and OLE DB .NET Data Provider (System.Data.OleDb). 
In these samples we will use the SQL Server .NET Data Provider.
These are written to talk directly to Microsoft SQL Server. The OLE DB .NET Data Provider
is used to talk to any OLE DB provider (as it uses OLE DB underneath).
</p>
</blockquote>


<a name="Connections" />
<span class="subhead">Connections</span>
<p>
Connections are used to 'talk to' databases, and are respresented by provider-specific classes such as <B>SQLConnection</b>. 
Commands travel over connections and resultsets are returned in the form of streams which can be read by a
<B>DataReader</b> object, or pushed into a <B>DataSet</b> object.
<p>

The example below shows how to create a connection object. Connections can be opened
explicitly by calling the <B>Open</b> method on the connection, or will be opened
implicitly when using a <B>DataAdapter</b>.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview1/cs/adooverview1.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview1/adooverview1.src"
  Icon="/quickstart/howto/images/ado1.gif"
  Caption="C# AdoOverview1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview1/vb/adooverview1.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview1/adooverview1.src"
  Icon="/quickstart/howto/images/ado1.gif"
  Caption="VB AdoOverview1.aspx"
  runat="server" />
  </VbTemplate>
 <CpTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview1/CP"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview1/adooverview1.src"
  Icon="/quickstart/howto/images/ado1.gif"
  Caption="C++ AdoOverview1.exe"
  MapRunSamplePath=true
  runat="server" />
  </CpTemplate>
</Acme:LangSwitch>


<p>
<a name="Commands" />
<span class="subhead">Commands</span>
<p>
Commands contain the information that is submitted to a database, and are represented by provider-specific classes such as 
<B>SQLCommand</b>. A command can be a stored procedure call, an UPDATE statement, or a statement that
returns results. You can also use input and output parameters, and return
values as part of your command syntax. The example below shows how to issue an INSERT statement 
against the <B>Northwind</b> database.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview2/cs/adooverview2.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview2/adooverview2.src"
  Icon="/quickstart/howto/images/ado2.gif"
  Caption="C# AdoOverview2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview2/vb/adooverview2.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview2/adooverview2.src"
  Icon="/quickstart/howto/images/ado2.gif"
  Caption="VB AdoOverview2.aspx"
  runat="server" />
  </VbTemplate>
 <CpTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview2/CP"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview2/adooverview2.src"
  Icon="/quickstart/howto/images/ado2.gif"
  Caption="C++ AdoOverview2.exe"
  MapRunSamplePath=true
  runat="server" />
  </CpTemplate>
</Acme:LangSwitch>


<p>
<a name="DataReaders" />
<span class="subhead">DataReaders</span>
<p>
The <B>DataReader</b> object is somewhat synonymous with a read-only/forward-only cursor
over data. The <B>DataReader</b> API supports flat as well as hierarchical data. A <B>DataReader</b> object is returned
after executing a command against a database. The format of the returned <B>DataReader</b> object is different from a recordset.For example, you might use the <B>DataReader</b> to show the
results of a search list in a web page. 
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview3/cs/adooverview3.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview3/adooverview3.src"
  Icon="/quickstart/howto/images/ado3.gif"
  Caption="C# AdoOverview3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview3/vb/adooverview3.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview3/adooverview3.src"
  Icon="/quickstart/howto/images/ado3.gif"
  Caption="VB AdoOverview3.aspx"
  runat="server" />
  </VbTemplate>
 <CpTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview3/CP"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview3/adooverview3.src"
  Icon="/quickstart/howto/images/ado3.gif"
  Caption="C++ AdoOverview3.exe"
  MapRunSamplePath=true
  runat="server" />
  </CpTemplate>

</Acme:LangSwitch>


<p>
<a name="DataSetsAndDataAdapters" />
<span class="subhead">DataSets and DataAdapters</span>
<p>
<B>DataSets</B><br>
The <B>DataSet</b> object is similar to the ADO <B>Recordset</b> object, but more powerful, and with one other important distinction: the <B>DataSet</b> is always disconnected. The <B>DataSet</b> object represents a cache of data, with
database-like structures such as tables, columns, relationships, and
constraints. However, though a <B>DataSet</b> can and does behave much
like a database, it is important to remember that <B>DataSet</b> objects do not interact directly
with databases, or other source data. This allows the developer to work with a programming model that is always consistent,
regardless of where the source data resides. Data coming from a database, an XML file, from code, or user input can all
be placed into <B>DataSet</b> objects. Then, as changes are made to the <B>DataSet</b> they can be tracked and verified before updating the source data. The <B>GetChanges</b> method of the <B>DataSet</b> object actually creates a second <B>DatSet</b> that contains only the changes to the data. This <B>DataSet</b> is then used by a <B>DataAdapter</b> (or other
objects) to update the original data source.
<p>
The <B>DataSet</b> has many XML characteristics, including the ability to produce
and consume XML data and XML schemas. XML schemas can be used to describe
schemas interchanged via XML Web services.  In fact, a <B>DataSet</b> with a schema can
actually be compiled for type safety and statement completion.
<p>
<B>DataAdapters (OLEDB/SQL)</B><br>
The <B>DataAdapter</b> object works as a bridge between the <B>DataSet</b> and the source data. Using the provider-specific <B>SqlDataAdapter</b> (along with its associated <B>SqlCommand</b> and <B>SqlConnection</b>) can increase overall performance when working with a Microsoft SQL Server databases. For other OLE DB-supported databases, you would use the <B>OleDbDataAdapter</b> object and its associated <B>OleDbCommand</b> and <B>OleDbConnection</b> objects.
<p>
The <B>DataAdapter</b> object uses commands to update the data source after changes have been made to the <B>DataSet</b>. Using the <B>Fill</b> method of the <B>DataAdapter</b> calls the SELECT command; using the <B>Update</b> method calls the INSERT, UPDATE or DELETE command for each changed row. You can explicitly set these commands in order to control the statements used at runtime to resolve changes, including the use of stored procedures. For ad-hoc scenarios, a <B>CommandBuilder</b> object can generate these at run-time based upon a select statement. However, this run-time
generation requires an extra round-trip to the server in order to gather required metadata,
so explicitly providing the INSERT, UPDATE, and DELETE commands at design time will result in
better run-time performance.
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">

SqlConnection myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind");
SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection);

mySqlDataAdapter.InsertCommand.CommandText = "sp_InsertCustomer";
mySqlDataAdapter.InsertCommand.CommandType = CommandType.StoredProcedure;
mySqlDataAdapter.DeleteCommand.CommandText = "sp_DeleteCustomer";
mySqlDataAdapter.DeleteCommand.CommandType = CommandType.StoredProcedure;
mySqlDataAdapter.UpdateCommand.CommandText = "sp_UpdateCustomers";
mySqlDataAdapter.UpdateCommand.CommandType = CommandType.StoredProcedure;
</Tab>
<Tab Name="VB">

Dim myConnection As SqlConnection = New SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
Dim mySqlDataAdapter As SqlDataAdapter = New SqlDataAdapter("select * from customers", myConnection)

mySqlDataAdapter.InsertCommand.CommandText = "sp_InsertCustomer"
mySqlDataAdapter.InsertCommand.CommandType = CommandType.StoredProcedure
mySqlDataAdapter.DeleteCommand.CommandText = "sp_DeleteCustomer"
mySqlDataAdapter.DeleteCommand.CommandType = CommandType.StoredProcedure
mySqlDataAdapter.UpdateCommand.CommandText = "sp_UpdateCustomers"
mySqlDataAdapter.UpdateCommand.CommandType = CommandType.StoredProcedure
</Tab>
<Tab Name="C++">

SqlConnection * myConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind");
SqlDataAdapter * mySqlDataAdapter = new SqlDataAdapter("select * from customers", myConnection);

mySqlDataAdapter->InsertCommand->CommandText = "sp_InsertCustomer";
mySqlDataAdapter->InsertCommand->CommandType = CommandType.StoredProcedure;
mySqlDataAdapter->DeleteCommand->CommandText = "sp_DeleteCustomer";
mySqlDataAdapter->DeleteCommand->CommandType = CommandType.StoredProcedure;
mySqlDataAdapter->UpdateCommand->CommandText = "sp_UpdateCustomers";
mySqlDataAdapter->UpdateCommand->CommandType = CommandType.StoredProcedure;
</Tab>
</Acme:TabControl>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
mySqlDataAdapter.Update(myDataSet);
</Tab>
<Tab Name="VB">
mySqlDataAdapter.Update(myDataSet)
</Tab>
<Tab Name="C++">
mySqlDataAdapter->Update(myDataSet);
</Tab>
</Acme:TabControl>
<p>

The records are appropriately mapped to the given commands accordingly.
<p>

<img border=1 src="/quickstart/howto/images/AdoDataSet.gif"><br>
<font size=-1 >Figure: DataAdapters and DataSets</font>

<p>
The sample below illustrates loading a <B>DataAdapter</b> via a SELECT statement.
Then it updates, deletes and adds some records within the <B>DataSet</b>. Finally, it
returns those updates to the source database via the <B>DataAdapter</b>. The constructed
DeleteCommand, InsertCommand and UpdateCommand are shown in the page. It also
illustrates using multiple <B>DataAdapter</b> objects to load multiple tables (Customers and Orders) into the
<B>DataSet</b>.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview4/cs/adooverview4.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview4/adooverview4.src"
  Icon="/quickstart/howto/images/ado4.gif"
  Caption="C# AdoOverview4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview4/vb/adooverview4.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview4/adooverview4.src"
  Icon="/quickstart/howto/images/ado4.gif"
  Caption="VB AdoOverview4.aspx"
  runat="server" />
  </VbTemplate>
 <CpTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/adooverview4/CP"
  ViewSource="/quickstart/howto/samples/adoplus/adooverview4/adooverview4.src"
  Icon="/quickstart/howto/images/ado4.gif"
  Caption="C++ AdoOverview4.exe"
  MapRunSamplePath=true
  runat="server" />
  </CpTemplate>
</Acme:LangSwitch>


<h4>Section Summary</h4>
<ol>
  <li>ADO.NET is the next evolution of ADO for the .Net Framework.
  <li>ADO.NET was created with n-Tier, statelessness and XML in the forefront. Two new
    objects, the <B>DataSet</b> and <B>DataAdapter</b>, are provided for these scenarios.
  <li>ADO.NET can be used to get data from a stream, or to store data in a cache for updates.
  <li>There is a lot more information about ADO.NET in the documentation.
  <li>Remember, you can execute a command directly against the database
in order to do inserts, updates, and deletes. You don't need to first put data into a <B>DataSet</b> in order
to insert, update, or delete it.
  <li>Also, you can use a <B>DataSet</b> to bind to the data, move through the data, and navigate data relationships.
</ol>

<p>
<!-- #include virtual="/quickstart/include/footer.inc" -->