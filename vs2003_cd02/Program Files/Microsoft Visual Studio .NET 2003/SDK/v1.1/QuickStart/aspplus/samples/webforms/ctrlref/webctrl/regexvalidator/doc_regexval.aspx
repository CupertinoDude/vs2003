<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>RegularExpressionValidator</h4>

<div class="indent" style="width:660">
For a detailed discussion of Web Forms validation, see 
<a href="/quickstart/aspplus/doc/webvalidation.aspx">Server Control Form Validation</a>.
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with RegularExpressionValidator</span>
<p>
The <b>RegularExpressionValidator</b> control confirms that the entry matches a pattern defined by a
regular expression. This type of validation allows you to check for predictable sequences of characters,
such as those in social security numbers, e-mail addresses, telephone numbers, postal codes, and so on.

<p>
<b>RegularExpressionValidator</b> uses two key properties to perform its validation:  <b>ControlToValidate</b> contains
the value to validate, and  <b>ValidationExpression</b> contains the regular expression to match.

<p>The following sample illustrates using the <b>RegularExpressionValidator</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RegExValidator/CS/RegExValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RegExValidator/RegExValidator1.src"
  Icon="/quickstart/aspplus/images/Validator6.gif"
  Caption="C# RegularExValidator1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RegExValidator/VB/RegExValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RegExValidator/RegExValidator1.src"
  Icon="/quickstart/aspplus/images/Validator6.gif"
  Caption="VB RegularExValidator1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RegExValidator/JS/RegExValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RegExValidator/RegExValidator1.src"
  Icon="/quickstart/aspplus/images/Validator6.gif"
  Caption="JScript RegularExValidator1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
