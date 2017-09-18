<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlForm</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlForm</span>
<p>An <b>HtmlForm</b> control is required to process postback requests.  A Web Forms page might only
have one server side <b>&lt;form&gt;</b> tag; however, client forms (no <b>runat=server</b> attribute)
can also postback to server-side logic as long as a server-side form is present on the
page.</p>

<p>The following sample illustrates using the <b>HtmlForm</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlForm/CS/HtmlForm1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlForm/HtmlForm1.src"
  Icon="/quickstart/aspplus/images/htmlform1.gif"
  Caption="C# HtmlForm1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlForm/VB/HtmlForm1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlForm/HtmlForm1.src"
  Icon="/quickstart/aspplus/images/htmlform1.gif"
  Caption="VB HtmlForm1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlForm/JS/HtmlForm1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlForm/HtmlForm1.src"
  Icon="/quickstart/aspplus/images/htmlform1.gif"
  Caption="JScript HtmlForm1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
