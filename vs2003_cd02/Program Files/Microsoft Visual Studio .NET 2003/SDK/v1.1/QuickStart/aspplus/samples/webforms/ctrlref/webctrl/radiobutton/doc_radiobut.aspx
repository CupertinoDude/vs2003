<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>RadioButton</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with RadioButton</span>
<p>
The <b>RadioButton</b> control permits you to intersperse the radio buttons in a group with other content in
the page.  The buttons in the sample are grouped logically because they all share the same <b>GroupName</b>.<p>

<p>The following sample illustrates using the <b>RadioButton</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButton/CS/RadioButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButton/RadioButton1.src"
  Icon="/quickstart/aspplus/images/radiobutton1.gif"
  Caption="C# RadioButton1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButton/VB/RadioButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButton/RadioButton1.src"
  Icon="/quickstart/aspplus/images/radiobutton1.gif"
  Caption="VB RadioButton1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButton/JS/RadioButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RadioButton/RadioButton1.src"
  Icon="/quickstart/aspplus/images/radiobutton1.gif"
  Caption="JScript RadioButton1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
