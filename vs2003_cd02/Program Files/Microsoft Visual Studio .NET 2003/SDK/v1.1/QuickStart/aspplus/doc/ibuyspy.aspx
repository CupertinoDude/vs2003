<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">IBuySpy.com</span>

<p>The IBuySpy ASP.NET sample application was built to show how you can use the new Microsoft .NET Framework and ASP.NET to build a full-featured e-commerce application. It
offers all the functionality of typical shopping applications, including product searches,
shopping cart management, user login and registration, and even the ability to view and edit your
own product reviews.
<p>
Portions of IBuySpy were designed and developed by Vertigo Software, Inc.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="http://www.ibuyspy.com"
  Icon="/quickstart/aspplus/images/ibuyspy.gif"
  Caption="IBuySpy.com"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="http://www.ibuyspy.com"
  Icon="/quickstart/aspplus/images/ibuyspy.gif"
  Caption="IBuySpy.com"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="http://www.ibuyspy.com"
  Icon="/quickstart/aspplus/images/ibuyspy.gif"
  Caption="IBuySpy.com"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->