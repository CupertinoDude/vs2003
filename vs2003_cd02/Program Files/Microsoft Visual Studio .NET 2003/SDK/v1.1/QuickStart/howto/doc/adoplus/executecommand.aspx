<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->

<h4>ADO.NET: Execute a Command</h4>

Commands are issued against databases to take actions against data stores.
For example, you could execute a command that inserts or deletes data. For more information on moving data into and out
of databases, see <a href="updatedatafromdb.aspx">"Update a Database
from a DataSet"</a>. Commands include any command that can be issued
against a database, and in the case of the <b>OleDbCommand</b>, can be data store
specific. For example, you could issue a stored procedure call for a command,
or perhaps a command to "set quoted_identifier on". Whatever the command
may be, the <b>OleDbCommand</b> or <b>SqlCommand</b> can be used to get the command to your
back-end data store.
</p>
<p>
With ADO classic, you could issue commands through the
<b>Command</b> object, <b>Connection</b> object, or <b>Recordset</b> object. In ADO.NET, only the
<b>Command</b> object executes commands.
</p>
<p>
To issue a command against a database, the <b>Command</b> object must have
two basic things: a <b>Connection</b> and <b>CommandText</b>, both of which can be set in
the constructor. To execute the command, the <b>Connection</b>
has to be open and not in fetching state:
</p>
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
String InsertCmdString;
InsertCmdString = "Insert into Region (RegionID, RegionDescription) VALUES (100, 'Description')";
SqlCommand mySqlCommand = new SqlCommand(InsertCmdString, myConnection);
</Tab>
<Tab Name="VB">
Dim InsertCmdString As String
InsertCmdString = "Insert into Region (RegionID, RegionDescription) VALUES (100, 'Description')"
Dim mySqlCommand As SqlCommand = New SqlCommand(InsertCmdString, myConnection)
</Tab>
<Tab Name="C++">
SqlCommand * myCommand;
myCommand->CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (100, 'Description')";
</Tab>
</Acme:TabControl>

</p>
<p>
This topic covers executing non-result generating commands. 
To execute the command that does not return results, call the <b>ExecuteNonQuery</b> method.
</p>
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
mySqlCommand.ExecuteNonQuery();
</Tab>
<Tab Name="VB">
mySqlCommand.ExecuteNonQuery()
</Tab>
<Tab Name="C++">
mySqlCommand->ExecuteNonQuery();
</Tab>
</Acme:TabControl>

</p>
<p>
The <b>OleDbCommand</b> and <b>SqlCommand</b> objects have parameter collections that behave
like the parameter collections from ADO classic. You can pass your
parameters inline:
</p>
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
mySqlCommand.CommandText = "myStoredProc 'CustId'";
</Tab>
<Tab Name="VB">
mySqlCommand.CommandText = "myStoredProc 'CustId'"
</Tab>
<Tab Name="C++">
mySqlCommand->CommandText = "myStoredProc 'CustId'";
</Tab>
</Acme:TabControl>

</p>
<p>
Or by using the <b>Parameters</b> collection:
</p>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
workParam = mySqlCommand.Parameters.Add("@CustomerID", SQLDataType.NChar, 5);
workParam.Value = "NewID";
</Tab>
<Tab Name="VB">
workParam = mySqlCommand.Parameters.Add("@CustomerID", SQLDataType.NChar, 5)
workParam.Value = "NewID"
</Tab>
<Tab Name="C++">
workParam = mySqlCommand->Parameters->Add("@CustomerID", SQLDataType.NChar, 5);
workParam.Value = "NewID";
</Tab>
</Acme:TabControl>
</p>

<p>
For more information about using parameters, see
<a href="outparams.aspx">Getting Out Parameters from a Stored Procedure</a>.
</p>
<p>
The following sample shows how to execute an insert command against a SQL
database using the <b>SqlCommand</b>.
</p>
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/executingacommand/cs/executingacommand.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/executingacommand/executingacommand.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# executingacommand.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/executingacommand/vb/executingacommand.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/executingacommand/executingacommand.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB executingacommand.aspx"
  runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/executingacommand/CP"
  ViewSource="/quickstart/howto/samples/adoplus/executingacommand/executingacommand.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ executingacommand.exe"
  MapRunSamplePath=true
  runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

</p>