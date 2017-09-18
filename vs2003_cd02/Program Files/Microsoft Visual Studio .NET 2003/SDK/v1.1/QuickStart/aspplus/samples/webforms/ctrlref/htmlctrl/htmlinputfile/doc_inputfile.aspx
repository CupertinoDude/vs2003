<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlInputFile</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlInputFile</span>
<p>An <b>HtmlInputFile</b> control handles uploading of binary or text files from a client browser to the server.
File-upload works with all HTML 3.2 and later Web clients.  Note that the <b>Enctype</b> attribute on the
<b>&lt;form&gt;</b> tag must be set to <b>"multipart/form-data"</b>.<p>


<p>The following sample illustrates using the <b>HtmlInputFile</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputFile/CS/HtmlInputFile1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputFile/HtmlInputFile1.src"
  Icon="/quickstart/aspplus/images/htmlinputfile1.gif"
  Caption="C# HtmlInputFile1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputFile/VB/HtmlInputFile1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputFile/HtmlInputFile1.src"
  Icon="/quickstart/aspplus/images/htmlinputfile1.gif"
  Caption="VB HtmlInputFile1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputFile/JS/HtmlInputFile1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputFile/HtmlInputFile1.src"
  Icon="/quickstart/aspplus/images/htmlinputfile1.gif"
  Caption="JScript HtmlInputFile1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->

