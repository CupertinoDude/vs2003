<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>CheckBox</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with CheckBox</span>
<p>
The <b>CheckBox</b> server control accepts Boolean (<b>true</b> or <b>false</b>) input.  When selected, its <b>Checked</b> property is <b>true</b>.
Typically a check box is processed as one of several fields in a form; however, it can be used to trigger postback to
the server if its <b>AutoPostBack</b> property is <b>true</b>.  The following sample illustrates using the <b>CheckBox</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBox/CS/CheckBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBox/CheckBox1.src"
  Icon="/quickstart/aspplus/images/checkbox1.gif"
  Caption="C# CheckBox1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBox/VB/CheckBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBox/CheckBox1.src"
  Icon="/quickstart/aspplus/images/checkbox1.gif"
  Caption="VB CheckBox1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBox/JS/CheckBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CheckBox/CheckBox1.src"
  Icon="/quickstart/aspplus/images/checkbox1.gif"
  Caption="JScript CheckBox1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
