<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlSelect</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlSelect</span>
<p>The <b>HtmlSelect</b> control provides a drop-down list.  The following sample illustrates using the <b>HtmlSelect</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/CS/HtmlSelect1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/HtmlSelect1.src"
  Icon="/quickstart/aspplus/images/htmlselect1.gif"
  Caption="C# HtmlSelect1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/VB/HtmlSelect1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/HtmlSelect1.src"
  Icon="/quickstart/aspplus/images/htmlselect1.gif"
  Caption="VB HtmlSelect1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/JS/HtmlSelect1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/HtmlSelect1.src"
  Icon="/quickstart/aspplus/images/htmlselect1.gif"
  Caption="JScript HtmlSelect1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<p>The following sample illustrates using data binding with an <b>HtmlSelect</b> control.

<p>
<!--databinding-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/CS/HtmlSelect2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/HtmlSelect2.src"
  Icon="/quickstart/aspplus/images/htmlselect2.gif"
  Caption="C# HtmlSelect2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/VB/HtmlSelect2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/HtmlSelect2.src"
  Icon="/quickstart/aspplus/images/htmlselect2.gif"
  Caption="VB HtmlSelect2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/JS/HtmlSelect2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlSelect/HtmlSelect2.src"
  Icon="/quickstart/aspplus/images/htmlselect2.gif"
  Caption="JScript HtmlSelect2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
