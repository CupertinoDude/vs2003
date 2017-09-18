<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>CheckBoxList</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with CheckBoxList</span>
<p>
The <b>CheckBoxList</b> control provides a multiple-selection checked list.  Like other list controls, <b>CheckBoxList</b>
has an <b>Items</b> collection with members that correspond to each item in the list.  To determine which items are
selected, test the <b>Selected</b> property of each item.

<p>You can control the rendering of the list with the <b>RepeatLayout</b> and <b>RepeatDirection</b> properties.  If
<b>RepeatLayout</b> is <b>Table</b>, the list is rendered within a table.  If it is set to <b>Flow</b>, the list is rendered
without any table structure.  By default, <b>RepeatDirection</b> is <b>Vertical</b>.  Setting this property to <b>Horizontal</b> 
causes the list to be rendered horizontally.

<p>
The following sample illustrates using the <b>CheckBoxList</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBoxList/CS/CheckBoxList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBoxList/CheckBoxList1.src"
  Icon="/quickstart/aspplus/images/checkboxlist1.gif"
  Caption="C# CheckBoxList1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBoxList/VB/CheckBoxList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBoxList/CheckBoxList1.src"
  Icon="/quickstart/aspplus/images/checkboxlist1.gif"
  Caption="VB CheckBoxList1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBoxList/JS/CheckBoxList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBoxList/CheckBoxList1.src"
  Icon="/quickstart/aspplus/images/checkboxlist1.gif"
  Caption="JScript CheckBoxList1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
