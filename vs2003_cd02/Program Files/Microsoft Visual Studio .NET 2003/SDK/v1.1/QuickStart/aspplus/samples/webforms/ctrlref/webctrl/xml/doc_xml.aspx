<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>XML</h4>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with XML</span>
<p>
The <b>XML</b> control can be used to write out an XML document or the results of an XSL
Transform.  The <b>DocumentSource</b> specifies the XML document to use.  This document
will be written directly to the output stream unless <b>TransformSource</b> is also specified.
<b>TransformSource</b> must be a valid XSL Transform document and will be used to transform
the XML document before its contents are written to the output stream.  The following sample
illustrates using a simple <b>XML</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/CS/Xml1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/Xml1.src"
  Icon="/quickstart/aspplus/images/Xml1.gif"
  Caption="C# Xml1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/VB/Xml1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/Xml1.src"
  Icon="/quickstart/aspplus/images/Xml1.gif"
  Caption="VB Xml1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/JS/Xml1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/Xml1.src"
  Icon="/quickstart/aspplus/images/Xml1.gif"
  Caption="JScript Xml1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
A preloaded <b>XMLDocument</b> can be passed to the <b>Document</b> property of the <b>XML</b> control.
You can also pass a preloaded <b>XSLTransform</b> to the <b>Transform</b>
property of the <b>XML</b> control.  The following sample illustrates creating custom <b>XMLDocument</b> and <b>XSLTransform</b>
objects, then passing them into the <b>XML</b> control to be displayed.

<p>
<!--intermediate-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/CS/Xml2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/Xml2.src"
  Icon="/quickstart/aspplus/images/Xml2.gif"
  Caption="C# Xml2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/VB/Xml2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/Xml2.src"
  Icon="/quickstart/aspplus/images/Xml2.gif"
  Caption="VB Xml2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/JS/Xml2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Xml/Xml2.src"
  Icon="/quickstart/aspplus/images/Xml2.gif"
  Caption="JScript Xml2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
