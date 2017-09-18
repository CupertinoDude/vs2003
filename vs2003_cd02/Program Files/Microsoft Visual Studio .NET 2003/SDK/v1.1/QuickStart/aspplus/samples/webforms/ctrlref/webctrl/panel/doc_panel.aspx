<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>Panel</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with Panel</span>
<p>
The <b>Panel</b> control is a container for other controls.  It is especially useful when you want to
generate controls programmatically or hide or show a group of controls, as shown in the following example.
<p>

<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Panel/CS/Panel1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Panel/Panel1.src"
  Icon="/quickstart/aspplus/images/panel1.gif"
  Caption="C# Panel1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Panel/VB/Panel1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Panel/Panel1.src"
  Icon="/quickstart/aspplus/images/panel1.gif"
  Caption="VB Panel1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Panel/JS/Panel1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Panel/Panel1.src"
  Icon="/quickstart/aspplus/images/panel1.gif"
  Caption="JScript Panel1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
