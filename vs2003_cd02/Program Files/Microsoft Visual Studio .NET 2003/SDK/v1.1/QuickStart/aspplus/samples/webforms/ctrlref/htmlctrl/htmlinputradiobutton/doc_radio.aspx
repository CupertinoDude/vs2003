<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlInputRadioButton</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlInputRadioButton</span>
<p>An <b>HtmlInputRadioButton</b> control creates a single radio button input field.   Setting the <b>Name</b>
attribute the same way on each radio button forms a group in which only one radio button can be selected at a time.
The selected state must be tested on the individual radio buttons, however.</p>

<p>The following sample illustrates using the <b>HtmlInputRadioButton</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputRadioButton/CS/HtmlInputRadioButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputRadioButton/HtmlInputRadioButton1.src"
  Icon="/quickstart/aspplus/images/htmlinputradiobutton1.gif"
  Caption="C# HtmlInputRadioButton1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputRadioButton/VB/HtmlInputRadioButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputRadioButton/HtmlInputRadioButton1.src"
  Icon="/quickstart/aspplus/images/htmlinputradiobutton1.gif"
  Caption="VB HtmlInputRadioButton1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputRadioButton/JS/HtmlInputRadioButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputRadioButton/HtmlInputRadioButton1.src"
  Icon="/quickstart/aspplus/images/htmlinputradiobutton1.gif"
  Caption="JScript HtmlInputRadioButton1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>



<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
