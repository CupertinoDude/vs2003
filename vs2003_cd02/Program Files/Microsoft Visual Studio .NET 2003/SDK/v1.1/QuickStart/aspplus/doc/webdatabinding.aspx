<%@ Page Language="C#" %>
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Data Binding Server Controls</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#intro">Data Binding Overview and Syntax</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#properties">Binding to Simple Properties</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#lists">Binding to Collections & Lists</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#expressions">Binding Expressions or Methods</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#bindereval">DataBinder.Eval()</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#endofsection">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="intro">
<span class="subhead">Data Binding Overview and Syntax</span>
<p>ASP.NET introduces a new declarative data binding syntax.  This extremely flexible syntax permits the developer
to bind not only to data sources, but also to simple properties, collections, expressions, and even results returned from
method calls.  The following table shows some examples of the new syntax.<p>

<div class="indent">
<table class="table2" cellpadding="3">
<tr>
    <td style="width:15%"><b>Simple property</b></td>
    <td class="code" style="color:black">Customer: &lt;%# custID %&gt;</td>
</tr><tr>
    <td style="width:15%"><b>Collection</b></td>
    <td class="code" style="color:black">Orders: &lt;asp:ListBox id="List1" datasource='&lt;%# myArray %&gt;' runat="server"&gt;</td>
</tr><tr>
    <td style="width:15%"><b>Expression</b></td>
    <td class="code" style="color:black">Contact: &lt;%# ( customer.FirstName + " " + customer.LastName ) %&gt;</td>
</tr><tr>
    <td style="width:15%"><b>Method result</b></td>
    <td class="code" style="color:black">Outstanding Balance: &lt;%# GetBalance(custID) %&gt;</td>
</tr>
</table>
</div>

<p>Although this syntax looks similar to the ASP shortcut for <b>Response.Write</b> -- <span class="code">&lt;%= %&gt;</span> -- its
behavior is quite different.  Whereas the ASP <b>Response.Write</b> shortcut syntax was evaluated when the page
was processed, the ASP.NET data binding syntax is evaluated only when the <b>DataBind</b> method is invoked.<p>

<b>DataBind</b> is a method of the <b>Page</b> and all server controls.  When you call <b>DataBind</b> on a parent control, it
cascades to all of the children of the control.  So, for example, <code>DataList1.DataBind()</code>
invokes the <b>DataBind</b> method on each of the controls in the <b>DataList</b> templates.  Calling <b>DataBind</b> on the
<b>Page</b> -- <code>Page.DataBind()</code> or simply <code>DataBind()</code> -- causes all
data binding expressions on the page to be evaluated.  <b>DataBind</b> is commonly called from the <b>Page_Load</b> event, as shown in the following example.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected void Page_Load(Object Src, EventArgs E) {
    DataBind();
}
</Tab>

<Tab Name="VB">
Protected Sub Page_Load(Src As Object, E As EventArgs)
    DataBind()
End Sub
</Tab>

<Tab Name="JScript">
protected function Page_Load(Src:Object, E:EventArgs) : void {
    DataBind();
}
</Tab>

</Acme:TabControl><p>

You can use a binding expression almost anywhere in the declarative section of an .aspx page, provided it evaluates to
the expected data type at run time.  The simple property, expression, and method examples above display text to
the user when evaluated.  In these cases, the data binding expression must evaluate to a value of type <b>String</b>.
In the collection example, the data binding expression evaluates to a value of valid type for the <b>DataSource</b>
property of <b>ListBox</b>.  You might find it necessary to coerce the type of value in your binding expression to produce
the desired result.  For example, if <code>count</code> is an integer:<p>

<div class="indent">
        <code>Number of Records:  &lt;%# count.ToString() %&gt;</code>
</div>

<!--BEGIN SECTION-->
<br>
<a name="properties">
<br>
<span class="subhead">Binding to Simple Properties</span>
<p>The ASP.NET data binding syntax supports binding to public variables, properties of the <b>Page</b>, and
properties of other controls on the page.

<p>The following example illustrates binding to a public variable and simple property on the page. Note that these values are initialized before <code>DataBind()</code> is called.

<p>
<!-- databinding to a prop on the page -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/CS/DataBind1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind1.src"
  Icon="/quickstart/aspplus/images/databind1.gif"
  Caption="C# DataBind1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/VB/DataBind1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind1.src"
  Icon="/quickstart/aspplus/images/databind1.gif"
  Caption="VB DataBind1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/JS/DataBind1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind1.src"
  Icon="/quickstart/aspplus/images/databind1.gif"
  Caption="JScript DataBind1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>The following example illustrates binding to a property of another control.
<p>
<!-- databinding to a prop of another control -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/CS/DataBind2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind2.src"
  Icon="/quickstart/aspplus/images/databind2.gif"
  Caption="C# DataBind2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/VB/DataBind2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind2.src"
  Icon="/quickstart/aspplus/images/databind2.gif"
  Caption="VB DataBind2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/JS/DataBind2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind2.src"
  Icon="/quickstart/aspplus/images/databind2.gif"
  Caption="JScript DataBind2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="lists">
<br>
<span class="subhead">Binding to Collections and Lists</span>
<p>List server controls like <b>DataGrid</b>, <b>ListBox</b> and <b>HTMLSelect</b> use a collection as a data source.  The following
examples illustrate binding to usual common language runtime collection types.  These controls can bind only to
collections that support the <b>IEnumerable</b>, <b>ICollection</b>, or <b>IListSource</b> interface.
Most commonly, you'll bind to <b>ArrayList</b>, <b>Hashtable</b>, <b>DataView</b> and <b>DataReader</b>.

<p>
<p>The following example illustrates binding to an <b>ArrayList</b>.
<p>
<!-- DataBinding to an ArrayList -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/CS/DataBind3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind3.src"
  Icon="/quickstart/aspplus/images/databind3.gif"
  Caption="C# DataBind3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/VB/DataBind3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind3.src"
  Icon="/quickstart/aspplus/images/databind3.gif"
  Caption="VB DataBind3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/JS/DataBind3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind3.src"
  Icon="/quickstart/aspplus/images/databind3.gif"
  Caption="JScript DataBind3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>The following example illustrates binding to a <b>DataView</b>.  Note that the <b>DataView</b> class is defined in the <b>System.Data</b>
namespace.
<p>
<!-- Databinding to a DataView -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/CS/DataBind4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind4.src"
  Icon="/quickstart/aspplus/images/databind4.gif"
  Caption="C# DataBind4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/VB/DataBind4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind4.src"
  Icon="/quickstart/aspplus/images/databind4.gif"
  Caption="VB DataBind4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/JS/DataBind4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind4.src"
  Icon="/quickstart/aspplus/images/databind4.gif"
  Caption="JScript DataBind4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>The following example illustrates binding to a <b>Hashtable</b>.
<p>
<!-- Databinding to a Hashtable -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/CS/DataBind5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind5.src"
  Icon="/quickstart/aspplus/images/databind5.gif"
  Caption="C# DataBind5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/VB/DataBind5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind5.src"
  Icon="/quickstart/aspplus/images/databind5.gif"
  Caption="VB DataBind5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/JS/DataBind5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind5.src"
  Icon="/quickstart/aspplus/images/databind5.gif"
  Caption="JScript DataBind5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="expressions">
<br>
<span class="subhead">Binding Expressions or Methods</span>
<p>Often, you'll want to manipulate data before binding to your page or a control.  The following example illustrates
binding to an expression and the return value of a method.

<p>
<!-- Databinding to the return value of a function -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/CS/DataBind6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind6.src"
  Icon="/quickstart/aspplus/images/databind7.gif"
  Caption="C# DataBind6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/VB/DataBind6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind6.src"
  Icon="/quickstart/aspplus/images/databind7.gif"
  Caption="VB DataBind6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/JS/DataBind6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind6.src"
  Icon="/quickstart/aspplus/images/databind7.gif"
  Caption="JScript DataBind6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="bindereval">
<br>
<span class="subhead">DataBinder.Eval</span>
<p>The ASP.NET framework supplies a static method that evaluates late-bound data binding expressions and optionally
formats the result as a string.  <b>DataBinder.Eval</b> is convenient in that it eliminates much of the explicit
casting the developer must do to coerce values to the desired data type.  It is particularly useful when
data binding controls within a templated list, because often both the data row and the data field
must be cast.

<p>Consider the following example, where an integer will be displayed as a currency string.  With the
standard ASP.NET data binding syntax, you must first cast the type of the data row in order to retrieve the
data field, <code>IntegerValue</code>.  Next, this is passed as an argument to the <b>String.Format</b> method.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%# String.Format("{0:c}", ((DataRowView)Container.DataItem)["IntegerValue"]) %&gt;
</Tab>

<Tab Name="VB">
&lt;%# String.Format("{0:c}", (CType(Container.DataItem, DataRowView)("IntegerValue"))) %&gt;
</Tab>

<Tab Name="JScript">
&lt;%# String.Format("{0:c}", (DataRowView(Container.DataItem))["IntegerValue"]) %&gt;
</Tab>

</Acme:TabControl><p>

<p>This syntax can be complex and difficult to remember.  In contrast, <b>DataBinder.Eval</b> is simply a method with
three arguments: the naming container for the data item, the data field name, and a format string.
In a templated list like <b>DataList</b>, <b>DataGrid</b>, or <b>Repeater</b>, the naming container is always <code>
Container.DataItem.</code>  <b>Page</b> is another naming container that can be used with
<b>DataBinder.Eval</b>.<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%# DataBinder.Eval(Container.DataItem, "IntegerValue", "{0:c}") %&gt;
</Tab>

<Tab Name="VB">
&lt;%# DataBinder.Eval(Container.DataItem, "IntegerValue", "{0:c}") %&gt;
</Tab>

<Tab Name="JScript">
&lt;%# DataBinder.Eval(Container.DataItem, "IntegerValue", "{0:c}") %&gt;
</Tab>

</Acme:TabControl><p>

<p>The format string argument is optional.  If it is omitted, <b>DataBinder.Eval</b> returns a value of type object, as shown in the following example.<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%# (bool)DataBinder.Eval(Container.DataItem, "BoolValue") %&gt;
</Tab>

<Tab Name="VB">
&lt;%# CType(DataBinder.Eval(Container.DataItem, "BoolValue"), Boolean) %&gt;
</Tab>

<Tab Name="JScript">
&lt;%# Boolean(DataBinder.Eval(Container.DataItem, "BoolValue")) %&gt;
</Tab>

</Acme:TabControl><p>

<p>It is important to note that <b>DataBinder.Eval</b> can carry a noticeable performance penalty over the
standard data binding syntax because it uses late-bound reflection.  Use <b>DataBinder.Eval</b> judiciously, especially when string
formatting is not required.

<p>
<!-- Databinding in a templated list -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/CS/DataBind7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind7.src"
  Icon="/quickstart/aspplus/images/databind6.gif"
  Caption="C# DataBind7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/VB/DataBind7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind7.src"
  Icon="/quickstart/aspplus/images/databind6.gif"
  Caption="VB DataBind7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/DataBind/JS/DataBind7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/DataBind/DataBind7.src"
  Icon="/quickstart/aspplus/images/databind6.gif"
  Caption="JScript DataBind7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<!--BEGIN SECTION-->
<a name="endofsection">

<h4>Section Summary</h4>
<ol>
<li>The ASP.NET declarative data binding syntax uses the &lt;%# %&gt; notation.
<li>You can bind to data sources, properties of the page or another control, collections, expressions, and results
returned from method calls.
<li>List controls can bind to collections that support the <b>ICollection</b>, <b>IEnumerable</b>, or <b>IListSource</b> interface, such as <b>ArrayList</b>, <b>Hashtable</b>,
<b>DataView</b>, and <b>DataReader</b>.
<li><b>DataBinder.Eval</b> is a static method for late binding.  Its syntax can be simpler than the standard data
binding syntax, but performance is slower.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->