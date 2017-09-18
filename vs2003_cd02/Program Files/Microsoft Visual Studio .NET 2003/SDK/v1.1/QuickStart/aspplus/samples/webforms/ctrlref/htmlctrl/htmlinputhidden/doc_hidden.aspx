<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlInputHidden</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlInputHidden</span>
<p>You can use hidden controls within HTML forms to embed non-visible information that will be sent back to the
server the next time a user performs a postback.  This technique is commonly used to persist session-dependent
information without using cookies or session state.   The Web Forms framework uses this feature of
HTML to automatically store and restore the view state of ASP.NET server controls across round trips to the server. <p>

<p>The following sample illustrates using the <b>HtmlInputHidden</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputHidden/CS/HtmlInputHidden1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputHidden/HtmlInputHidden1.src"
  Icon="/quickstart/aspplus/images/htmlinputhidden1.gif"
  Caption="C# HtmlInputHidden1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputHidden/VB/HtmlInputHidden1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputHidden/HtmlInputHidden1.src"
  Icon="/quickstart/aspplus/images/htmlinputhidden1.gif"
  Caption="VB HtmlInputHidden1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputHidden/JS/HtmlInputHidden1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputHidden/HtmlInputHidden1.src"
  Icon="/quickstart/aspplus/images/htmlinputhidden1.gif"
  Caption="JScript HtmlInputHidden1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
