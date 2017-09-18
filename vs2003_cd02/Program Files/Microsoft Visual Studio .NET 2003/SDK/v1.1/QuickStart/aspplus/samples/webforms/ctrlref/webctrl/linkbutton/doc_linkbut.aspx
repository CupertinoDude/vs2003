<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>LinkButton</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with LinkButton</span>
<p>Like the <b>Button</b> control, <b>LinkButton</b> is used to post a Web Forms page back to the server.  For additional button
examples, see <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/button/doc_button.aspx">
Button</a> and <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/imagebutton/doc_imagebut.aspx">
ImageButton</a>.  For a control that navigates to another page, see <a
href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/hyperlink/doc_hyperlink.aspx">
HyperLink</a>.

<p>The following sample illustrates using the <b>LinkButton</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/LinkButton/CS/LinkButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/LinkButton/LinkButton1.src"
  Icon="/quickstart/aspplus/images/linkbutton1.gif"
  Caption="C# LinkButton1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/LinkButton/VB/LinkButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/LinkButton/LinkButton1.src"
  Icon="/quickstart/aspplus/images/linkbutton1.gif"
  Caption="VB LinkButton1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/LinkButton/JS/LinkButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/LinkButton/LinkButton1.src"
  Icon="/quickstart/aspplus/images/linkbutton1.gif"
  Caption="JScript LinkButton1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
