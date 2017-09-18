<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->

<h4>ADO.NET: Work with Relational Data</h4>

A DataSet can contain either unrelated tables or related tables. You can 
think of a DataSet as a document of data. In fact, an XML data document is
like this, except it is based on a hierarchical paradigm. Because data
is often stored in relational databases, the DataSet can handle both
hierarchical relationships and key/foreign key relationships.
Relationships can also have different types of enforcement. By default,
deletions and updates are cascaded: if you delete a Customer row, the
related Orders rows are also deleted; if you Update the key of a
Customer row, the associated foreign key values in the Orders table is
also updated.
<p>

A DataSet contains a Relations collection. You can add a
Relation to this collection using the column or columns (in a
multicolumn key) of the related tables. The following code example 
creates a relation between <b>Customers</b> and <b>Orders</b>, and names the relation CustOrders.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
myDataSet.Relations.Add("CustOrders",myDataSet.Tables["Customers"].Columns["CustomerID"],
                        myDataSet.Tables["Orders"].Columns["CustomerID"]);
</Tab>
<Tab Name="VB">
myDataSet.Relations.Add("CustOrders",myDataSet.Tables("Customers").Columns("CustomerID"), _
                        myDataSet.Tables("Orders").Columns("CustomerID"))
</Tab>
<Tab Name="C++">
myDataSet->Relations->Add("CustOrders",myDataSet->Tables->Item["Customers"]->Columns->Item["CustomerId"],
			myDataSet->Tables->Item["Orders"]->Columns->Item["CustomerId"]);
</Tab>
</Acme:TabControl>

<p>
After adding a relation between the CustomerID Key on the Customers
table and the CustomerID foreign key on the Orders table in the DataSet, you can iterate through the data.

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
foreach (DataRow myDataRow1 in myDataSet.Tables["Customers"].Rows)
{
  Console.WriteLine("Customer: " + myDataRow1["ContactName"].ToString());

  // Iterate over orders data.
  foreach (DataRow myDataRow2 in myDataRow1.GetChildRows(myDataSet.Relations["CustOrders"]))
  {
    Console.WriteLine("Order #" + myDataRow2["OrderID"].ToString());
  }

  Console.WriteLine();
}
</Tab>
<Tab Name="VB">
Dim myDataRow1 as DataRow
for each myDataRow1 in myDataSet.Tables("Customers").Rows
  Console.WriteLine("Customer: " + myDataRow1("ContactName").ToString())

  ' Iterate over orders data
  Dim myDataRow2 as DataRow
  for each myDataRow2 in myDataRow1.GetChildRows(myDataSet.Relations("CustOrders"))
    Console.WriteLine("Order #" + myDataRow2("OrderID").ToString())
  next

  Console.WriteLine()
next
</Tab>
<Tab Name="C++">
for(int i = 0; i< myDataSet->Tables->Item["Customers"]->Rows->Count; i++)
{
	DataRow * myDataRow1 = myDataSet->Tables->Item["Customers"]->Rows->Item[i];
	Console::Write("Customer: ");
	Console::WriteLine(myDataRow1->Item["ContactName"]->ToString());
	
	// Iterate over orders data.
	DataRow * rows[] = myDataRow1->GetChildRows(myDataSet->Relations->Item["CustOrders"]);
	for(int j = 0; j< rows.Count; j++)
	{
	Console::Write("Order #");
	Console::WriteLine(rows[j]->Item["OrderId"]->ToString());
	}
	
	Console::WriteLine();
}
</Tab>
</Acme:TabControl>

<p>
The following sample iterates over the data and outputs it to a Web page hierarchically.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
    <Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/RelationalData/cs/RelationalData.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/RelationalData/RelationalData.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# RelationalData.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
    <Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/RelationalData/vb/RelationalData.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/RelationalData/RelationalData.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB RelationalData.aspx"
  runat="server" />
  </VbTemplate>
  <CpTemplate>
    <Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/RelationalData/CP"
  ViewSource="/quickstart/howto/samples/adoplus/RelationalData/RelationalData.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ RelationalData.exe"
  MapRunSamplePath=true
  runat="server" />
  </CpTemplate>
</Acme:LangSwitch>
<p>

<!-- #include virtual="/quickstart/include/footer.inc" -->
