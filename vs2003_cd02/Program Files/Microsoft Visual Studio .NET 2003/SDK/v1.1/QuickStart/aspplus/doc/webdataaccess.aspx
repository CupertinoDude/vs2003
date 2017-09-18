<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" 
    Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Server-Side Data Access</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#serverdata">Introduction to Server-Side Data</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#adoplus">Connections, Commands, and DataSets</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#sqldata">Accessing SQL-based Data</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#select">Binding SQL Data to a DataGrid</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#param">Performing a Parameterized Select</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#insert">Inserting Data in a SQL Database</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#update">Updating Data in a SQL Database</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#delete">Deleting Data in a SQL Database</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#sort">Sorting Data from a SQL Database</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#masterdetail">Working with Master-Detail 
        Relationships</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#storedprocs">Writing and Using Stored Procedures</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#xmldata">Accessing XML-based Data</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
        <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="serverdata">
<span class="subhead">Introduction to Server-Side Data</span>

<p>
Data access is the heart of any real-world application, and ASP.NET provides a rich
set of controls that are well-integrated with the managed data access APIs
provided in the common language runtime.  This section walks through several
iterations of a sample that uses the ASP.NET <b>DataGrid</b> control to bind 
to the results of SQL queries and XML data files.  This section assumes some 
familiarity with database fundamentals and the SQL query language.</p>

<p>
Server-side data access is unique in that Web pages are basically stateless, which
presents some difficult challenges when trying to perform transactions such as
inserting or updating records from a set of data retrieved from a database. As
you'll see in this section, the <b>DataGrid</b> control can help manage these challenges,
allowing you to concentrate more on your application logic and less on the details
of state management and event handling.</p>

<!--BEGIN SECTION-->
<br>
<a name="adoplus">
<br>
<span class="subhead">Connections, Commands, and Datasets</span>
<p>
The common language runtime provides a complete set of managed data access APIs for
data-intensive application development.  These APIs help to abstract the data and
present it in a consistent way regardless of its actual source (SQL Server,
OLEDB, XML, and so on). There are essentially three objects you will work with most
often: connections, commands, and datasets.</p>

<ul>
<li>A connection represents a physical connection to some data store, such
  as SQL Server or an XML file.
<li>A command represents a directive to retrieve from (select) or
  manipulate (insert, update, delete) the data store.
<li>A dataset represents the actual data an application works with. Note
  that datasets are always disconnected from their source connection and data
  model and can be modified independently. However, changes to a dataset can be
  easily reconciled with the originating data model.
</ul>

<p>For a more detailed walkthrough of the managed data access solution in the 
common language runtime, please read the 
<a href="/quickstart/aspplus/doc/adoplusoverview.aspx">ADO.NET Overview</a> 
section of this tutorial.

<!--BEGIN SECTION-->
<br>
<a name="sqldata">
<br>
<span class="subhead">Accessing SQL-based Data</span>

<p>
An application typically needs to perform one or more select, insert, update, 
or delete queries to a SQL database.  The following table shows an example of each of
these queries.
</p>

<p>
<table class="table2" width="80%" cellpadding=3>
<tr>
<th width="150">
Query
</th>
<th>
Example
</th>
</tr>
<tr>
<td>
<b>Simple Select</b>
</td>
<td>
SELECT * from Employees WHERE FirstName = 'Bradley';
</td>
</tr>
<tr>
<td>
<b>Join Select</b>
</td>
<td>
SELECT * from Employees E, Managers M WHERE E.FirstName = M.FirstName;
</td>
</tr>
<tr>
<td>
<b>Insert</b>
</td>
<td>
INSERT into Employees VALUES ('123-45-6789','Bradley','Millington','Program Manager');
</td>
</tr>
<tr>
<td>
<b>Update</b>
</td>
<td>
UPDATE Employees SET Title = 'Development Lead' WHERE FirstName = 'Bradley';
</td>
</tr>
<tr>
<td>
<b>Delete</b>
</td>
<td>
DELETE from Employees WHERE Productivity < 10;
</td>
</tr>

</table>
<p>
To give your page access to the classes you will need to perform SQL data access, 
you must import the <b>System.Data</b> and
<b>System.Data.SqlClient</b> namespaces into your page.
<p>

<div class="code"><pre>
&lt;%@ Import Namespace="System.Data" %&gt;
&lt;%@ Import Namespace="System.Data.SqlClient" %&gt;
</pre></div>

<p>
To perform a select query to a SQL database, you create a <b>SqlConnection</b> 
to the database passing the connection string, and then
construct a <b>SqlDataAdapter</b> object that contains your query statement.  
To populate a <b>DataSet</b> object with the results from the query,
you call the command's <b>Fill</b> method.
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
SqlConnection myConnection = new SqlConnection(
    "server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
SqlDataAdapter myCommand = new SqlDataAdapter("select * from Authors", myConnection);

DataSet ds = new DataSet();
myCommand.Fill(ds, "Authors");
</Tab>

<Tab Name="VB">
Dim myConnection As New SqlConnection( _
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
Dim myCommand As New SqlDataAdapter("select * from Authors", myConnection)

Dim ds As New DataSet()
myCommand.Fill(ds, "Authors")
</Tab>

<Tab Name="JScript">
var myConnection:SqlConnection = new SqlConnection(
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI");
var myCommand:SqlDataAdapter = new SqlDataAdapter("select * from Authors", myConnection);

var ds:DataSet = new DataSet();
myCommand.Fill(ds, "Authors");
</Tab>

</Acme:TabControl>
<p>

As mentioned earlier in this section, the benefit of using a dataset is 
that it gives you a
disconnected view of the database.  You can operate on a dataset in your 
application, and then
reconcile your changes with the actual database later.  For long-running 
applications this is
often the best approach. For Web applications, you are usually performing short
operations with each request (commonly to simply display the data). You 
often don't need to
hold a <b>DataSet</b> object over a series of several requests.  For 
situations like these, you can use a
<b>SqlDataReader</b>.
<p>
A <b>SqlDataReader</b> provides a forward-only, read-only pointer over 
data retrieved from a SQL database. 
To use a <b>SqlDataReader</b>, you declare a <b>SqlCommand</b> instead 
of a <b>SqlDataAdapter</b>.
The <b>SqlCommand</b> exposes an <b>ExecuteReader</b> method that 
returns a <b>SqlDataReader</b>.  
Note also that you must explicitly open and close the <b>SqlConnection</b> when you
use a <b>SqlCommand</b>.  After a call to <b>ExecuteReader</b>, the 
<b>SqlDataReader</b> can be bound to 
an ASP.NET server control, as you'll see in the next section.


<p><Acme:TabControl runat="server">
<Tab Name="C#">
SqlConnection myConnection = new SqlConnection(
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI");
SqlCommand myCommand = new SqlCommand("select * from Authors", myConnection);

myConnection.Open();


SqlDataReader dr = myCommand.ExecuteReader();

...

myConnection.Close();
</Tab>

<Tab Name="VB">
Dim myConnection As SqlConnection = New SqlConnection( _
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
Dim myCommand As SqlCommand = New SqlCommand("select * from Authors", myConnection)

myConnection.Open()


Dim dr As SqlDataReader = myCommand.ExecuteReader()

...

myConnection.Close()
</Tab>

<Tab Name="JScript">
var myConnection:SqlConnection = new SqlConnection(
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI");
var myCommand:SqlCommand = new SqlCommand("select * from Authors", myConnection);

myConnection.Open();

var dr : SqlDataReader;
dr = myCommand.ExecuteReader();

...

myConnection.Close();
</Tab>

</Acme:TabControl>
<p>


When performing commands that do not require data to be returned, 
such as inserts, updates, and deletes,
you also use a <b>SqlCommand</b>.  The command is issued by calling 
an <b>ExecuteNonQuery</b>
method, which returns the number of rows affected.  Note that the 
connection must be explicitly opened when you use the
<b>SqlCommand</b>; the <b>SqlDataAdapter</b> automatically handles 
opening the connection for you.
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
SqlConnection myConnection = new SqlConnection(
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI");
SqlCommand myCommand = new SqlCommand(
    "UPDATE Authors SET phone='(800) 555-5555' WHERE au_id = '123-45-6789'", myConnection);

myCommand.Connection.Open();
myCommand.ExecuteNonQuery();
myCommand.Connection.Close();
</Tab>

<Tab Name="VB">
Dim myConnection As New SqlConnection( _
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
Dim myCommand As New SqlCommand( _
    "UPDATE Authors SET phone='(800) 555-5555' WHERE au_id = '123-45-6789'", myConnection)

myCommand.Connection.Open()
myCommand.ExecuteNonQuery()
myCommand.Connection.Close()
</Tab>

<Tab Name="JScript">
var myConnection:SqlConnection = new SqlConnection(
    "server=(local)\NetSDK;database=pubs;Integrated Security=SSPI");
var myCommand:SqlCommand = new SqlCommand(
    "UPDATE Authors SET phone='(800) 555-5555' WHERE au_id = '123-45-6789'", myConnection);

myCommand.Connection.Open();
myCommand.ExecuteNonQuery();
myCommand.Connection.Close();
</Tab>

</Acme:TabControl><p>

<p>
<b>Important:   </b> Always remember to close the connection to the 
data model before the page finishes executing.  If you do
not close the connection, you might inadvertently exhaust the connection 
limit while waiting for the page instances to be
handled by garbage collection.

<!--BEGIN SECTION-->
<br>
<a name="select">
<br>
<span class="subhead">Binding SQL Data to a DataGrid</span>
<p>
The following sample shows a simple select query bound to a 
<b>DataGrid</b> control.  The <b>DataGrid</b> renders a
table containing the SQL data.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid1.src"
  Icon="/quickstart/aspplus/images/datagrid1.gif"
  Caption="C# DataGrid1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid1.src"
  Icon="/quickstart/aspplus/images/datagrid1.gif"
  Caption="VB DataGrid1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid1.src"
  Icon="/quickstart/aspplus/images/datagrid1.gif"
  Caption="JScript DataGrid1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

The <b>DataGrid</b> control supports a
<b>DataSource</b> property that takes any object that implements the 
<b>IList</b> or <b>IListSource</b> interfaces.
You can use a <b>DataSet</b> by assigning the <b>DefaultView</b> 
property of a table contained in
the <b>DataSet</b> to the name of the table you wish to use within 
the <b>DataSet</b>.  The <b>DefaultView</b> property
represents the current state of a table within a <b>DataSet</b>, 
including any changes which have
been made by application code (row deletions or value changes, for example).  
After setting
the <b>DataSource</b> property, you call <code>DataBind()</code> to populate the control.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
MyDataGrid.DataSource=ds.Tables["Authors"].DefaultView;
MyDataGrid.DataBind();
</Tab>

<Tab Name="VB">
MyDataGrid.DataSource=ds.Tables("Authors").DefaultView
MyDataGrid.DataBind()
</Tab>

<Tab Name="JScript">
MyDataGrid.DataSource=ds.Tables["Authors"].DefaultView;
MyDataGrid.DataBind();
</Tab>
</Acme:TabControl>

<p>
An alternative syntax is to specify both a <b>DataSource</b> and a 
<b>DataMember</b>.  In this case, ASP.NET
automatically gets the <b>DefaultView</b> for you.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
MyDataGrid.DataSource=ds;
MyDataGrid.DataMember="Authors";
MyDataGrid.DataBind();
</Tab>

<Tab Name="VB">
MyDataGrid.DataSource=ds
MyDataGrid.DataMember="Authors"
MyDataGrid.DataBind()
</Tab>

<Tab Name="JScript">
MyDataGrid.DataSource=ds;
MyDataGrid.DataMember="Authors";
MyDataGrid.DataBind();
</Tab>
</Acme:TabControl>


<p>
You can also bind directly to a <b>SqlDataReader</b>.  In this case 
you are only displaying data, so the
forward-only nature of the <b>SqlDataReader</b> is perfectly suited 
to this scenario, and you benefit from
the performance boost that <b>SqlDataReader</b> provides.


<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid1.1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid1.1.src"
  Icon="/quickstart/aspplus/images/datagrid1.gif"
  Caption="C# DataGrid1.1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid1.1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid1.1.src"
  Icon="/quickstart/aspplus/images/datagrid1.gif"
  Caption="VB DataGrid1.1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid1.1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid1.1.src"
  Icon="/quickstart/aspplus/images/datagrid1.gif"
  Caption="JScript DataGrid1.1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<b>Note:</b>   For the remainder of this section, only the 
<b>DataSet</b> model of data access is shown; however, any
of these samples could be re-written to take advantage of <b>SQLDataReader</b> as well.

<!--BEGIN SECTION-->
<br>
<a name="param">
<br>
<span class="subhead">Performing a Parameterized Select</span>
<p>

You can also perform a parameterized select using the 
<b>SqlDataAdapter</b> object.  The following sample shows how you can modify the
data selected using the value posted from a select <b>HtmlControl</b>.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid2.src"
  Icon="/quickstart/aspplus/images/datagrid2.gif"
  Caption="C# DataGrid2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid2.src"
  Icon="/quickstart/aspplus/images/datagrid2.gif"
  Caption="VB DataGrid2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid2.src"
  Icon="/quickstart/aspplus/images/datagrid2.gif"
  Caption="JScript DataGrid2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The <b>SqlDataAdapter</b> maintains a <b>Parameters</b> collection 
that can be used to replace variable identifiers
(denoted by an "@" in front of the name) with values.  You add a new 
<b>SqlParameter</b> to this collection that specifies the
name, type, and size of the parameter, and then set its <b>Value</b> 
property to the value of the select.
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
myCommand.SelectCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.NVarChar, 2));
myCommand.SelectCommand.Parameters["@State"].Value = MySelect.Value;
</Tab>

<Tab Name="VB">
myCommand.SelectCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NVarChar, 2))
myCommand.SelectCommand.Parameters("@State").Value = MySelect.Value
</Tab>

<Tab Name="JScript">
myCommand.SelectCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.NVarChar, 2));
myCommand.SelectCommand.Parameters("@State").Value = MySelect.Value;
</Tab>

</Acme:TabControl><p>

<p>
<b>Important: </b>   Note that the <b>DataGrid</b>'s <b>EnableViewState</b> 
property has been set to <b>false</b>. If the data will be populated in each request,
there is no benefit to having the <b>DataGrid</b> store state information 
to be sent through a round trip with form posts. Because the <b>DataGrid</b> stores all
of its data when maintaining state, it is important to turn it off when 
appropriate to improve the performance of your pages.
<p>

DataGrid2.aspx statically populates the values of the select box, but 
this will not work well if those values ever change in the
database.  Because the select <b>HtmlControl</b> also supports an 
<b>IEnumerable DataSource</b> property, you can use a select query to dynamically
populate the select box instead, which guarantees that the database 
and user interface are always in sync.  The following sample demonstrates this process.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid3.src"
  Icon="/quickstart/aspplus/images/datagrid3.gif"
  Caption="C# DataGrid3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid3.src"
  Icon="/quickstart/aspplus/images/datagrid3.gif"
  Caption="VB DataGrid3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid3.src"
  Icon="/quickstart/aspplus/images/datagrid3.gif"
  Caption="JScript DataGrid3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="insert">
<br>
<span class="subhead">Inserting Data in a SQL Database</span>
<p>

To insert a row into the database, you can add a simple input 
form to the page, and execute an insert command in the form submit
event handler.  Just as in the previous two samples, you use the 
command object's Parameters collection to populate the
command's values.  Note that you also check to make sure the required 
values are not null before attempting to insert into the
database.  This prevents an accidental violation of the database's 
field constraints.  You also execute the insert command inside of
a try/catch block, just in case the primary key for inserted row already exists.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid4.src"
  Icon="/quickstart/aspplus/images/datagrid4.gif"
  Caption="C# DataGrid4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid4.src"
  Icon="/quickstart/aspplus/images/datagrid4.gif"
  Caption="VB DataGrid4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid4.src"
  Icon="/quickstart/aspplus/images/datagrid4.gif"
  Caption="JScript DataGrid4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Instead of explicitly checking the input values, you could have 
just as easily used the validator controls provided with ASP.NET.  The following 
sample shows how to do that.  Note that using the RegEx Validator 
provides the additional benefit of checking the format for the author
ID, zip code, and phone number fields.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid5.src"
  Icon="/quickstart/aspplus/images/datagrid5.gif"
  Caption="C# DataGrid5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid5.src"
  Icon="/quickstart/aspplus/images/datagrid5.gif"
  Caption="VB DataGrid5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid5.src"
  Icon="/quickstart/aspplus/images/datagrid5.gif"
  Caption="JScript DataGrid5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="update">
<br>
<span class="subhead">Updating Data in a SQL Database</span>
<p>
Updating a database can often be tricky in Web applications.  
The <b>DataGrid</b> control provides some built-in support for this scenario that
makes updates easier.  To allow rows to be edited, the <b>DataGrid</b> 
supports an integer <b>EditItemIndex</b> property, which indicates which row
of the grid should be editable.  When this property is set, the <b>DataGrid</b> 
renders the row at that index as text input boxes instead of
simple labels.  A value of -1 (the default) indicates that no rows are 
editable.  The page can enclose the <b>DataGrid</b> in a server-side form and
get access to the edited data through the <b>DataGrid</b>'s object model.
<p>
To figure out which row should be editable, you need a way to accept 
some input from the user about which row they would like to edit.
The <b>DataGrid</b> can contain an <b>EditCommandColumn</b> that renders 
links for firing three special events: <b>EditCommand</b>,
<b>UpdateCommand</b>, and <b>CancelCommand</b>.  The <b>EditCommandColumn</b> 
is declaratively added to the <b>DataGrid</b>'s Columns
collection, as shown in the following example.

<div class="code"><pre>
&lt;ASP:DataGrid id="MyDataGrid" runat="server"
  ...
  OnEditCommand="MyDataGrid_Edit"
  OnCancelCommand="MyDataGrid_Cancel"
  OnUpdateCommand="MyDataGrid_Update"
  DataKeyField="au_id"
&gt;

  &lt;Columns&gt;
    &lt;asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" /&gt;
  &lt;/Columns&gt;

&lt;/ASP:DataGrid&gt;
</pre></div>

On the <b>DataGrid</b> tag itself, you wire event handlers to 
each of the commands fired from the <b>EditCommandColumn</b>.
The <b>DataGridCommandEventArgs</b> argument of these handlers 
gives you direct access to the index selected by
the client, which you use to set the <b>DataGrid</b>'s <b>EditItemIndex</b>.  
Note that you need to re-bind the <b>DataGrid</b> for the change
to take effect, as shown in the following example.
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
public void MyDataGrid_Edit(Object sender, DataGridCommandEventArgs E) {
    MyDataGrid.EditItemIndex = (int)E.Item.ItemIndex;
    BindGrid();
}
</Tab>

<Tab Name="VB">
Public Sub MyDataGrid_Edit(sender As Object, E As DataGridCommandEventArgs)
    MyDataGrid.EditItemIndex = E.Item.ItemIndex
    BindGrid()
End Sub
</Tab>

<Tab Name="JScript">
public function MyDataGrid_Edit(sender:Object, E:DataGridCommandEventArgs) : void {
    MyDataGrid.EditItemIndex = int(E.Item.ItemIndex);
    BindGrid();
}
</Tab>

</Acme:TabControl><p>

<p>
When a row of the <b>DataGrid</b> is being edited, the 
<b>EditCommandColumn</b> renders the <b>Update</b> and <b>Cancel</b> links.  
If the client selects <b>Cancel</b>,
you simply set the <b>EditItemIndex</b> back to -1.  If the client selects 
<b>Update</b>, however, you need to execute your update command to the
database.  Performing an update query requires that you know the primary key 
in the database for the row you wish to update.  To
support this, the <b>DataGrid</b> exposes a <b>DataKeyField</b> property 
that you can set to the field name for the primary key.  In the
event handler wired to the <b>UpdateCommand</b>, you can retrieve the key 
name from the <b>DataGrid</b>'s DataKeys collection.  You
index into this collection using the <b>ItemIndex</b> of the event, as shown 
in the following example.
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
myCommand.Parameters["@Id"].Value = MyDataGrid.DataKeys[(int)E.Item.ItemIndex];
</Tab>

<Tab Name="VB">
myCommand.Parameters("@Id").Value = MyDataGrid.DataKeys(CType(E.Item.ItemIndex, Integer))
</Tab>

<Tab Name="JScript">
myCommand.Parameters["@Id"].Value = MyDataGrid.DataKeys[int(E.Item.ItemIndex)];
</Tab>

</Acme:TabControl><p>

<p>
At the end of the Update event handler, you set the <b>EditItemIndex</b> 
back to -1.  The following sample demonstrates this code in action.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid6.src"
  Icon="/quickstart/aspplus/images/datagrid6.gif"
  Caption="C# DataGrid6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid6.src"
  Icon="/quickstart/aspplus/images/datagrid6.gif"
  Caption="VB DataGrid6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid6.src"
  Icon="/quickstart/aspplus/images/datagrid6.gif"
  Caption="JScript DataGrid6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
One problem with the preceding example is that the primary key field 
(au_id) also renders as a text input box when a row is editable.
You don't want the client to change this value, because you need it to 
determine which row to update in the database.  Fortunately, you can
disable this column from rendering as a text box by specifying exactly 
what each column looks like for the editable row.  You do this
by defining each row in the <b>DataGrid</b>'s Columns collection, using 
the <b>BoundColumn</b> control to assign data fields with each
column.  Using this technique gives you complete control over the order 
of the columns, as well as their <b>ReadOnly</b> properties.  For the
au_id column you set the <b>ReadOnly</b> property to <b>true</b>.  When 
a row is in edit mode, this column will continue to render as a Label. 
The following sample demonstrates this technique.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid7.src"
  Icon="/quickstart/aspplus/images/datagrid7.gif"
  Caption="C# DataGrid7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid7.src"
  Icon="/quickstart/aspplus/images/datagrid7.gif"
  Caption="VB DataGrid7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid7.src"
  Icon="/quickstart/aspplus/images/datagrid7.gif"
  Caption="JScript DataGrid7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<b>BoundColumn</b> controls aren't the only controls you can set 
in the <b>DataGrid</b>'s Columns collection.  You can also specify a 
<b>TemplateColumn</b>,
which gives you complete control over the contents of the column.  
The template is just arbitrary content; you can render anything
you like, including server controls, inside the <b>DataGrid</b>'s columns.  
The following sample demonstrates using the <b>TemplateColumn</b> control to
render the "State" column as a drop-down list and the "Contract" column 
as a check box HtmlControl.  The ASP.NET data binding syntax
is used to output the data field value within the template.  Note that 
there is a bit of tricky logic to make the drop-down list and
check box reflect the state of the data inside the row.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid8.src"
  Icon="/quickstart/aspplus/images/datagrid8.gif"
  Caption="C# DataGrid8.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid8.src"
  Icon="/quickstart/aspplus/images/datagrid8.gif"
  Caption="VB DataGrid8.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid8.src"
  Icon="/quickstart/aspplus/images/datagrid8.gif"
  Caption="JScript DataGrid8.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Just as you can place a drop-down list or check box HtmlControl in a 
<b>TemplateColumn</b>, you can also place other controls there.  The following 
sample adds <b>Validator</b> controls to the columns to check the client 
input before attempting to perform the update.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid9.src"
  Icon="/quickstart/aspplus/images/datagrid9.gif"
  Caption="C# DataGrid9.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid9.src"
  Icon="/quickstart/aspplus/images/datagrid9.gif"
  Caption="VB DataGrid9.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid9.src"
  Icon="/quickstart/aspplus/images/datagrid9.gif"
  Caption="JScript DataGrid9.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="delete">
<br>
<span class="subhead">Deleting Data in a SQL Database</span>
<p>
Deleting from a database is very similar to an update or insert command, 
but you still need a way to determine the particular row of
the grid to delete.  Another control that can be added to the 
<b>DataGrid</b>'s Columns collection is the <b>ButtonColumn</b> control, which
simply renders a button control.  <b>ButtonColumn</b> supports a 
<b>CommandName</b> property that can be set to <b>Delete</b>.  On the <b>DataGrid</b>,
you wire an event handler to the <b>DeleteCommand</b>, where you 
perform the delete operation.  Again, you use the DataKeys collection
to determine the row selected by the client. The following sample 
demonstrates this process.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid10.src"
  Icon="/quickstart/aspplus/images/datagrid10.gif"
  Caption="C# DataGrid10.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid10.src"
  Icon="/quickstart/aspplus/images/datagrid10.gif"
  Caption="VB DataGrid10.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid10.src"
  Icon="/quickstart/aspplus/images/datagrid10.gif"
  Caption="JScript DataGrid10.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="sort">
<br>
<span class="subhead">Sorting Data from a SQL Database</span>
<p>
A common requirement for any grid is the ability to sort the data it contains.  
While the <b>DataGrid</b> control doesn't explicitly sort its
data for you, it does provide a way to call an event handler when the user 
clicks a column header, which you can use to
sort the data.  When the <b>DataGrid</b>'s <b>AllowSorting</b> property is 
set to <b>true</b>, it renders hyperlinks for the column headers that
fire a <b>Sort</b> command back to the grid.  You set the <b>OnSortCommand</b> 
property of the <b>DataGrid</b> to the handler you want to
call when the user clicks a column link.  The name of the column is passed 
as a <b>SortExpression</b> property on the
<b>DataGridSortCommandEventArgs</b> argument, which you can use to set the 
<b>Sort</b> property of the
<b>DataView</b> bound to the grid. The following example demonstrates this process.<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script&gt;
    protected void MyDataGrid_Sort(Object Src, DataGridSortCommandEventArgs E) {
        ...
        DataView Source = ds.Tables["Authors"].DefaultView;
        Source.Sort = E.SortExpression;
        MyDataGrid.DataBind();
    }
&lt;/script&gt;

&lt;form runat="server"&gt;
    &lt;ASP:DataGrid id="MyDataGrid" OnSortCommand="MyDataGrid_Sort" 
        AllowSorting="true" runat="server" /&gt;
&lt;/form&gt;
</Tab>

<Tab Name="VB">
&lt;script&gt;
    Protected Sub MyDataGrid_Sort(Src As Object, E As DataGridSortCommandEventArgs)
        ...
        DataView Source = ds.Tables("Authors").DefaultView
        Source.Sort = E.SortExpression
        MyDataGrid.DataBind()
    End Sub
&lt;/script&gt;

&lt;form runat="server"&gt;
    &lt;ASP:DataGrid id="MyDataGrid" OnSortCommand="MyDataGrid_Sort" 
        AllowSorting="true" runat="server" /&gt;
&lt;/form&gt;
</Tab>

<Tab Name="JScript">
&lt;script&gt;
    protected function MyDataGrid_Sort(Src:Object, E:DataGridSortCommandEventArgs) : void {
        ...
        var Source:DataView = ds.Tables["Authors"].DefaultView;
        Source.Sort = E.SortExpression;
        MyDataGrid.DataBind();
    }
&lt;/script&gt;

&lt;form runat="server"&gt;
    &lt;ASP:DataGrid id="MyDataGrid" OnSortCommand="MyDataGrid_Sort" 
        AllowSorting="true" runat="server" /&gt;
&lt;/form&gt;
</Tab>

</Acme:TabControl><p>

<p>
The following sample shows this code in action.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid11.src"
  Icon="/quickstart/aspplus/images/datagrid11.gif"
  Caption="C# DataGrid11.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid11.src"
  Icon="/quickstart/aspplus/images/datagrid11.gif"
  Caption="VB DataGrid11.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid11.src"
  Icon="/quickstart/aspplus/images/datagrid11.gif"
  Caption="JScript DataGrid11.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
When using <b>BoundColumn</b> controls, you can explicitly set the 
<b>SortExpression</b> property for each column, as demonstrated in the following sample.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid12.src"
  Icon="/quickstart/aspplus/images/datagrid12.gif"
  Caption="C# DataGrid12.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid12.src"
  Icon="/quickstart/aspplus/images/datagrid12.gif"
  Caption="VB DataGrid12.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid12.src"
  Icon="/quickstart/aspplus/images/datagrid12.gif"
  Caption="JScript DataGrid12.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="masterdetail">
<br>
<span class="subhead">Working with Master-Detail Relationships</span>
<p>

Often your data model will contain relationships that cannot be 
represented using just a single grid.  A very common Web-based interface
is one in which a row of data can be selected that navigates the client 
to a "details" page, which displays detailed information about
the selected row.  To accomplish this using the <b>DataGrid</b>, you can 
add a <b>HyperLinkColumn</b> to the Columns collection, which
specifies the details page to which the client will navigate when the 
link is clicked.  You use the format string syntax to substitute a field
value in this link, which is passed as a querystring argument. The 
following example demonstrates this process.

<p>

<div class="code"><pre>
    &lt;ASP:DataGrid id="MyDataGrid" runat="server"&gt;

      &lt;Columns&gt;
          &lt;asp:HyperLinkColumn
            DataNavigateUrlField="au_id"
            DataNavigateUrlFormatString="datagrid13_details.aspx?id={0}"
            Text="Get Details"
          /&gt;
      &lt;/Columns&gt;

    &lt;/ASP:DataGrid&gt;
</pre></div>

<p>
On the details page, you retrieve the querystring argument and 
perform a join select to obtain details from the database.  The 
following sample demonstrates this scenario.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid13.src"
  Icon="/quickstart/aspplus/images/datagrid13.gif"
  Caption="C# DataGrid13.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid13.src"
  Icon="/quickstart/aspplus/images/datagrid13.gif"
  Caption="VB DataGrid13.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid13.src"
  Icon="/quickstart/aspplus/images/datagrid13.gif"
  Caption="JScript DataGrid13.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="storedprocs">
<br>
<span class="subhead">Writing and Using Stored Procedures</span>
<p>
In general, performing ad hoc queries comes at the expense of 
performance.  Using stored procedures can reduce the cost of
performing heavy database operations in an application.  A stored 
procedure is easy to create, and can even be done using a
SQL statement.  The following code example creates a stored procedure 
that simply returns a table.

<p>
<div class="code"><pre>
CREATE Procedure GetAuthors AS
    SELECT * FROM Authors
    return
GO
</pre></div>
<p>

You can create stored procedures that accept parameters as well.  For example:

<p>
<div class="code"><pre>
CREATE Procedure LoadPersonalizationSettings (@UserId varchar(50)) AS
    SELECT * FROM Personalization WHERE UserID=@UserId
    return
GO
</pre></div>
<p>

Using a stored procedure from an ASP.NET page is just an extension 
of what you've learned so far about the <b>SqlCommand</b> object.  The
<b>CommandText</b> is just the name of the stored procedure instead 
of the ad hoc query text.  You indicate to the <b>SqlCommand</b> that the
<b>CommandText</b> is a stored procedure by setting the <b>CommandType</b> property.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
</Tab>

<Tab Name="VB">
myCommand.SelectCommand.CommandType = CommandType.StoredProcedure
</Tab>

<Tab Name="JScript">
myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
</Tab>

</Acme:TabControl><p>

<p>
The following sample demonstrates a call to a stored procedure to fill the <b>DataSet</b>.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid14.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid14.src"
  Icon="/quickstart/aspplus/images/datagrid14.gif"
  Caption="C# DataGrid14.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid14.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid14.src"
  Icon="/quickstart/aspplus/images/datagrid14.gif"
  Caption="VB DataGrid14.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid14.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid14.src"
  Icon="/quickstart/aspplus/images/datagrid14.gif"
  Caption="JScript DataGrid14.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Parameters to stored procedures are passed just as they are for 
ad hoc queries, as shown in the following samples.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid15.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid15.src"
  Icon="/quickstart/aspplus/images/datagrid15.gif"
  Caption="C# DataGrid15.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid15.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid15.src"
  Icon="/quickstart/aspplus/images/datagrid15.gif"
  Caption="VB DataGrid15.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid15.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid15.src"
  Icon="/quickstart/aspplus/images/datagrid15.gif"
  Caption="JScript DataGrid15.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid16.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid16.src"
  Icon="/quickstart/aspplus/images/datagrid16.gif"
  Caption="C# DataGrid16.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid16.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid16.src"
  Icon="/quickstart/aspplus/images/datagrid16.gif"
  Caption="VB DataGrid16.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid16.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid16.src"
  Icon="/quickstart/aspplus/images/datagrid16.gif"
  Caption="JScript DataGrid16.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="xmldata">
<br>
<span class="subhead">Accessing XML-based Data</span>
<p>
At the beginning of this section it was mentioned that the <b>DataSet</b> 
was designed to abstract data in a way that is independent of
the actual data source.  You can see this by changing the focus of your 
samples from SQL to XML.  The <b>DataSet</b> supports a
<b>ReadXml</b> method that takes a <b>FileStream</b> object as its 
parameter.  The file you read in this case must contain both a schema
and the data you wish to read.  The <b>DataSet</b> expects data to 
be in the form, as shown in the following example.

<p>
<div class="code"><pre>
&lt;DocumentElement&gt;
    &lt;TableName&gt;
        &lt;ColumnName1&gt;column value&lt;/ColumnName1&gt;
        &lt;ColumnName2&gt;column value&lt;/ColumnName2&gt;
        &lt;ColumnName3&gt;column value&lt;/ColumnName3&gt;
        &lt;ColumnName4&gt;column value&lt;/ColumnName4&gt;
    &lt;/TableName&gt;
    &lt;TableName&gt;
        &lt;ColumnName1&gt;column value&lt;/ColumnName1&gt;
        &lt;ColumnName2&gt;column value&lt;/ColumnName2&gt;
        &lt;ColumnName3&gt;column value&lt;/ColumnName3&gt;
        &lt;ColumnName4&gt;column value&lt;/ColumnName4&gt;
    &lt;/TableName&gt;
&lt;/DocumentElement&gt;
</pre></div>
<p>
Each <b>TableName</b> section corresponds to a single row in the 
table.  The following sample shows reading schema
and data from an XML file using the <b>ReadXml</b> method of the 
<b>DataSet</b>.  Note that after the data is read into the <b>DataSet</b>
it is indistinguishable from SQL data -- the <b>DataGrid</b> 
binds to it just the same, as shown in the following sample.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid17.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid17.src"
  Icon="/quickstart/aspplus/images/datagrid17.gif"
  Caption="C# DataGrid17.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid17.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid17.src"
  Icon="/quickstart/aspplus/images/datagrid17.gif"
  Caption="VB DataGrid17.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid17.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid17.src"
  Icon="/quickstart/aspplus/images/datagrid17.gif"
  Caption="JScript DataGrid17.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
You can also read the data and schema separately, using the 
<b>ReadXmlData</b> and <b>ReadXmlSchema</b> methods
of the <b>DataSet</b>, as shown in the following sample.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/datagrid18.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid18.src"
  Icon="/quickstart/aspplus/images/datagrid18.gif"
  Caption="C# DataGrid18.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/datagrid18.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid18.src"
  Icon="/quickstart/aspplus/images/datagrid18.gif"
  Caption="VB DataGrid18.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/datagrid18.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/datagrid18.src"
  Icon="/quickstart/aspplus/images/datagrid18.gif"
  Caption="JScript DataGrid18.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Just as the <b>DataSet</b> supports reader methods for XML data, 
it also supports writing the data.  The following sample implements a tool for
selecting data from SQL and writing the result as XML data or schema text.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/CS/xmlgen.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/xmlgen.src"
  Icon="/quickstart/aspplus/images/xmlgen.gif"
  Caption="C# XMLGen.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/VB/xmlgen.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/xmlgen.src"
  Icon="/quickstart/aspplus/images/xmlgen.gif"
  Caption="VB XMLGen.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/data/JS/xmlgen.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/data/xmlgen.src"
  Icon="/quickstart/aspplus/images/xmlgen.gif"
  Caption="JScript XMLGen.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<a name="endofsection">

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>The common language runtime's managed data access APIs abstract 
data and present it in a consistent way regardless of its 
actual source (SQL Server, OLEDB, XML, and so on).

<li>To give your page access to the classes you will need to perform 
SQL data access, you must import the <b>System.Data</b> and 
<b>System.Data.SqlClient</b> namespaces into your page.

<li>Populating a dataset from a SQL query involves creating a 
<b>SqlConnection</b>, associating a <b>SqlDataAdapter</b> object with 
the connection that contains your query statement, and filling the 
dataset from the command.

<li>The <b>DataGrid</b> control supports a <b>DataSource</b> property 
that takes any object that implements <b>IList</b> or <b>IListSource</b> interfaces. 
You can set this to the result of a SQL query by assigning the 
<b>DataSet</b>'s <b>DefaultView</b> property, which is of type <b>DataView</b>.

<li>The <b>SqlDataAdapter</b> maintains a Parameters collection that 
can be used to replace variable identifiers (denoted by an "@" in front 
of the name) with values.

<li>When performing commands that do not require data to be returned, 
such as inserts, updates, and deletes, you use a <b>SqlCommand</b> 
instead of the <b>SqlDataAdapter</b>. The command is issued by calling 
an <b>ExecuteNonQuery</b> method, which returns the number of rows affected.

<li>The <b>SqlConnection</b> must be explicitly opened when you use 
the <b>SqlCommand</b> (the <b>SqlDataAdapter</b> automatically handles 
opening the connection for you). Always remember to close the 
<b>SqlConnection</b> to the data model before the page finishes executing. 
If you do not close the connection, you migh inadvertantly exhaust the 
connection limit while waiting for the page instances to be released 
to garbage collection.

<li>To allow rows to be edited, the <b>DataGrid</b> supports an 
integer <b>EditItemIndex</b> property, which indicates which row of the 
grid should be editable. When this property is set, the <b>DataGrid</b> 
renders the row at that index as text input boxes instead of simple labels.

<li>The <b>DataGrid</b> exposes a <b>DataKeyField</b> property that you 
can set to the field name for the primary key. In the event handler wired 
to the <b>UpdateCommand</b>, you can retrieve the key name from the 
<b>DataGrid</b>'s DataKeys collection.

<li>Using <b>BoundColumn</b> controls in the <b>DataGrid</b> gives you 
complete control over the order of the columns, as well as their <b>ReadOnly</b> 
properties.

<li>Using <b>TemplateColumn</b> controls in the <b>DataGrid</b> gives you 
complete control over the contents of the column.

<li>The <b>ButtonColumn</b> control can be used to simply render a button 
control in each row for that column, which can be associated with an event.

<li>A <b>HyperLinkColumn</b> can be added to the <b>DataGrid</b>'s Columns 
collection, which supports navigating to another page when the link is clicked.

<li>When the <b>DataGrid</b>'s <b>AllowSorting</b> property is set to 
<b>true</b>, it renders hyperlinks for the column headers that fire a 
<b>Sort</b> command back to the grid. You set the <b>OnSortCommand</b> 
property of the <b>DataGrid</b> to the handler you want to call when the 
user clicks a column link.

<li>The <b>DataSet</b> supports <b>ReadXml</b>, <b>ReadXmlData</b>, and 
<b>ReadXmlSchema</b> methods that take a <b>FileStream</b> as a parameter, 
which can be used to populate a <b>DataSet</b> from an XML file.

<li>Using stored procedures can reduce the cost of performing heavy database 
operations in an application.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->