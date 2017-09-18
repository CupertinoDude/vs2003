<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlInputImage</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlInputImage</span>
<p>An <b>HtmlInputImage</b> control is used to create a graphical button.  Unlike <b>HtmlButton</b> controls,
all standard browser clients support image buttons.

<p>The following sample illustrates using the <b>HtmlInputImage</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputImage/CS/HtmlInputImage1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputImage/HtmlInputImage1.src"
  Icon="/quickstart/aspplus/images/htmlinputimage1.gif"
  Caption="C# HtmlInputImage1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputImage/VB/HtmlInputImage1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputImage/HtmlInputImage1.src"
  Icon="/quickstart/aspplus/images/htmlinputimage1.gif"
  Caption="VB HtmlInputImage1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputImage/JS/HtmlInputImage1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputImage/HtmlInputImage1.src"
  Icon="/quickstart/aspplus/images/htmlinputimage1.gif"
  Caption="JScript HtmlInputImage1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
