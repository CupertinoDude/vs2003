<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>RadioButtonList</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with RadioButtonList</span>
<p>
The <b>RadioButtonList</b> control provides a single-selection checked list.  Like other list controls, <b>RadioButtonList</b>
has an <b>Items</b> collection with members that correspond to each item in the list.  To determine which items are
selected, test the <b>Selected</b> property of each item.

<p>You can control the rendering of the list with the <b>RepeatLayout</b> and <b>RepeatDirection</b> properties.  If the value of 
<b>RepeatLayout</b> is <b>Table</b>, the list will be rendered in a table.  If it is set to <b>Flow</b>, the list will be rendered
without any table structure.  By default, the value of <b>RepeatDirection</b> is <b>Vertical</b>.  Setting this property to <b>Horizontal</b> 
causes the list to be rendered horizontally.

<p>
The following sample illustrates using the <b>RadioButtonList</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButtonList/CS/RadioButtonList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButtonList/RadioButtonList1.src"
  Icon="/quickstart/aspplus/images/radiobuttonlist1.gif"
  Caption="C# RadioButtonList1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButtonList/VB/RadioButtonList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButtonList/RadioButtonList1.src"
  Icon="/quickstart/aspplus/images/radiobuttonlist1.gif"
  Caption="VB RadioButtonList1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButtonList/JS/RadioButtonList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButtonList/RadioButtonList1.src"
  Icon="/quickstart/aspplus/images/radiobuttonlist1.gif"
  Caption="JScript RadioButtonList1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
