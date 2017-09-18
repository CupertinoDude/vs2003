<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HyperLink</h4>

<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#working">Working With HyperLink</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#databind">DataBinding HyperLink</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="working">
<span class="subhead">Working with HyperLink</span>
<p>The <b>HyperLink</b> control is used to navigate from the client to another page.</p>

<p>The following sample illustrates using a simple <b>HyperLink</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/CS/HyperLink1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/HyperLink1.src"
  Icon="/quickstart/aspplus/images/hyperlink1.gif"
  Caption="C# HyperLink1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/VB/HyperLink1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/HyperLink1.src"
  Icon="/quickstart/aspplus/images/hyperlink1.gif"
  Caption="VB HyperLink1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/JS/HyperLink1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/HyperLink1.src"
  Icon="/quickstart/aspplus/images/hyperlink1.gif"
  Caption="JScript HyperLink1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--DataBound-->
<p>
<a name="databind">
<span class="subhead">Data Binding HyperLink</span>
<p>The <b>HyperLink</b> control supports data binding to its <b>Text</b> and
<b>NavigateUrl</b> properties, as shown by the following example.</p>

<p>
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/CS/HyperLink2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/HyperLink2.src"
  Icon="/quickstart/aspplus/images/hyperlink2.gif"
  Caption="C# HyperLink2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/VB/HyperLink2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/HyperLink2.src"
  Icon="/quickstart/aspplus/images/hyperlink2.gif"
  Caption="VB HyperLink2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/JS/HyperLink2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/HyperLink/HyperLink2.src"
  Icon="/quickstart/aspplus/images/hyperlink2.gif"
  Caption="JScript HyperLink2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
