<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlGenericControl</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlGenericControl</span>
<p> The <b>HtmlGenericControl</b> provides an ASP.NET server control implementation for all unknown HTML server control
tags not directly represented by a specific HTML server control (for example, <b>&lt;span&gt;</b>, <b>&lt;div&gt;</b>,
<b>&lt;body&gt;</b>, and so on).</p>

<p>The following sample illustrates using the <b>HtmlGenericControl</b> control for the <b>&lt;body&gt;</b> tag.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlGenericControl/CS/HtmlGenericControl1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlGenericControl/HtmlGenericControl1.src"
  Icon="/quickstart/aspplus/images/htmlgenericcontrol1.gif"
  Caption="C# HtmlGenericControl1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlGenericControl/VB/HtmlGenericControl1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlGenericControl/HtmlGenericControl1.src"
  Icon="/quickstart/aspplus/images/htmlgenericcontrol1.gif"
  Caption="VB HtmlGenericControl1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlGenericControl/JS/HtmlGenericControl1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlGenericControl/HtmlGenericControl1.src"
  Icon="/quickstart/aspplus/images/htmlgenericcontrol1.gif"
  Caption="JScript HtmlGenericControl1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
