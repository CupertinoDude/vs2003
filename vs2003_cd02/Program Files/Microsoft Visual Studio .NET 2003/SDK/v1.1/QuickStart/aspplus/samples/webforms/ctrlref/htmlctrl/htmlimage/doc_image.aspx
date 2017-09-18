<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlImage</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlImage</span>
<p>An <b>HtmlImage</b> control renders the image file specified by its <b>Src</b> property in an HTML <b>&lt;img&gt;</b> tag.

<p>The following sample illustrates using the <b>HtmlImage</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlImage/CS/HtmlImage1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlImage/HtmlImage1.src"
  Icon="/quickstart/aspplus/images/htmlimage1.gif"
  Caption="C# HtmlImage1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlImage/VB/HtmlImage1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlImage/HtmlImage1.src"
  Icon="/quickstart/aspplus/images/htmlimage1.gif"
  Caption="VB HtmlImage1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlImage/JS/HtmlImage1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlImage/HtmlImage1.src"
  Icon="/quickstart/aspplus/images/htmlimage1.gif"
  Caption="JScript HtmlImage1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
