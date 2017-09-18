<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>CustomValidator</h4>

<div class="indent" style="width:660">
For a detailed discussion of Web Forms validation, please see the
<a href="/quickstart/aspplus/doc/webvalidation.aspx">Server Control Form Validation</a>
section of this QuickStart.
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with CustomValidator</span>

<p>
The <b>CustomValidator</b> control calls a user-defined function to perform validations that the standard
validators can't handle. The custom function can execute on the server or in client-side script, such as JScript
or VBScript. For client-side custom validation, the name of the custom function must be identified in the
<b>ClientValidationFunction</b> property. The custom function must have the form <xmp>   function myvalidator(source, arguments)</xmp>
Note that <b>source</b> is the client-side <b>CustomValidator</b> object, and <b>arguments</b> is an object with two properties,
<b>Value</b> and <b>IsValid</b>.  The <b>Value</b> property is the value to be validated and the <b>IsValid</b> property is a
Boolean used to set the return result of the validation.  You can view a client-side validation example in the <a href="/quickstart/aspplus/doc/WebValidation.aspx">ASP.NET Validation</a>
section.
<p>
For server-side custom validation, place your custom validation in the validator's <b>OnServerValidate</b> delegate.
<p>
The following sample illustrates using the <b>CustomValidator</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CustomValidator/CS/CustomValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CustomValidator/CustomValidator1.src"
  Icon="/quickstart/aspplus/images/Validator8.gif"
  Caption="C# CustomValidator1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CustomValidator/VB/CustomValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CustomValidator/CustomValidator1.src"
  Icon="/quickstart/aspplus/images/Validator8.gif"
  Caption="VB CustomValidator1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CustomValidator/JS/CustomValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CustomValidator/CustomValidator1.src"
  Icon="/quickstart/aspplus/images/Validator8.gif"
  Caption="JScript CustomValidator1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
