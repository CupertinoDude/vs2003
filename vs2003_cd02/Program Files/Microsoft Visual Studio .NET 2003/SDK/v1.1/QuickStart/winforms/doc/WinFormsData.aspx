<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Databinding in Windows Forms</span>

<p>Before reading this Quick Start you should read the <a
href="DataAccessPlaceHolder.aspx">ADO.NET Overview</a>.</p>

<p>The last three samples use XML Web services. Read the <a
href="WebServicesPlaceHolder.aspx">XML Web services Overview</a> before reviewing those samples.</p>

<ul>
    <li><a href="#Introduction">Introduction</a>
    <li><a href="#Simple Databinding">Simple Data Binding</a>
    <li><a href="#Binding to a ComboBox or ListBox">Binding to a ComboBox or ListBox</a>
    <li><a href="#Binding to a DataGrid">Binding to a DataGrid</a>
    <li><a href="#Using a XML Web service to retrieve a DataSet">Using a XML Web service to Retrieve a DataSet</a>
    <li><a href="#Master Detail Forms">Master Detail Forms</a>
    <li><a href="#Customer Details Form">Customer Details Form</a>
</ul>


<a name="Introduction">
<span class="subhead">Introduction</span>

<p>Data binding provides a simple, convenient, powerful, and transparent way
for developers to create a read/write link between the controls on a form
and the data in their application (their data model).</p>

<p>Windows Forms supports binding data to ADO.NET <b>DataSet</b>, <b>Array</b>,
 <b>ArrayList</b>, and
so on.  A control can be bound to any collection that supports indexed
access to the elements in that collection -- to be specific, to any
collection that implements the <b>IList</b> interface.</p>

<span class="subhead">Simple Data Binding</span>

<p>Simple data binding means binding a single value within the
data model to a single property of a control. For example, binding
<b>TextBox1.Text</b> to <b>Customer.Name</b>. Simple binding is managed by use of the
<b>Bindings</b> collection on each control.</p>

<span class="subhead">Complex Data Binding</span>

<p>Complex data binding means binding a control to a collection (rather than binding a control to
a single item within the collection).  For example, the <b>DataGrid</b> has a
<b>DataSource</b> property that can be set to an entire <b>DataSet</b> or <b>Array</b>.  The
<b>DataGrid</b> extracts information from the <b>DataSource</b> and
displays it.  <b>ListBox</b> and <b>ComboBox</b> also use complex data binding.</p>

<span class="subhead">One-Way and Two-Way Data Binding</span>

<p>One-way data binding describes a process by which a property of a control is bound to the
data model for read-only or presentation purposes.  When data binding is
set up in this fashion, the property reflects the value of the data,
but direct changes to the property are not reflected in the data model.

<p>Two-way data binding describes a process by which a property of a control is bound to the
data model in a read/write manner.  When data binding is set up in this
fashion, the property reflects the value of the data and
changes to the property are propogated to the data model.

<span class="subhead">The <b>BindingContext</b></span>

<p>Each <b>Form</b> has a <b>BindingContext</b>.  The <b>BindingContext</b> is responsible for
managing the collections of data that controls are bound to.  It manages currency
and dependency.

<p><b>Currency:</b> The <b>BindingContext</b> maintains a current position for
each collection.  Simple data binding uses this current position to
determine which object in the collection to bind to a control property.
As the current position is changed, so does the object that a control
property is bound to.  See <a href="#Simple
Databinding">Simple Data Binding.</a></p>

<p><b>Dependency:</b> The <b>BindingContext</b> maintains dependency relationships
between collections.  This allows for the creation of master/detail forms.
See <a href="#Master Detail Forms">Master Detail
Forms.</a></p>


<a name="Simple Databinding">
<span class="subhead">Simple Data Binding</span>

<p>This sample demonstrates simple data binding of the <b>Text</b> property on a
set of <b>TextBox</b> controls to the properties of a <b>Customer</b> object that is stored as a list
of customers.  You add simple data bindings by using the <b>DataBindings</b> collection
on a control.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
textBoxID.DataBindings.Add("Text", custList, "CustomerID");
textBoxTitle.DataBindings.Add("Text", custList, "ContactTitle");
textBoxLastName.DataBindings.Add("Text", custList, "ContactName");
textBoxFirstName.DataBindings.Add("Text", custList, "CompanyName");
textBoxAddress.DataBindings.Add("Text", custList, "Address");
</Tab>

<Tab Name="VB">
textBoxID.DataBindings.Add("Text", custList, "CustomerID")
textBoxTitle.DataBindings.Add("Text", custList, "ContactTitle")
textBoxLastName.DataBindings.Add("Text", custList, "ContactName")
textBoxFirstName.DataBindings.Add("Text", custList, "CompanyName")
textBoxAddress.DataBindings.Add("Text", custList, "Address")
</Tab>

</Acme:TabControl><p>

<p>Each <b>TextBox.Text</b> is bound to the current <b>Customer</b> object, as maintained by
the <b>BindingContext</b>.  To change the current object, you increment or decrement
the <b>Position</b> property for the collection by use of the <b>BindingContext</b>.  For
example, you implement a <b>Move Next</b> button by handling the button's
<b>Click</b> event as follows.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
private void buttonMoveNext_Click(object sender, System.EventArgs e) {
    this.BindingContext[custList].Position++;
}
</Tab>

<Tab Name="VB">
Private Sub buttonMoveNext_Click(sender As Object, e As System.EventArgs)
    Me.BindingContext(custList).Position += 1
End Sub
</Tab>

</Acme:TabControl><p>

<p>The <b>BindingContext</b> raises an event whenever the position changes.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
this.BindingContext[custList].PositionChanged += new System.EventHandler(customer_PositionChanged);

private void customer_PositionChanged(object sender, System.EventArgs e) {
    textBoxPosition.Text = "Record " + (this.BindingContext[custList].Position + 1)
                                     + " of " + custList.Length;
}
</Tab>

<Tab Name="VB">
AddHandler Me.BindingContext(custList).PositionChanged, AddressOf customer_PositionChanged

Private Sub customer_PositionChanged(sender As Object, e As System.EventArgs)
    textBoxPosition.Text = "Record " & (Me.BindingContext(custList).Position + 1) _
                                     & " of " & custList.Length
End Sub
</Tab>

</Acme:TabControl><p>

<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/SimpleBinding/CS"
        ViewSource="/quickstart/winforms/Samples/Data/SimpleBinding/SimpleBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Data binding"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/SimpleBinding/VB"
        ViewSource="/quickstart/winforms/Samples/Data/SimpleBinding/SimpleBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Data binding"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Binding to a ComboBox or ListBox">
<span class="subhead">Binding to a <b>ComboBox</b> or <b>ListBox</b></span>

<p>This sample demonstrates binding data to a <b>ComboBox</b>. Binding data to a <b>ListBox</b>
follows the same model.

<p>To bind data to the list of items that are displayed, set the <b>DataSource</b> and <b>DisplayMember</b> properties of
the <b>ComboBox</b>. The <b>DisplayMember</b> property is used to determine which property of the <b>State</b> object
to display in the <b>ComboBox</b>.  For example, the following code binds a <b>ComboBox</b> to an array of
<b>State</b> objects.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public struct State {
    private string shortName, longName;

    public State(string longName , string shortName) {
        this.shortName = shortName ; this.longName = longName ;
    }

    public string ShortName { get { return shortName; } }
    public string LongName { get { return longName; } }
}

private State[] States  = new State[] {
    new State("Alabama","AL"),
....
    new State("Washington" ,"WA),
....
}

comboBoxState.DataSource=States;
comboBoxState.DisplayMember="LongName";





</Tab>

<Tab Name="VB">
Public Structure State
    Private m_shortName, m_longName As String

    Public Sub New(ByVal longName As String, ByVal shortName As String)
        Me.m_shortName = shortName
        Me.m_longName = longName
    End Sub

    Public ReadOnly Property ShortName() As String
        Get
            Return m_shortName
        End Get
    End Property

    Public ReadOnly Property LongName() As String
        Get
            Return m_longName
        End Get
    End Property
End Structure

Private States() As State = {New State("Alabama", "AL"), ..., New State("Wyoming", "WY")}

comboBoxState.DataSource=States
comboBoxState.DisplayMember="LongName"
</Tab>

</Acme:TabControl><p>

<p>Typically, in a data-bound form, a <b>ComboBox</b> is used to look up up a value.
In this example, the form displays a <b>Customer</b> object.  Each <b>Customer</b> object
has a <b>Region</b> property that contains a state's abbreviated name. You want to display
a list of full state names that the user can select from. When the
user selects a particular state, you want the <b>Customer</b> region to be updated
with the state's abbreviated name, rather than the full name. In order to
achieve this, you can do the following:
<ul>
<li>set the <b>ComboBox</b> up like the previous example
<li>set the <b>ValueMember</b> property to point to the state abbreviation
property on the <b>State</b> object - <b>State.ShortName</b>
<li>simple-bind <b>SelectedValue</b> to <b>Customer.Region</b>
</ul>
<p>The <b>ValueMember</b> property determines which value gets moved into <b>SelectedValue</b>.
In the example, whenever the user selects a state by <b>State.LongName</b>, the <b>SelectedValue</b> is
the <b>State.ShortName</b>. Whenever the <b>SelectedValue</b> changes, the data-binding moves the new
value into the <b>Customer</b> object.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
comboBoxState.DataSource=States;
comboBoxState.DisplayMember="LongName";
comboBoxState.ValueMember="ShortName";
comboBoxState.DataBindings.Add("SelectedValue", customersDataSet1, "Customers.Region");
</Tab>

<Tab Name="VB">
comboBoxState.DataSource=States
comboBoxState.DisplayMember="LongName"
comboBoxState.ValueMember="ShortName"
comboBoxState.DataBindings.Add("SelectedValue", customersDataSet1, "Customers.Region")
</Tab>

</Acme:TabControl><p>

<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/ComboBoxBinding/CS"
        ViewSource="/quickstart/winforms/Samples/Data/ComboBoxBinding/ComboBoxBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ComboBox binding"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/ComboBoxBinding/VB"
        ViewSource="/quickstart/winforms/Samples/Data/ComboBoxBinding/ComboBoxBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ComboBox binding"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Binding to a DataGrid">
<span class="subhead">Binding to a <b>DataGrid</b></span>

<p>The <b>DataGrid</b> displays all the information in an array, collection, or
ADO.NET <b>DataTable</b>, as a series of rows.  Each row can be edited in place.
Changes are automatically moved back into the underlying collection of
objects as the user moves from row to row.</p>

<p>When the <b>DataGrid</b> is used to view a <b>DataSet</b>, the user can move
across the <b>DataTable</b> objects in a <b>DataSet</b> through their relationships.</p>

<p>In order to use a <b>DataGrid</b>, you simply set the <b>DataSource</b> property to
the list of objects to display.  If the <b>DataSource</b> is a <b>DataSet</b>, you also
need to set the <b>DataMember</b> property to the <b>DataTable</b> to display.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
dataGrid1.Size = new System.Drawing.Size(584, 336);
dataGrid1.DataSource = customersDataSet1;
dataGrid1.DataMember = "Customers";
</Tab>

<Tab Name="VB">
dataGrid1.Size = New System.Drawing.Size(584, 336)
dataGrid1.DataSource = customersDataSet1
dataGrid1.DataMember = "Customers"
</Tab>

</Acme:TabControl><p>

<p>There are a set of properties on the <b>DataGrid</b> that allow you to change
the way it displays data.  For example, you can set the <b>AlternatingBackColor</b>
property to cause alternate rows to be displayed with varying <b>BackColor</b> properties.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
dataGrid1.DataSource = customersDataSet1;
dataGrid1.DataMember = "Customers";
dataGrid1.ForeColor = System.Drawing.Color.Navy;
dataGrid1.BackColor = System.Drawing.Color.Gainsboro;
dataGrid1.AlternatingBackColor = System.Drawing.Color.WhiteSmoke;
</Tab>

<Tab Name="VB">
dataGrid1.DataSource = customersDataSet1
dataGrid1.DataMember = "Customers"
dataGrid1.ForeColor = System.Drawing.Color.Navy
dataGrid1.BackColor = System.Drawing.Color.Gainsboro
dataGrid1.AlternatingBackColor = System.Drawing.Color.WhiteSmoke
</Tab>

</Acme:TabControl><p>

<p>The <b>DataGrid</b> sample demonstrates how to load a <b>DataSet</b> and display its contents
in a <b>DataGrid</b>.</p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Grid/CS"
        ViewSource="/quickstart/winforms/Samples/Data/Grid/Grid.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Grid binding"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Grid/VB"
        ViewSource="/quickstart/winforms/Samples/Data/Grid/Grid.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Grid binding"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Using a XML Web service to retrieve a DataSet">
<span class="subhead">Using a XML Web service to Retrieve a <b>DataSet</b></span>

<p>The .Net Framework based applications expose services as XML Web services.  XML Web services
can return data.  Windows Forms applications can use a XML Web service to retrieve
data and bind to that returned data.  This sample demonstrates
binding to data returned from a XML Web service.</p>

<p>Before walking through this sample, you should be familar
with XML Web services. See the <a
href=/quickstart/winforms/doc/WebServicesPlaceHolder.aspx>XML Web services
Overview</a>.</p>

<p>The first step is to create a XML Web service that returns a <b>DataSet</b>.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
&lt;%@ WebService Language="C#" class="CustomersList" %&gt;

using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Samples.WinForms.Cs.WebServiceBinding.Data;

public class CustomersList : WebService {

     [ WebMethod ]
     public DataSet GetCustomers() {
         CustomersDataSet customersDataSet1 = new CustomersDataSet();
         SqlConnection con = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind");
         SqlDataAdapter cmdCustomers = new SqlDataAdapter("Select * from Customers", con);
         SqlDataAdapter cmdOrders = new SqlDataAdapter("Select * from Orders", con);
         cmdCustomers.Fill(customersDataSet1, "Customers");
         cmdOrders.Fill(customersDataSet1, "Orders");
         return customersDataSet1 ;
     }

}
</Tab>

<Tab Name="VB">
&lt;%@ WebService Language="VB" Class="CustomersList"%&gt;

Imports System.Web.Services
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.Samples.WinForms.VB.WebServiceBinding.Data

public class CustomersList
        Inherits WebService

     &lt;WebMethod()&gt; Public Function GetCustomers() As DataSet
         Dim customersDataSet1 As New CustomersDataSet
         Dim con As SqlConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
         Dim cmdCustomers As SqlDataAdapter  = new SqlDataAdapter("Select * from Customers", con)
         Dim cmdOrders As SqlDataAdapter = new SqlDataAdapter("Select * from Orders", con)
         cmdCustomers.Fill(customersDataSet1, "Customers")
         cmdOrders.Fill(customersDataSet1, "Orders")
         return customersDataSet1
     End Function

End Class
</Tab>

</Acme:TabControl><p>
<br>
<p>You can view this XML Web service at <a target="_NEW"
href="/quickstart/winforms/Samples/Data/WebServiceBinding/CS/SimpleCustomersWebService.asmx">CustomersList</a>.</p>

<p>Having created the XML Web service, you then need to create a WSDL file that
defines the schema for that XML Web service.  You can get the WSDL by connecting
to the XML Web service with the <i>?WSDL</i> parameter-
<a target="_NEW"
href="/quickstart/winforms/Samples/Data/WebServiceBinding/CS/SimpleCustomersWebService.asmx?WSDL">CustomersList
WSDL</a>.

<p>Once you have the WSDL file, you can then create a client proxy source file by
using WebServiceUtil.exe.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
wsdl.exe /l:CS /n:SimpleWebService /o:SimpleCustomersWebService.cs SimpleCustomersWebService.WSDL
</Tab>

<Tab Name="VB">
wsdl.exe /l:VB /n:SimpleWebService /o:SimpleCustomersWebService.vb SimpleCustomersWebService.WSDL
</Tab>

</Acme:TabControl><p>

<p>Once you have the proxy source file, you can compile it into your
application and use it to retrieve the data from the XML Web service.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
CustomersList custList1 = new CustomersList();
DataSet ds1 = custList1.GetCustomers();
dataGrid1.DataSource=ds1;
</Tab>

<Tab Name="VB">
Dim custList1 As New CustomersList
Dim ds1 As DataSet = custList1.GetCustomers
dataGrid1.DataSource=ds1
</Tab>

</Acme:TabControl><p>

<p>The XML Web services sample demonstrates how to load a <b>DataSet</b> from a
XML Web service and display its contents in a DataGrid.</p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/WebServiceBinding/CS"
        ViewSource="/quickstart/winforms/Samples/Data/WebServiceBinding/WebServiceBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Grid binding to a WebService"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/WebServiceBinding/VB"
        ViewSource="/quickstart/winforms/Samples/Data/WebServiceBinding/WebServiceBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Grid binding to a XML Web service"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Master Detail Forms">
<span class="subhead">Master Detail Forms</span>

<p>In database applications, it is often useful to view a
record with a group of related records.  For example, you may want to view
a customer with the current orders for that customer.  A common way
to accomplish this is to create a master/detail form.

<p>This sample displays a <b>Datagrid</b> for customers and a <b>DataGrid</b> for the orders for each customer.
The first <b>DataGrid</b> displays the list of customers.  The
second <b>DataGrid</b> displays the list of orders.  As the selected customer
changes, the second <b>DataGrid</b> updates to display the orders for that
customer.</p>

<p>In order to link the two <b>DataGrid</b> objects, you need to set the <b>DataSource</b> of
each <b>DataGrid</b> to the same <b>DataSet</b>. You also need to set the <b>DataMember</b> properties to indicate
to the Windows Forms <b>BindingContext</b> that they are related. You do
this by setting the <b>DataMember</b> for the second <b>DataGrid</b> to the name of the relationship
between the <b>Customers</b> and <b>Orders</b> tables - <b>Customers.CustomersOrders</b>.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
dataGrid1.DataSource = customersAndOrdersDataSet1;
dataGrid1.DataMember = "Customers";

dataGrid2.DataSource = customersAndOrdersDataSet1;
dataGrid2.DataMember = "Customers.CustomersOrders";
</Tab>

<Tab Name="VB">
dataGrid1.DataSource = customersAndOrdersDataSet1
dataGrid1.DataMember = "Customers"

dataGrid2.DataSource = customersAndOrdersDataSet1
dataGrid2.DataMember = "Customers.CustomersOrders"
</Tab>

</Acme:TabControl><p>

<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/MasterDetails/CS"
        ViewSource="/quickstart/winforms/Samples/Data/MasterDetails/MasterDetails.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# MasterDetails"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/MasterDetails/VB"
        ViewSource="/quickstart/winforms/Samples/Data/MasterDetails/MasterDetails.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB MasterDetails"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Customer Details Form">
<span class="subhead">Customer Details Form</span>

<p>This sample demonstrates the following:

<ul>
<li>Writing a XML Web service that fills a <b>DataSet</b> and returns it</li>
<li>Writing a XML Web service that saves the updates from a <b>DataSet</b> in the database</li>
<li>Binding to that <b>DataSet</b></li>
<li>Updating the <b>DataSet</b> and tracking changes in the <b>Form</b></li>
<li>Extracting changed rows from the <b>DataSet</b> and sending them to the <b>Update</b> XML Web service</li>
<li>Reconciling the saved rows and displaying errors</li>
</ul>

<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Update/CS"
        ViewSource="/quickstart/winforms/Samples/Data/Update/Update.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Customer Details Form"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Update/VB"
        ViewSource="/quickstart/winforms/Samples/Data/Update/Update.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Customer Details Form"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
