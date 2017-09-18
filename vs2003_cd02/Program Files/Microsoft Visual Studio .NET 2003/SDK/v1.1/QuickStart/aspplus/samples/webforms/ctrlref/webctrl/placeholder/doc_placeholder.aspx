<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>PlaceHolder</h4>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with PlaceHolder</span>
<p>
The <b>PlaceHolder</b> control can be used as a container control within a document
to dynamically load other controls.  The <b>PlaceHolder</b> control has no HTML-based output
and is used only to mark a spot for other controls that can be added to the <b>Controls</b>
collection of the <b>PlaceHolder</b> during page execution.  The following example illustrates
adding controls to a <b>PlaceHolder</b>.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/PlaceHolder/CS/PlaceHolder1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/PlaceHolder/PlaceHolder1.src"
  Icon="/quickstart/aspplus/images/PlaceHolder1.gif"
  Caption="C# PlaceHolder1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/PlaceHolder/VB/PlaceHolder1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/PlaceHolder/PlaceHolder1.src"
  Icon="/quickstart/aspplus/images/PlaceHolder1.gif"
  Caption="VB PlaceHolder1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/PlaceHolder/JS/PlaceHolder1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/PlaceHolder/PlaceHolder1.src"
  Icon="/quickstart/aspplus/images/PlaceHolder1.gif"
  Caption="JScript PlaceHolder1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
