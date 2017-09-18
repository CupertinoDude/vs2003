<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlInputCheckBox</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlInputCheckBox</span>
<p>
The <b>HtmlInputCheckBox</b> control accepts Boolean (<b>true</b>/<b>false</b>) input.  When selected, its <b>Checked</b> property
is <b>true</b>. The following sample illustrates using the <b>HtmlInputCheckBox</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputCheckBox/CS/HtmlInputCheckBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputCheckBox/HtmlInputCheckBox1.src"
  Icon="/quickstart/aspplus/images/htmlinputcheckbox1.gif"
  Caption="C# HtmlInputCheckBox1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputCheckBox/VB/HtmlInputCheckBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputCheckBox/HtmlInputCheckBox1.src"
  Icon="/quickstart/aspplus/images/htmlinputcheckbox1.gif"
  Caption="VB HtmlInputCheckBox1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputCheckBox/JS/HtmlInputCheckBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputCheckBox/HtmlInputCheckBox1.src"
  Icon="/quickstart/aspplus/images/htmlinputcheckbox1.gif"
  Caption="JScript HtmlInputCheckBox1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
