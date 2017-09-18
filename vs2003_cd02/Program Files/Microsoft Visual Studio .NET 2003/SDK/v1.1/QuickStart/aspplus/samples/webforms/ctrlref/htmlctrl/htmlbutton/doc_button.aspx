<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlButton</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlButton</span>
<p>
The <b>HtmlButton</b> control renders as an HTML 4.0 <b>&lt;button&gt;</b>.  This differs from <a href=
"/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/doc_inputbut.aspx">
&lt;input type="button"&gt;</a> in that it enables Web developers to create rich user interface form buttons
that can be composed from embedded HTML elements (and even other ASP.NET server controls).

<p>The following sample illustrates using the <b>HtmlButton</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlButton/CS/HtmlButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlButton/HtmlButton1.src"
  Icon="/quickstart/aspplus/images/htmlbutton1.gif"
  Caption="C# HtmlButton1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlButton/VB/HtmlButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlButton/HtmlButton1.src"
  Icon="/quickstart/aspplus/images/htmlbutton1.gif"
  Caption="VB HtmlButton1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlButton/JS/HtmlButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlButton/HtmlButton1.src"
  Icon="/quickstart/aspplus/images/htmlbutton1.gif"
  Caption="JScript HtmlButton1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
