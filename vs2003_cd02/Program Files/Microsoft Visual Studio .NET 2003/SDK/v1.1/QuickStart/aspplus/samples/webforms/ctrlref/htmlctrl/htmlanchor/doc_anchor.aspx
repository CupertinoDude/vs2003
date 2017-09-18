<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlAnchor</h4>

<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#working">Working With HtmlAnchor</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#databind">DataBinding HtmlAnchor</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="working">
<span class="subhead">Working with HtmlAnchor</span>
<p>The following sample illustrates using the <b>HtmlAnchor</b> control (<b>&lt;a&gt;</b>).  <b>HtmlAnchor</b> is used
to navigate from the client page to another page.<p>

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/CS/HtmlAnchor1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/HtmlAnchor1.src"
  Icon="/quickstart/aspplus/images/htmlanchor1.gif"
  Caption="C# HtmlAnchor1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/VB/HtmlAnchor1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/HtmlAnchor1.src"
  Icon="/quickstart/aspplus/images/htmlanchor1.gif"
  Caption="VB HtmlAnchor1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/JS/HtmlAnchor1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/HtmlAnchor1.src"
  Icon="/quickstart/aspplus/images/htmlanchor1.gif"
  Caption="JScript HtmlAnchor1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--DataBound-->
<p>
<a name="databind">
<span class="subhead">DataBinding HtmlAnchor</span>
<p>The <b>HtmlAnchor</b> control supports data binding to its <b>HRef</b> and
<b>InnerHtml</b> properties, as shown by the following example.</p>

<p>
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/CS/HtmlAnchor2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/HtmlAnchor2.src"
  Icon="/quickstart/aspplus/images/htmlanchor2.gif"
  Caption="C# HtmlAnchor2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/VB/HtmlAnchor2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/HtmlAnchor2.src"
  Icon="/quickstart/aspplus/images/htmlanchor2.gif"
  Caption="VB HtmlAnchor2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/JS/HtmlAnchor2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlAnchor/HtmlAnchor2.src"
  Icon="/quickstart/aspplus/images/htmlanchor2.gif"
  Caption="JScript HtmlAnchor2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
