<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>ValidationSummary</h4>

<div class="indent" style="width:660">
For a detailed discussion of Web Forms validation, see
<a href="/quickstart/aspplus/doc/webvalidation.aspx">Server Control Form Validation</a>.
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with ValidationSummary</span>
<p>
When the user's input is processed (for example, when the form is submitted), the Web Forms framework passes
the user's entry to the associated validation control or controls. The validation controls test the user's input
and set a property to indicate whether the entry passed the validation test. After all validation controls have
been processed, the <b>IsValid</b> property on the page is set; if any of the controls shows
that a validation check failed, the entire page is set to invalid.
<p>

<p>
A <b>ValidationSummary</b> control is displayed when the <b>IsValid</b> property of the page is false.  It "polls" each of the
validation controls on the page and aggregates the text messages exposed by each.  The following  sample illustrates
displaying errors with a <b>ValidationSummary</b>.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ValidationSummary/CS/ValidationSummary1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ValidationSummary/ValidationSummary1.src"
  Icon="/quickstart/aspplus/images/validator3.gif"
  Caption="C# ValidationSummary1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ValidationSummary/VB/ValidationSummary1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ValidationSummary/ValidationSummary1.src"
  Icon="/quickstart/aspplus/images/validator3.gif"
  Caption="VB ValidationSummary1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ValidationSummary/JS/ValidationSummary1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ValidationSummary/ValidationSummary1.src"
  Icon="/quickstart/aspplus/images/validator3.gif"
  Caption="JScript ValidationSummary1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
