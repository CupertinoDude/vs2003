<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlTextArea</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlTextArea</span>
<p>The <b>HtmlTextArea</b> control is a multiline input control that lets the user enter text.  The display
width of <b>HtmlTextArea</b> is determined by its <b>Cols</b> property, and the display height is determined
by the <b>Rows</b> property.

<p>The following sample illustrates using the <b>HtmlTextArea</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTextArea/CS/HtmlTextArea1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTextArea/HtmlTextArea1.src"
  Icon="/quickstart/aspplus/images/htmltextarea1.gif"
  Caption="C# HtmlTextArea1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTextArea/VB/HtmlTextArea1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTextArea/HtmlTextArea1.src"
  Icon="/quickstart/aspplus/images/htmltextarea1.gif"
  Caption="VB HtmlTextArea1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTextArea/JS/HtmlTextArea1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTextArea/HtmlTextArea1.src"
  Icon="/quickstart/aspplus/images/htmltextarea1.gif"
  Caption="JScript HtmlTextArea1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
