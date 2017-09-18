<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">HTML Text Pattern Matching</span>

<p>This example demonstrates how to create a client proxy for any URI that serves up text. Instead
of authoring the .asmx file, you can create a WSDL file that describes an HTML
(or XML or any other nonbinary format) page you currently offer. The WSDL can be
used to generate a client proxy, using the WSDL.exe command line tool that 
will use RegEx to parse the named HTML page and extract values.</p>

<p>You can do this by adding &lt;Match&gt; tags in the Response section of the WSDL. These
tags take an attribute called <b>pattern</b>, which is the Regular Expression that
corresponds to the piece of text on the page that is the property's value. (Note: the
property from the proxy class is read-only.)</p>

<p>The consuming code can then create the object, access the <b>Matches</b> object that is
returned by the functioned name in the WSDL, and gain access to any piece of
the HTML as a property. No understanding of WSDL, regular expressions, or even HTML is
needed to use the proxy class. It behaves like any other .NET Framework class would.</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/TextMatching/CS/MatchClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/TextMatching/MatchService.src"
  Icon="/quickstart/aspplus/images/matchservice_client.gif"
  Caption="C# MatchClient.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/TextMatching/VB/MatchClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/TextMatching/MatchService.src"
  Icon="/quickstart/aspplus/images/matchservice_client.gif"
  Caption="VB MatchClient.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/TextMatching/JS/MatchClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/TextMatching/MatchService.src"
  Icon="/quickstart/aspplus/images/matchservice_client.gif"
  Caption="JScript MatchClient.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->