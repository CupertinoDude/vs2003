<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlInputText</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlInputText (Text and Password)</span>
<p>The <b>HtmlInputText</b> control is a single-line input control that lets the user enter text.  <b>HtmlInputText</b>
supports two behaviors.  If <b>Type</b> is <b>Text</b>, <b>HtmlInputText</b> operates as a standard text box.  If <b>Type</b> is
<b>Password</b>, the user's input is masked by the "*" character to keep it private.

<p>The following sample illustrates using the <b>HtmlInputText</b> control in both <b>Text</b> and <b>Password</b> modes.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputText/CS/HtmlInputText1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputText/HtmlInputText1.src"
  Icon="/quickstart/aspplus/images/htmlinputtext1.gif"
  Caption="C# HtmlInputText1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputText/VB/HtmlInputText1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputText/HtmlInputText1.src"
  Icon="/quickstart/aspplus/images/htmlinputtext1.gif"
  Caption="VB HtmlInputText1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputText/JS/HtmlInputText1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputText/HtmlInputText1.src"
  Icon="/quickstart/aspplus/images/htmlinputtext1.gif"
  Caption="JScript HtmlInputText1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->