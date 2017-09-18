<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>Image</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with Image</span>
<p>
The <b>Image</b> control displays the image defined by its <b>ImageUrl</b> property.  The following sample illustrates using the
<b>Image</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Image/CS/Image1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Image/Image1.src"
  Icon="/quickstart/aspplus/images/image1.gif"
  Caption="C# Image1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Image/VB/Image1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Image/Image1.src"
  Icon="/quickstart/aspplus/images/image1.gif"
  Caption="VB Image1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Image/JS/Image1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Image/Image1.src"
  Icon="/quickstart/aspplus/images/image1.gif"
  Caption="JScript Image1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
