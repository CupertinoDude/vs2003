<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>Label</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with Label</span>
<p>
The <b>Label</b> control displays text in a set location on the page.  Unlike static text, the <b>Text</b>
property of a label can be set programmatically.  The following sample illustrates using the <b>Label</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Label/CS/Label1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Label/Label1.src"
  Icon="/quickstart/aspplus/images/label1.gif"
  Caption="C# Label1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Label/VB/Label1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Label/Label1.src"
  Icon="/quickstart/aspplus/images/label1.gif"
  Caption="VB Label1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Label/JS/Label1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Label/Label1.src"
  Icon="/quickstart/aspplus/images/label1.gif"
  Caption="JScript Label1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
