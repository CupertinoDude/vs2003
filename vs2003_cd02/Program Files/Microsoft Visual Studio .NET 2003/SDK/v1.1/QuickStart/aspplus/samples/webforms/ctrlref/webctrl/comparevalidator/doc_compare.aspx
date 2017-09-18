<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>CompareValidator</h4>

<div class="indent" style="width:660">
For a detailed discussion of Web Forms validation, please see the
<a href="/quickstart/aspplus/doc/webvalidation.aspx">Server Control Form Validation</a>
section of this QuickStart.
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with CompareValidator</span>
<p>
The <b>CompareValidator</b> control compares the value of one control to another, or to an explicit value
in the control's <b>ValueToCompare</b> property.  
<p>
<b>Note:</b> For the purpose of validation, a specific
property on the control is designated as its "value".  For more information, see the Server Control Form Validation section.

<p>
<b>CompareValidator</b> uses three key properties to perform its validation.  <b>ControlToValidate</b> and <b>ControlToCompare</b>
contain the values to compare.  <b>Operator</b> defines the type of comparison to perform, for example, Equal or Not
Equal.  <b>CompareValidator</b> performs the validation by evaluating these properties as an expression, as shown in the following example.
<xmp>   <ControlToValidate> <Operator> <ControlToCompare> </xmp>

If the expression evaluates <b>true</b>, the validation result is valid.

<p>
The following sample illustrates using the <b>CompareValidator</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CompareValidator/CS/CompareValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CompareValidator/CompareValidator1.src"
  Icon="/quickstart/aspplus/images/comparevalidator1.gif"
  Caption="C# CompareValidator1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CompareValidator/VB/CompareValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CompareValidator/CompareValidator1.src"
  Icon="/quickstart/aspplus/images/comparevalidator1.gif"
  Caption="VB CompareValidator1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CompareValidator/JS/CompareValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/CompareValidator/CompareValidator1.src"
  Icon="/quickstart/aspplus/images/comparevalidator1.gif"
  Caption="JScript CompareValidator1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
