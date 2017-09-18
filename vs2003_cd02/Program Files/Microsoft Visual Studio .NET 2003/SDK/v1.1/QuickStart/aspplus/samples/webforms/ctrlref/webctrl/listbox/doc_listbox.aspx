<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>ListBox</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with ListBox</span>
<p>The <b>ListBox</b> control provides a single-selection or multiple-selection list.  To enable multiple selection, set the <b>
SelectionMode</b> property to <b>Multiple</b>.
<p>The following sample illustrates using a simple <b>ListBox</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/CS/ListBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/ListBox1.src"
  Icon="/quickstart/aspplus/images/listbox1.gif"
  Caption="C# ListBox1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/VB/ListBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/ListBox1.src"
  Icon="/quickstart/aspplus/images/listbox1.gif"
  Caption="VB ListBox1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/JS/ListBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/ListBox1.src"
  Icon="/quickstart/aspplus/images/listbox1.gif"
  Caption="JScript ListBox1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<p>The following sample illustrates using data binding with a <b>ListBox</b> control.

<p>
<!--DataBinding-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/CS/ListBox2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/ListBox2.src"
  Icon="/quickstart/aspplus/images/listbox2.gif"
  Caption="C# ListBox2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/VB/ListBox2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/ListBox2.src"
  Icon="/quickstart/aspplus/images/listbox2.gif"
  Caption="VB ListBox2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/JS/ListBox2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ListBox/ListBox2.src"
  Icon="/quickstart/aspplus/images/listbox2.gif"
  Caption="JScript ListBox2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
